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

## 2026-03-12

### Global 싱글톤 추가
- `Global.gd` 오토로드 생성
- `MAX_EMEMY`: 최대 몬스터 수 (20)
- `current_enemy`: 현재 화면 내 몬스터 수 추적

### 입력 설정
- `mouse_left_btn`: 마우스 좌클릭 입력 액션 추가

### Game 씬 개선
- **EnemySpawner**: 몬스터 스폰 시스템
  - SpawnTimer로 주기적 몬스터 스폰
  - 화면 내 랜덤 위치에 스폰 (MARGIN 적용)
- **EnemyCount**: 현재 몬스터 수 표시 (4자리 포맷)
- **GameOverLabel**: 게임 오버 시 "GAME OVER" 표시
- `current_enemy`가 `MAX_EMEMY`(20) 도달 시 게임 일시정지 및 게임 오버
- 몬스터 클릭 시 `click_monster` 시그널로 카운트 감소

### Monster 씬 개선
- `click_monster` 시그널 추가 (클릭 시 Game에 전달)
- 클릭 시 Dead 애니메이션 재생 후 2.5초 뒤 제거
- `is_dead` 플래그로 중복 클릭 방지
- Timer 노드로 사망 후 정리 타이밍 제어

### 에셋 추가
- `font36.tres`: EnemyCount 레이블용 LabelSettings
