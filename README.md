**Data Warehouse and Analytics Project**
------------------------------------------------------------------------------------------------------------

ยินดีต้อนรับสู่ repository โครงการ Data Warehouse และ Analytics! 🚀
โครงการนี้แสดงให้เห็นถึงโซลูชันคลังข้อมูลและการวิเคราะห์ที่ครอบคลุม ตั้งแต่การสร้างคลังข้อมูลไปจนถึงการสร้างข้อมูลเชิงลึกที่นำไปใช้ได้จริง

------------------------------------------------------------------------------------------------------------


**🏗️ Data Architecture**
------------------------------------------------------------------------------------------------------------
สถาปัตยกรรมข้อมูลสำหรับโครงการนี้ใช้ Medallion Architecture ที่ประกอบด้วยชั้น Bronze, Silver และ Gold

![data architecture](https://github.com/user-attachments/assets/45bc3888-36e5-4ee9-9469-a2d117ad6fde)

Bronze Layer (ชั้นบรอนซ์): เก็บข้อมูลดิบตามต้นฉบับจากระบบต้นทาง โดยนำเข้าข้อมูลจากไฟล์ CSV เข้าสู่ฐานข้อมูล SQL Server
Silver Layer (ชั้นซิลเวอร์): ชั้นนี้รวมถึงกระบวนการทำความสะอาดข้อมูล การกำหนดมาตรฐาน และการปรับปรุงข้อมูลให้เป็นแบบแผนเพื่อเตรียมพร้อมสำหรับการวิเคราะห์
Gold Layer (ชั้นโกลด์): เก็บข้อมูลที่พร้อมใช้งานทางธุรกิจ ซึ่งได้รับการจัดโครงสร้างเป็นแบบ star schema ที่จำเป็นสำหรับการรายงานและการวิเคราะห์

------------------------------------------------------------------------------------------------------------
**📖 Project Overview**
------------------------------------------------------------------------------------------------------------
โครงการนี้ประกอบด้วย:

สถาปัตยกรรมข้อมูล: การออกแบบ Modern Data Warehouse โดยใช้ Medallion Architecture ชั้น Bronze, Silver, และ Gold
ETL Pipelines: การดึง แปลง และโหลดข้อมูลจากระบบต้นทางเข้าสู่คลังข้อมูล
การจัดโครงสร้างข้อมูล (Data Modeling): การพัฒนา fact และ dimension tables ที่ปรับแต่งให้เหมาะสำหรับการ query เชิงวิเคราะห์
การวิเคราะห์และรายงาน: การสร้างรายงานและแดชบอร์ดที่ใช้ SQL เพื่อให้ได้ข้อมูลเชิงลึกที่นำไปใช้ได้จริง


🎯 Repository นี้เป็นแหล่งข้อมูลที่ยอดเยี่ยมสำหรับมืออาชีพและนักศึกษาที่ต้องการแสดงความเชี่ยวชาญในด้าน:

SQL Development - การพัฒนา SQL
Data Architect - สถาปนิกข้อมูล
Data Engineering - วิศวกรรมข้อมูล
ETL Pipeline Developer - นักพัฒนา ETL Pipeline
Data Modeling - การจัดโครงสร้างข้อมูล
Data Analytics - การวิเคราะห์ข้อมูล

------------------------------------------------------------------------------------------------------------

**📖 Stocks Price Predictions**
------------------------------------------------------------------------------------------------------------


![output](https://github.com/user-attachments/assets/e2e1b5ff-1092-4282-b055-f938f81534e3)



📊 PREDICTION RESULTS SUMMARY - 7 ANGEL STOCKS
----------------------------------------------------------------------

🏆 ACCURACY RANKING (จากดีที่สุด)

----------------------------------------------------------------------
1. MSFT (Microsoft Corp.)
   🎯 Accuracy: 97.8%
   📊 RMSE: $9.11 | MAE: $7.24
   💰 Current Price: $423.20
   🔮 Next Prediction: $425.81 📈 +0.6%
   📈 Data Points: 2,515

2. GOOGL (Alphabet Inc.)
   🎯 Accuracy: 97.5%
   📊 RMSE: $4.19 | MAE: $3.26
   💰 Current Price: $190.79
   🔮 Next Prediction: $186.26 📉 -2.4%
   📈 Data Points: 2,515

3. AAPL (Apple Inc.)
   🎯 Accuracy: 97.2%
   📊 RMSE: $6.83 | MAE: $5.22
   💰 Current Price: $251.59
   🔮 Next Prediction: $240.84 📉 -4.3%
   📈 Data Points: 2,515

4. AMZN (Amazon.com Inc.)
   🎯 Accuracy: 96.1%
   📊 RMSE: $7.31 | MAE: $5.70
   💰 Current Price: $221.30
   🔮 Next Prediction: $216.60 📉 -2.1%
   📈 Data Points: 2,515

5. META (Meta Platforms Inc.)
   🎯 Accuracy: 95.2%
   📊 RMSE: $20.04 | MAE: $14.97
   💰 Current Price: $590.71
   🔮 Next Prediction: $569.69 📉 -3.6%
   📈 Data Points: 2,515

6. TSLA (Tesla Inc.)
   🎯 Accuracy: 92.5%
   📊 RMSE: $24.80 | MAE: $18.56
   💰 Current Price: $417.41
   🔮 Next Prediction: $419.93 📈 +0.6%
   📈 Data Points: 2,515

7. NVDA (NVIDIA Corp.)
   🎯 Accuracy: 91.0%
   📊 RMSE: $4.49 | MAE: $3.51
   💰 Current Price: $137.47
   🔮 Next Prediction: $137.79 📈 +0.2%
   📈 Data Points: 2,515

📈 OVERALL PERFORMANCE
Average Accuracy: 95.3%
Average RMSE: $10.97
Best Performer: MSFT (97.8% accuracy)


💡 HIGH CONFIDENCE PREDICTIONS (>85% accuracy):
   ⭐ AAPL: 97.2% accuracy, -4.3% expected change
   ⭐ MSFT: 97.8% accuracy, +0.6% expected change
   ⭐ GOOGL: 97.5% accuracy, -2.4% expected change
   ⭐ TSLA: 92.5% accuracy, +0.6% expected change
   ⭐ NVDA: 91.0% accuracy, +0.2% expected change
   ⭐ META: 95.2% accuracy, -3.6% expected change
   ⭐ AMZN: 96.1% accuracy, -2.1% expected change

🚀 Happy Trading with AI Predictions! 🚀

------------------------------------------------------------------------------------------------------------
