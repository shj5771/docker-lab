# Docker FastAPI Test Project

## 프로젝트 개요
이 프로젝트는 **FastAPI 애플리케이션을 Docker 환경에서 실행**하기 위한 테스트 프로젝트입니다.  
Docker 설치부터 WSL2 설정, FastAPI 실행까지 전 과정을 기록했습니다.

---

## 사전 준비

### 1) BIOS에서 가상화(VT-x/AMD-V) 활성화
1. 컴퓨터를 완전히 종료 후 전원 켬
2. 부팅 시 **F2 / Del / F10 / F12** (메인보드에 따라 다름) 눌러 BIOS 진입
3. CPU 설정 메뉴에서:
   - Intel CPU: **Intel Virtualization Technology** → Enabled
   - AMD CPU: **SVM Mode** → Enabled
4. 저장 후 재부팅

### 2) WSL2 및 Linux 커널 설치
PowerShell(관리자 권한)에서 아래 실행:
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
이후 재부팅 후:
### 3) WSL2 + Ubuntu 설치
```wsl --install```

👉 설치 후 계정/비밀번호 입력 (앞으로 계속 사용할 계정)

### 4) Docker Desktop 설치

Docker Desktop 다운로드 후 설치
첫 실행 시 WSL2 기반 엔진 활성화 확인


🚀 실행 방법
### 1) 로컬 실행 (Docker 없이)
bash# 1. 의존성 설치
```pip install -r requirements.txt```

# 2. FastAPI 실행
```uvicorn app:app --reload --host 0.0.0.0 --port 8000```

👉 실행 후 브라우저에서 확인: http://localhost:8000

### 2) Docker 빌드 & 실행
(1) Docker 이미지 빌드
```bashdocker build -t my-fastapi-app .```
(2) 컨테이너 실행 (8010 포트 매핑)
```bashdocker run -d -p 8010:8000 my-fastapi-app```

👉 실행 후 브라우저에서 확인: http://localhost:8010

🧩 Docker 명령어 정리
명령어설명docker build -t my-fastapi-app .현재 디렉토리 기반 이미지 빌드docker run -d -p 8010:8000 my-fastapi-app컨테이너 실행 (포트 매핑)docker ps실행 중인 컨테이너 확인docker stop <container_id>컨테이너 중지docker logs <container_id>로그 확인docker exec -it <container_id> bash실행 중인 컨테이너 내부 진입
📖 배운 점

Docker를 사용하면 개발 환경 차이에 상관없이 동일한 결과를 재현할 수 있음
FastAPI를 컨테이너화하여 배포/실행 가능
WSL2, BIOS 가상화, Docker Desktop 설정 과정 이해
requirements.txt, Dockerfile 관리의 중요성
