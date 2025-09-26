# Python 3.11 slim 버전 사용
FROM python:3.11-slim

# 컨테이너 내부 작업 폴더
WORKDIR /app

# requirements 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# app.py 복사
COPY app.py .

# FastAPI 실행 (uvicorn)
CMD ["python", "-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

