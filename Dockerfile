FROM python:3.9-slim


# First i am creating a group on this system and adding a non-root user to it
RUN addgroup --system appgroup \
    && adduser --system --ingroup appgroup appuser

# Our working directory    
WORKDIR /app

# we copy dependency file first (better caching)
COPY requirements.txt .

# Since trivy show a high risk so we upgrade it at buildtime and not runtime
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# next we copy our application code    
COPY app.py .

# we drop privileges
USER appuser

# RUN app
CMD ["python", "app.py"]
