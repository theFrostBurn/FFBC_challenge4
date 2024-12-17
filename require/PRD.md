### Project overview (프로젝트 요약)

1. 'findOS' 스타일의 정보 집약 앱
2. AI 추천 뉴스, 실시간 주식 정보, 날씨 정보 등을 한 눈에 볼 수 있는 앱
3. iOS 스타일의 심플하고 직관적인 디자인
4. 다크모드 지원

### Core functionalities (핵심 기능)

1. 홈 화면
   - AI 추천 뉴스 섹션
   - 실시간 주식 정보 위젯
   - 최신 뉴스 피드
   - 스크롤을 통한 컨텐츠 로딩

2. 뉴스 탭
   - 카테고리별 뉴스 분류
   - 컴팩트한 뉴스 카드 UI (160px 높이)
   - 북마크 기능
   - 뉴스 공유 기능
   - 뉴스 검색 기능
   - 시간 정보 표시 (n분 전, n시간 전, n일 전)

3. 날씨 탭
   - 현재 위치 기반 날씨 정보
   - 시간대별 날씨 예보
   - 주간 날씨 예보
   - 상세 날씨 정보 (습도, 강수확률 등)

4. MY 탭
   - 사용자 프로필 관리
   - 앱 설정
     - 다크 모드
     - 자동 재생
     - 데이터 절약
   - 알림 설정
     - 주식 알림
     - 날씨 알림
     - 뉴스 알림
   - 북마크된 뉴스 목록

CupertinoApp과 CupertinoScaffold 등의 iOS 스타일 위젯을 사용하여 네이티브한 느낌을 구현한다.


### Doc (참고 문서)

1. 필수 패키지
   - cupertino_icons: ^1.0.8
   - flutter_bloc: 상태관리
   - dio: API 통신
   - shared_preferences: 로컬 데이터 저장
   - intl: 다국어 지원

2. API 연동
   - 뉴스 API
   - 주식 시세 API
   - 날씨 API

### Current file structure (현재 파일 구조)

lib/
├── main.dart
├── app/
│ ├── app.dart
│ └── theme/
├── features/
│ ├── home/
│ ├── news/
│ ├── weather/
│ └── profile/
├── shared/
│ ├── widgets/
│ └── utils/
└── core/
├── api/
└── models/