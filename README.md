 # 📚 KindleScrape — Amazon Bestseller Extractor
 
 A web app that scrapes any Amazon Kindle Best Sellers category page and exports
 clean, structured data as Excel (.xlsx) or CSV.
 
 Built with Flask + Playwright + openpyxl.
 
 ---
 
 ## 💻 Run locally
 
 ```bash
 pip install -r requirements.txt
 playwright install chromium
 python app.py
 # → open http://localhost:5000
 ```
 
 ---
 
 ## 🛠 What it does
 
 - Scrapes Amazon ZGBS bestseller listing pages (rank, title, author, rating, reviews, price, URL)
 - Visits each individual book page for description, publisher, publication date
 - Streams live progress to the browser via Server-Sent Events
 - Exports a formatted Excel workbook (dataset + summary + observations tabs)
 - Also exports CSV for Google Sheets
 
 Works for **any** Amazon Kindle category bestseller page — just change the URL.
 
 ---
 
 ## ⚠️ Notes
 
 - Amazon may show a CAPTCHA for automated traffic. If scraping fails, try again after a few hours.
 - Job state is stored in memory — restarting the server clears completed jobs.
 - For production use at scale, add a database (Redis/Postgres) and a proxy pool.
