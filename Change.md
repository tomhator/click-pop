# 변경 이력 (Change Log)

## 2026-03-11

### 프로젝트 초기 설정
- Godot 4.6 프로젝트 생성
- 프로젝트명: ClickPop
- 모바일 타겟 설정
- 뷰포트 크기: 360x640

### 에셋 추가
- **이미지**
  - `enemies.png`: 몬스터 스프라이트 (애니메이션용)
  - `bullet.png`: 총알 스프라이트
  - `tilemap.png`: 타일맵
  - `crooshair.png`: 크로스헤어 커서
  - `icon.svg`: 앱 아이콘

- **폰트**
  - `Poco.ttf`: UI용 폰트

### 씬 및 스크립트 생성
- **Game 씬** (`Scenes/Game/`)
  - 메인 게임 씬
  - 크로스헤어 커서 적용
  - 마우스 좌클릭 입력 처리

- **Monster 씬** (`Scenes/Monster/`)
  - Area2D 기반 몬스터
  - AnimatedSprite2D: Idle/Dead 애니메이션
  - 클릭 시 Dead 애니메이션 재생 후 제거
  - CollisionShape2D로 클릭 감지

### Git 설정
- `.gitignore`, `.gitattributes`, `.editorconfig` 파일 추가
- GitHub 원격 저장소 연결 (https://github.com/tomhator/click-pop.git)
