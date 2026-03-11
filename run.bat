@echo off
echo.
echo   📚  KindleScrape — Amazon Bestseller Extractor
echo   ───────────────────────────────────────────────
echo.
echo   Installing dependencies...
pip install flask flask-cors openpyxl playwright
playwright install chromium
echo.
echo   Starting server — open http://localhost:5000
echo.
python app.py
pause
