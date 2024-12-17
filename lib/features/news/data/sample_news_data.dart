import '../domain/models/news_article.dart';

final sampleNewsArticles = [
  NewsArticle(
    id: '1',
    title: '삼성전자, 차세대 AI 반도체 개발 착수',
    description:
        '삼성전자가 차세대 AI 반도체 개발에 본격 착수했다. GAA 공정을 적용한 3나노 AI 반도체는 기존 대비 전력 효율을 45% 개선하고 성능은 최대 2배 향상시킬 것으로 기대된다.',
    imageUrl: 'https://picsum.photos/400/300?random=1',
    publishedAt: DateTime.now().subtract(const Duration(minutes: 15)),
  ),
  NewsArticle(
    id: '2',
    title: '현대차, 2025년형 아이오닉 7 티저 공개',
    description:
        '현대자동차가 플래그십 전기 SUV 아이오닉 7의 티저 이미지를 공개했다. 주행거리 700km, 초고속 충전 등 혁신적인 기술이 적용될 예정이다.',
    imageUrl: 'https://picsum.photos/400/300?random=2',
    publishedAt: DateTime.now().subtract(const Duration(minutes: 45)),
  ),
  NewsArticle(
    id: '3',
    title: '카카오페이 "디지털 자산 거래소 연내 출시"',
    description:
        '카카오페이가 연내 디지털 자산 거래소 출시를 공식화했다. 카카오페이 관계자는 "높은 보안성과 사용자 경험을 제공할 것"이라고 밝혔다.',
    imageUrl: 'https://picsum.photos/400/300?random=3',
    publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  NewsArticle(
    id: '4',
    title: 'LG에너지솔루션, 차세대 전고체 배터리 개발 성공',
    description:
        'LG에너지솔루션이 안전성과 에너지 밀도를 크게 높인 전고체 배터리 개발에 성공했다고 발표했다. 2026년 양산을 목표로 하고 있다.',
    imageUrl: 'https://picsum.photos/400/300?random=4',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NewsArticle(
    id: '5',
    title: '네이버, AI 기반 검색 서비스 전면 개편',
    description:
        '네이버가 생성형 AI를 접목한 새로운 검색 서비스를 선보인다. 사용자 의도를 더 정확하게 파악하고 맞춤형 결과를 제공하는 것이 특징이다.',
    imageUrl: 'https://picsum.photos/400/300?random=5',
    publishedAt: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  NewsArticle(
    id: '6',
    title: '한국은행 "기준금리 동결... 당분간 현 수준 유지"',
    description:
        '한국은행이 기준금리를 현 3.50%로 동결했다. 한은 총재는 "물가안정세와 금융시장 상황을 지켜보며 신중하게 통화정책을 운용할 것"이라고 밝혔다.',
    imageUrl: 'https://picsum.photos/400/300?random=6',
    publishedAt: DateTime.now().subtract(const Duration(hours: 4)),
  ),
  NewsArticle(
    id: '7',
    title: '애플, iOS 18 프리뷰 공개... "역대 최대 업데이트"',
    description:
        '애플이 iOS 18 프리뷰를 공개했다. 새로운 AI 기능들과 함께 완전히 새로워진 홈스크린 위젯, 향상된 개인정보 보호 기능이 추가된다.',
    imageUrl: 'https://picsum.photos/400/300?random=7',
    publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  NewsArticle(
    id: '8',
    title: '서울시 "2025년까지 자율주행 버스 200대 도입"',
    description:
        '서울시가 2025년까지 자율주행 버스 200대를 도입한다고 발표했다. 주요 간선도로를 중심으로 시범 운행을 시작할 예정이다.',
    imageUrl: 'https://picsum.photos/400/300?random=8',
    publishedAt: DateTime.now().subtract(const Duration(hours: 6)),
  ),
  NewsArticle(
    id: '9',
    title: 'SK바이오팜, 혁신 신약 FDA 최종 승인',
    description:
        'SK바이오팜이 개발한 뇌전증 치료제가 미국 FDA로부터 최종 승인을 받았다. 글로벌 시장에서 연간 2조원 이상의 매출이 기대된다.',
    imageUrl: 'https://picsum.photos/400/300?random=9',
    publishedAt: DateTime.now().subtract(const Duration(hours: 7)),
  ),
  NewsArticle(
    id: '10',
    title: '구글 "한국에 AI 연구센터 설립... 1조원 투자"',
    description:
        '구글이 한국에 AI 연구센터를 설립한다고 발표했다. 향후 5년간 1조원을 투자해 AI 인재 양성과 기술 개발을 진행할 예정이다.',
    imageUrl: 'https://picsum.photos/400/300?random=10',
    publishedAt: DateTime.now().subtract(const Duration(hours: 8)),
  ),
];

// AI 추천 뉴스용 하이라이트 데이터
final aiRecommendedNews = [
  NewsArticle(
    id: 'ai_1',
    title: '[특집] 2024 대한민국 AI 산업의 현주소',
    description:
        '삼성, LG, 네이버, 카카오 등 국내 주요 기업들의 AI 개발 현황과 미래 전략을 심층 분석했다. 글로벌 시장에서의 경쟁력과 향후 과제는?',
    imageUrl: 'https://picsum.photos/800/400?random=11',
    publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  NewsArticle(
    id: 'ai_2',
    title: '[심층보도] 전기차 시대, 배터리 기술 혁신의 최전선',
    description:
        '전고체 배터리부터 나트륨 이온 배터리까지, 차세대 배터리 기술 개발 현황과 시장 전망을 살펴본다. 한국 배터리 산업의 미래는?',
    imageUrl: 'https://picsum.photos/800/400?random=12',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NewsArticle(
    id: 'ai_3',
    title: '[분석] 메타버스와 웹3.0이 바꿀 미래',
    description:
        '메타버스와 웹3.0 기술의 발전이 가져올 산업 지형의 변화. 전문가들이 전망하는 2030년 디지털 세상의 모습을 조망한다.',
    imageUrl: 'https://picsum.photos/800/400?random=13',
    publishedAt: DateTime.now().subtract(const Duration(hours: 3)),
  ),
];

// 홈 탭의 작은 뉴스 헤드라인용 데이터
final homeSmallNewsHeadlines = [
  NewsArticle(
    id: 'small_1',
    title: '반도체 업계 "AI 호황에 실적 회복세"',
    description: '올해 AI 반도체 수요 증가로 메모리 가격 상승... 업계 전반 실적 개선 기대',
    imageUrl: 'https://picsum.photos/200/150?random=21',
    publishedAt: DateTime.now().subtract(const Duration(minutes: 30)),
  ),
  NewsArticle(
    id: 'small_2',
    title: '금융위 "가계부채 관리 강화"',
    description: '고금리 장기화에 따른 가계 부담 증가... 맞춤형 지원책 마련',
    imageUrl: 'https://picsum.photos/200/150?random=22',
    publishedAt: DateTime.now().subtract(const Duration(minutes: 45)),
  ),
  NewsArticle(
    id: 'small_3',
    title: '식품업계, 대체육 시장 진출 가속화',
    description: 'MZ세대 겨냥한 식물성 단백질 제품 출시 러시... 시장 규모 연 20% 성장',
    imageUrl: 'https://picsum.photos/200/150?random=23',
    publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  NewsArticle(
    id: 'small_4',
    title: '정부 "신재생에너지 투자 확대"',
    description: '2030년까지 100조원 투자... 태양광·풍력 발전 비중 30%로 확대',
    imageUrl: 'https://picsum.photos/200/150?random=24',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NewsArticle(
    id: 'small_5',
    title: '게임업계, AI 기술 도입 본격화',
    description: 'NPC 지능 향상부터 그래픽 개선까지... AI 기술 활용 확대',
    imageUrl: 'https://picsum.photos/200/150?random=25',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 30)),
  ),
  NewsArticle(
    id: 'small_6',
    title: '코스피, 외국인 매수세에 상승',
    description: '기관·외국인 동반 매수... 전기차 배터리 관련주 강세',
    imageUrl: 'https://picsum.photos/200/150?random=26',
    publishedAt: DateTime.now().subtract(const Duration(hours: 3)),
  ),
];
