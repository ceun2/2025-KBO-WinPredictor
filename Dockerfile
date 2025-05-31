# Python 3.9 slim 이미지를 사용
FROM python:3.9-slim

# 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    fontconfig \
    fonts-nanum && \
    fc-cache -fv && \
    rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /src

# 의존성 설치
COPY requirements.txt ./
RUN  pip install --no-cache-dir -r requirements.txt

# 파이썬 파일 및 모델 복사
# COPY . .

# 포트 개방
EXPOSE 8888

# 실행
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]