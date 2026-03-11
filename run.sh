#!/bin/bash
# ── KindleScrape — one-click setup & launch ─────────────────────────────────
echo ""
echo "  📚  KindleScrape — Amazon Bestseller Extractor"
echo "  ───────────────────────────────────────────────"
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
  echo "  ❌  Python 3 not found. Install from https://python.org"
  exit 1
fi

# Install deps
echo "  📦  Installing Python dependencies..."
pip install -q flask flask-cors openpyxl playwright

echo "  🌐  Installing Playwright browser (Chromium)..."
playwright install chromium

echo ""
echo "  ✅  All set! Starting server..."
echo "  🚀  Open  http://localhost:5000  in your browser"
echo ""

python3 app.py
