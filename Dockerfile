# Use Python 3.9 slim image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install PDM
RUN pip install pdm

# Copy project files
COPY pyproject.toml .
COPY main.py .

# Install dependencies
RUN pdm install --prod --no-lock

# Create directory for histograms
RUN mkdir -p histograms

# Set entry point
ENTRYPOINT ["python", "main.py"]
