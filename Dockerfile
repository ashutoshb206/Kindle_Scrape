# ── Stage 1: Python + Playwright + Chromium ──────────────────────────────────
FROM python:3.11-slim

# System deps for Chromium
RUN apt-get update && apt-get install -y \
    wget curl gnupg ca-certificates \
    libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 \
    libxkbcommon0 libxcomposite1 libxdamage1 libxrandr2 \
    libgbm1 libasound2 libpango-1.0-0 libpangocairo-1.0-0 \
    libgtk-3-0 libx11-xcb1 libxcb-dri3-0 fonts-liberation \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright + Chromium browser
RUN playwright install chromium
RUN playwright install-deps chromium

# Copy app
COPY . .

# Railway typically sets PORT env var automatically, but to be safe with Docker
# deployments we also provide a conventional default.
ENV PORT=8080
EXPOSE 8080

# Use gunicorn and bind to $PORT (fallback to 8080).
CMD ["sh", "-c", "gunicorn -b 0.0.0.0:${PORT:-8080} app:app --workers 1 --threads 4 --timeout 120"]
