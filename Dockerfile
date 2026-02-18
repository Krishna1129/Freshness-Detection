# Use Python 3.10 (matches your requirements)
FROM python:3.10-slim

# Install system dependencies for OpenCV (libgl1 replaces libgl1-mesa-glx on Debian Bookworm+)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy dependency file first for better layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .
COPY templates/ templates/

# Create static/uploads (for detection result images)
RUN mkdir -p static/uploads

# Render sets PORT env; default to 5000 for local Docker
ENV PORT=5000
EXPOSE 5000

# Run with gunicorn for production (Render)
CMD gunicorn --bind 0.0.0.0:${PORT} --workers 1 --threads 2 --timeout 120 app:app
