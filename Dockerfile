FROM python:3.11-slim

# System deps (ffmpeg for video/audio, fonts for captions)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg fonts-dejavu-core \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

# Default command
CMD ["python", "-u", "main.py"]
