# 🖥️ Windows 물리서버 배포 자동화 스크립트

이 레포지토리는 윈도우 환경에서 물리서버에 **Docker 기반 백엔드 서비스를 자동으로 빌드 및 배포**하기 위한 스크립트를 포함하고 있습니다.

---

## 📁 구성 파일

- `build_and_deploy.bat`  
  > 백엔드 애플리케이션을 빌드하고 Docker 컨테이너를 실행하는 배치 스크립트입니다.  
  > Java 빌드 → Docker 이미지 빌드 → `docker-compose` 실행 순으로 자동 처리합니다.

- `docker-compose.yml`  
  > 백엔드, 데이터베이스(MySQL, PostgreSQL), Redis, Kafka 등을 포함한 컨테이너 구성 파일입니다.

- `.env`  
  > 환경 변수 파일로, DB 계정, 토큰, 포트 등 민감 정보들을 포함합니다.  
  > 각 서비스에서 이 정보를 참조하여 설정됩니다.

---

## ⚙️ 사용 방법

### 1. 환경 준비
- Docker 및 Docker Compose가 설치된 **Windows 서버** 환경 필요
- Java 17 이상 설치 필요 (백엔드 빌드를 위한 전제 조건)

### 2. `.env` 설정
`.env` 파일을 필요에 맞게 수정하세요.
(기본적으로 PostgreSQL, MySQL, Kafka, Redis, Kakao, JWT, Telegram 등 구성 포함)

### 3. 배포 실행
```bash
build_and_deploy.bat
