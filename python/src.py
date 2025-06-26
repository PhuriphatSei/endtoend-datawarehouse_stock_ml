import pyodbc
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error, mean_absolute_error
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense
import warnings
from datetime import datetime
warnings.filterwarnings('ignore')

# Database configuration
db_config = {
    'server': 'server name',
    'database': 'database name'
}

# Stock queries mapping
stock_queries = {
    'AAPL': "SELECT * FROM gold.fact_stock_prices WHERE source_table = 'AAPL' ORDER BY trade_date ASC",
    'AMZN': "SELECT * FROM gold.fact_stock_prices WHERE source_table = 'AMZN' ORDER BY trade_date ASC",
    'GOOGL': "SELECT * FROM gold.fact_stock_prices WHERE source_table = 'GOOGL' ORDER BY trade_date ASC",
    'META': "SELECT * FROM gold.fact_stock_prices WHERE source_table = 'META' ORDER BY trade_date ASC",
    'MSFT': "SELECT * FROM gold.fact_stock_prices WHERE source_table = 'MSFT' ORDER BY trade_date ASC",
    'NVDA': "SELECT * FROM gold.fact_stock_prices WHERE source_table = 'NVDA' ORDER BY trade_date ASC",
    'TSLA': "SELECT * FROM gold.fact_stock_prices WHERE source_table = 'TSLA' ORDER BY trade_date ASC"
}

# Angel stocks information
angel_stocks = {
    'AAPL': 'Apple Inc.',
    'MSFT': 'Microsoft Corp.',
    'GOOGL': 'Alphabet Inc.',
    'TSLA': 'Tesla Inc.',
    'NVDA': 'NVIDIA Corp.',
    'META': 'Meta Platforms Inc.',
    'AMZN': 'Amazon.com Inc.'
}

print("🌟 7 Angel Stocks LSTM Prediction 🌟")
print("=" * 50)
print("📊 Data Source: SQL Server Database")
print(f"🔗 Server: {db_config['server']}")
print(f"🗄️ Database: {db_config['database']}")
print("=" * 50)

# ฟังก์ชันสำหรับเชื่อมต่อฐานข้อมูล
def connect_to_database():
    try:
        connection_string = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={db_config['server']};DATABASE={db_config['database']};Trusted_Connection=yes;"
        conn = pyodbc.connect(connection_string)
        print("✅ Database connection successful!")
        return conn
    except Exception as e:
        print(f"❌ Database connection failed: {str(e)}")
        return None

# ฟังก์ชันสำหรับดึงข้อมูลจากฐานข้อมูล
def fetch_stock_data(conn, symbol):
    try:
        query = stock_queries[symbol]
        print(f"📥 Fetching data for {symbol}...")
        df = pd.read_sql(query, conn)

        if 'trade_date' not in df.columns or 'close_price' not in df.columns:
            print(f"⚠️ Required columns missing in {symbol}")
            return None

        df = df.rename(columns={
            'close_price': 'Close',
            'high_price': 'High',
            'low_price': 'Low',
            'open_price': 'Open',
            'trade_date': 'Date'
        })

        df['Date'] = pd.to_datetime(df['Date'], errors='coerce')
        df.set_index('Date', inplace=True)
        df = df.sort_index()
        return df

    except Exception as e:
        print(f"❌ Error for {symbol}: {str(e)}")
        return None

# ฟังก์ชันสำหรับสร้างข้อมูลลำดับ
def create_sequences(data, sequence_length=60):
    X, y = [], []
    for i in range(sequence_length, len(data)):
        X.append(data[i-sequence_length:i])
        y.append(data[i])
    return np.array(X), np.array(y)

# ฟังก์ชันสำหรับสร้างและฝึก LSTM model
def create_lstm_model(input_shape):
    model = Sequential([
        LSTM(50, return_sequences=True, input_shape=input_shape),
        LSTM(50, return_sequences=False),
        Dense(25),
        Dense(1)
    ])
    model.compile(optimizer='adam', loss='mean_squared_error')
    return model

# ฟังก์ชันสำหรับคำนวณ metrics
def calculate_metrics(actual, predicted):
    mse = mean_squared_error(actual, predicted)
    mae = mean_absolute_error(actual, predicted)
    rmse = np.sqrt(mse)
    
    # คำนวณ MAPE (Mean Absolute Percentage Error)
    mape = np.mean(np.abs((actual - predicted) / actual)) * 100
    
    # คำนวณ Accuracy (100 - MAPE)
    accuracy = 100 - mape
    
    return mse, mae, rmse, mape, accuracy

# เริ่มต้นการประมวลผล
conn = connect_to_database()
if conn is None:
    print("❌ ไม่สามารถเชื่อมต่อฐานข้อมูลได้ กรุณาตรวจสอบการตั้งค่า")
    exit()

# เก็บผลลัพธ์
results = {}

# วนลูปผ่านแต่ละหุ้น
plt.figure(figsize=(20, 15))

for idx, (symbol, name) in enumerate(angel_stocks.items(), 1):
    print(f"\n📈 Processing {symbol} - {name}")
    
    try:
        # ดึงข้อมูลจากฐานข้อมูล
        df = fetch_stock_data(conn, symbol)
        
        if df is None or len(df) < 100:
            print(f"⚠️ ข้อมูล {symbol} ไม่เพียงพอหรือไม่สามารถดึงได้")
            continue
        
        # เตรียมข้อมูลสำหรับ LSTM
        data = df[['Close']].copy()
        
        # Scaling
        scaler = MinMaxScaler()
        scaled_data = scaler.fit_transform(data)
        
        # สร้างชุดข้อมูลลำดับ
        sequence_length = 60
        X, y = create_sequences(scaled_data, sequence_length)
        
        if len(X) == 0:
            print(f"⚠️ ไม่สามารถสร้างลำดับข้อมูลสำหรับ {symbol}")
            continue
        
        # แบ่ง train/test
        train_size = int(len(X) * 0.8)
        X_train, X_test = X[:train_size], X[train_size:]
        y_train, y_test = y[:train_size], y[train_size:]
        
        # สร้างและฝึก LSTM
        model = create_lstm_model((X.shape[1], 1))
        
        print(f"🔄 กำลังฝึก model สำหรับ {symbol}...")
        history = model.fit(X_train, y_train, epochs=20, batch_size=32, 
                          validation_split=0.1, verbose=0)
        
        # พยากรณ์
        predicted = model.predict(X_test, verbose=0)
        predicted_prices = scaler.inverse_transform(predicted)
        real_prices = scaler.inverse_transform(y_test)
        
        # คำนวณ metrics
        mse, mae, rmse, mape, accuracy = calculate_metrics(real_prices, predicted_prices)
        
        # เก็บผลลัพธ์
        results[symbol] = {
            'name': name,
            'mse': mse,
            'mae': mae,
            'rmse': rmse,
            'mape': mape,
            'accuracy': accuracy,
            'last_price': real_prices[-1][0],
            'predicted_next': predicted_prices[-1][0],
            'data_points': len(df)
        }
        
        # สร้างกราฟ
        plt.subplot(3, 3, idx)
        plt.plot(real_prices, label='Actual', alpha=0.8, linewidth=2, color='blue')
        plt.plot(predicted_prices, label='Predicted', alpha=0.8, linewidth=2, color='red')
        plt.title(f'{symbol} - {name}\nAccuracy: {accuracy:.1f}% | RMSE: ${rmse:.2f}', fontsize=10)
        plt.legend(fontsize=8)
        plt.grid(True, alpha=0.3)
        plt.ylabel('Price ($)')
        
        print(f"✅ {symbol} สำเร็จ - Accuracy: {accuracy:.1f}% | RMSE: ${rmse:.2f}")
        
    except Exception as e:
        print(f"❌ เกิดข้อผิดพลาดกับ {symbol}: {str(e)}")
        continue

# ปิดการเชื่อมต่อฐานข้อมูล
conn.close()
print("\n🔐 Database connection closed")

plt.tight_layout()
plt.suptitle('7 Angel Stocks - LSTM Price Predictions', fontsize=16, y=1.02)
plt.show()

# สรุปผลลัพธ์
print("\n" + "="*80)
print("📊 PREDICTION RESULTS SUMMARY - 7 ANGEL STOCKS")
print("="*80)

if results:
    # เรียงลำดับตามความแม่นยำ (สูงสุดก่อน)
    sorted_results = sorted(results.items(), key=lambda x: x[1]['accuracy'], reverse=True)
    
    print("\n🏆 ACCURACY RANKING (จากดีที่สุด)")
    print("-" * 70)
    
    for rank, (symbol, data) in enumerate(sorted_results, 1):
        trend_icon = "📈" if data['predicted_next'] > data['last_price'] else "📉"
        change_pct = ((data['predicted_next'] - data['last_price']) / data['last_price']) * 100
        
        print(f"{rank}. {symbol} ({data['name']})")
        print(f"   🎯 Accuracy: {data['accuracy']:.1f}%")
        print(f"   📊 RMSE: ${data['rmse']:.2f} | MAE: ${data['mae']:.2f}")
        print(f"   💰 Current Price: ${data['last_price']:.2f}")
        print(f"   🔮 Next Prediction: ${data['predicted_next']:.2f} {trend_icon} {change_pct:+.1f}%")
        print(f"   📈 Data Points: {data['data_points']:,}")
        print()
    
    # สถิติรวม
    avg_accuracy = np.mean([data['accuracy'] for data in results.values()])
    avg_rmse = np.mean([data['rmse'] for data in results.values()])
    best_stock = max(results.items(), key=lambda x: x[1]['accuracy'])
    
    print("📈 OVERALL PERFORMANCE")
    print(f"Average Accuracy: {avg_accuracy:.1f}%")
    print(f"Average RMSE: ${avg_rmse:.2f}")
    print(f"Best Performer: {best_stock[0]} ({best_stock[1]['accuracy']:.1f}% accuracy)")
    
    # แนวโน้มตลาด
    bullish_stocks = [s for s, d in results.items() if d['predicted_next'] > d['last_price']]
    bearish_stocks = [s for s, d in results.items() if d['predicted_next'] < d['last_price']]
    
    print(f"\n📊 MARKET SENTIMENT")
    print(f"📈 Bullish Trend: {len(bullish_stocks)} stocks - {bullish_stocks}")
    print(f"📉 Bearish Trend: {len(bearish_stocks)} stocks - {bearish_stocks}")
    
    # ข้อเสนะแนะการลงทุน
    high_confidence = [s for s, d in results.items() if d['accuracy'] > 85]
    if high_confidence:
        print(f"\n💡 HIGH CONFIDENCE PREDICTIONS (>85% accuracy):")
        for stock in high_confidence:
            data = results[stock]
            change = ((data['predicted_next'] - data['last_price']) / data['last_price']) * 100
            print(f"   ⭐ {stock}: {data['accuracy']:.1f}% accuracy, {change:+.1f}% expected change")

else:
    print("❌ ไม่มีข้อมูลที่ประมวลผลสำเร็จ")

print("🚀 Happy Trading with AI Predictions! 🚀")
