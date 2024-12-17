import '../domain/models/news_article.dart';

/// AI 추천 뉴스 데이터
final aiNewsContents = [
  {
    'id': 'ai_1',
    'title': '[특집] 2024 대한민국 AI 산업의 현주소',
    'description':
        '삼성, LG, 네이버, 카카오 등 국내 주요 기업들의 AI 개발 현황과 미래 전략을 심층 분석했다. 글로벌 시장에서의 경쟁력과 향후 과제는?',
    'imageUrl': 'https://picsum.photos/800/400?random=11',
  },
  {
    'id': 'ai_2',
    'title': '[심층보도] 전기차 시대, 배터리 기술 혁신의 최전선',
    'description':
        '전고체 배터리부터 나트륨 이온 배터리까지, 차세대 배터리 기술 개발 현황과 시장 전망을 살펴본다. 한국 배터리 산업의 미래는?',
    'imageUrl': 'https://picsum.photos/800/400?random=12',
  },
  {
    'id': 'ai_3',
    'title': '[분석] 메타버스와 웹3.0이 바꿀 미래',
    'description':
        '메타버스와 웹3.0 기술의 발전이 가져올 산업 지형의 변화. 전문가들이 전망하는 2030년 디지털 세상의 모습을 조망한다.',
    'imageUrl': 'https://picsum.photos/800/400?random=13',
  },
];

/// 홈 화면 최신 뉴스 데이터
final homeNewsContents = [
  {
    'id': 'small_1',
    'title': '반도체 업계 "AI 호황에 실적 회복세"',
    'description': '올해 AI 반도체 수요 증가로 메모리 가격 상승... 업계 전반 실적 개선 기대',
    'imageUrl': 'https://picsum.photos/200/150?random=21',
  },
  {
    'id': 'small_2',
    'title': '금융위 "가계부채 관리 강화"',
    'description': '고금리 장기화에 따른 가계 부담 증가... 맞춤형 지원책 마련',
    'imageUrl': 'https://picsum.photos/200/150?random=22',
  },
  {
    'id': 'small_3',
    'title': '식품업계, 대체육 시장 진출 가속화',
    'description': 'MZ세대 겨냥한 식물성 단백질 제품 출시 러시... 시장 규모 연 20% 성장',
    'imageUrl': 'https://picsum.photos/200/150?random=23',
  },
];

/// 카테고리별 뉴스 데이터
final categoryNewsContents = {
  '정치': [
    {
      'id': 'politics_1',
      'title': '여야, 민생법안 처리 합의... "협치 모델 될 것"',
      'description':
          '여야가 6개월간 계류됐던 민생법안 처리에 합의했다. 양당 원내대표는 "이번 합의를 시작으로 협치의 모델을 만들어가겠다"고 밝혔다...',
      'imageUrl': 'https://picsum.photos/800/400?random=3',
    },
    {
      'id': 'politics_2',
      'title': '대통령-야당대표 회동..."민생 현안 논의"',
      'description':
          '대통령과 야당 대표가 청와대에서 만나 민생 현안에 대해 논의했다. 양측은 물가안정과 일자리 창출을 위한 협력 방안을 모색하기로...',
      'imageUrl': 'https://picsum.photos/800/400?random=31',
    },
    {
      'id': 'politics_3',
      'title': '국회, 디지털플랫폼 규제법 통과..."공정경쟁 기대"',
      'description':
          '국회 본회의에서 디지털플랫폼 규제법이 통과됐다. 온라인 플랫폼 시장의 공정경쟁이 강화될 것으로 전망되며...',
      'imageUrl': 'https://picsum.photos/800/400?random=32',
    },
    {
      'id': 'politics_4',
      'title': '지방선거 D-100..."정책선거로 이끌 것"',
      'description':
          '다음 달 지방선거를 앞두고 각 정당이 정책선거를 약속했다. 중앙선관위는 네거티브 선거운동 근절을 위한 대책을...',
      'imageUrl': 'https://picsum.photos/800/400?random=33',
    },
  ],
  '경제': [
    {
      'id': 'economy_1',
      'title': '코스피 3,000 눈앞... 외국인 매수세 지속',
      'description':
          '코스피가 장중 2,980선을 돌파했다. 외국인들의 반도체 업종 매수세가 지속되며 3,000선 돌파가 가시권에 들어왔다는 분석이...',
      'imageUrl': 'https://picsum.photos/800/400?random=4',
    },
    {
      'id': 'economy_2',
      'title': '수출 7개월 연속 증가..."회복세 뚜렷"',
      'description':
          '반도체와 자동차를 중심으로 수출이 7개월 연속 증가세를 보이고 있다. 산업통상자원부는 하반기에도 이러한 상승세가...',
      'imageUrl': 'https://picsum.photos/800/400?random=34',
    },
    {
      'id': 'economy_3',
      'title': '한국은행 "물가상승률 2%대 안정화 전망"',
      'description':
          '한국은행이 올해 물가상승률이 2%대로 안정화될 것으로 전망했다. 국제 원자재 가격 하락과 금리인상 효과가...',
      'imageUrl': 'https://picsum.photos/800/400?random=35',
    },
    {
      'id': 'economy_4',
      'title': '주요 그룹 채용 확대..."청년 일자리 늘린다"',
      'description':
          '국내 주요 그룹들이 올해 상반기 채용 규모를 확대한다. 경기 회복 기대감과 함께 청년 일자리 창출에 적극 나서기로...',
      'imageUrl': 'https://picsum.photos/800/400?random=36',
    },
  ],
  '사회': [
    {
      'id': 'social_1',
      'title': '서울 지하철 2호선 신규 노선 확정..."2030년 개통"',
      'description':
          '서울시가 지하철 2호선 신규 노선을 확정 발표했다. 새로운 노선은 강남과 강서를 잇는 구간으로, 2030년 개통을 목표로...',
      'imageUrl': 'https://picsum.photos/800/400?random=41',
    },
    {
      'id': 'social_2',
      'title': '전국 초중고 AI 교육 의무화..."디지털 인재 양성"',
      'description':
          '교육부가 2025년부터 전국 초중고교에서 AI 교육을 의무화하기로 했다. 학년별 맞춤형 커리큘럼을 개발하여...',
      'imageUrl': 'https://picsum.photos/800/400?random=42',
    },
    {
      'id': 'social_3',
      'title': '대학가 기숙사 수용률 확대..."주거비 부담 줄인다"',
      'description':
          '전국 주요 대학들이 기숙사 수용률을 높이기로 했다. 정부와 대학은 협력하여 캠퍼스 내 기숙사 신축을 추진...',
      'imageUrl': 'https://picsum.photos/800/400?random=43',
    },
    {
      'id': 'social_4',
      'title': '119 출동 시간 더 빨라진다..."골든타임 사수"',
      'description':
          '소방청이 새로운 출동 시스템을 도입한다. AI 기반 최적 경로 분석과 교통신호 제어를 통해 현장 도착 시간을...',
      'imageUrl': 'https://picsum.photos/800/400?random=44',
    },
  ],
  '생활/문화': [
    {
      'id': 'culture_1',
      'title': '코로나 이후 첫 마스크 없는 봄..."일상 회복 실감"',
      'description':
          '정부가 실내 마스크 착용 의무를 전면 해제한 이후 첫 봄을 맞았다. 시민들은 "완전한 일상 회복을 실감한다"며...',
      'imageUrl': 'https://picsum.photos/800/400?random=51',
    },
    {
      'id': 'culture_2',
      'title': 'K-콘텐츠, 글로벌 시장서 새 역사..."한류 영향력 확대"',
      'description':
          '국내 드라마와 영화가 해외 시장에서 연이은 흥행을 기록하고 있다. OTT 플랫폼을 통한 한국 콘텐츠의 글로벌 영향력이...',
      'imageUrl': 'https://picsum.photos/800/400?random=52',
    },
    {
      'id': 'culture_3',
      'title': '국립중앙박물관, AI 도슨트 서비스 시작',
      'description':
          '국립중앙박물관이 AI 기술을 활용한 맞춤형 전시 해설 서비스를 시작한다. 관람객의 관심사에 따라 다양한 설명을...',
      'imageUrl': 'https://picsum.photos/800/400?random=53',
    },
    {
      'id': 'culture_4',
      'title': '실내 스포츠 인기 급상승..."새로운 취미생활 트렌드"',
      'description':
          '클라이밍, 실내 서핑 등 실내 스포츠가 새로운 취미 트렌드로 자리잡고 있다. MZ세대를 중심으로 색다른 경험을...',
      'imageUrl': 'https://picsum.photos/800/400?random=54',
    },
  ],
  '세계': [
    {
      'id': 'world_1',
      'title': '美-中 정상, 내달 샌프란시스코서 회동..."새로운 협력 모색"',
      'description':
          '바이든 미국 대통령과 시진핑 중국 국가주석이 다음 달 샌프란시스코에서 만난다. 양국은 이번 정상회담을 통해...',
      'imageUrl': 'https://picsum.photos/800/400?random=61',
    },
    {
      'id': 'world_2',
      'title': 'EU, 친환경 에너지 전환 가속화..."2035년 탄소중립 목표"',
      'description':
          'EU가 2035년까지 탄소중립 달성을 위한 새로운 정책을 발표했다. 회원국들은 재생에너지 비중을 크게 늘리기로...',
      'imageUrl': 'https://picsum.photos/800/400?random=62',
    },
    {
      'id': 'world_3',
      'title': '일본 증시 33년 만에 최고치..."엔저 효과"',
      'description':
          '일본 닛케이 지수가 1990년 이후 최고치를 기록했다. 엔저 현상이 지속되면서 수출 기업들의 실적이 개선되며...',
      'imageUrl': 'https://picsum.photos/800/400?random=63',
    },
    {
      'id': 'world_4',
      'title': '동남아시아, 디지털 전환 본격화..."스마트시티 건설 붐"',
      'description':
          '베트남, 인도네시아 등 동남아 국가들이 스마트시티 건설에 박차를 가하고 있다. 한국 기업들의 참여도 활발히...',
      'imageUrl': 'https://picsum.photos/800/400?random=64',
    },
  ],
  'IT/과학': [
    {
      'id': 'tech_1',
      'title': '애플, AI 비서 \'시리\' 대폭 개편... GPT 기술 도입',
      'description':
          '애플이 AI 음성비서 시리의 대대적인 개편을 준비 중인 것으로 알려졌다. 업계에 따르면 GPT 기술을 도입해...',
      'imageUrl': 'https://picsum.photos/800/400?random=71',
    },
    {
      'id': 'tech_2',
      'title': '국내 첫 6G 통신 실험 성공..."2030년 상용화 청신호"',
      'description':
          '국내 연구진이 6G 통신 실험에 성공했다. 테라헤르츠 대역을 활용한 이번 실험은 향후 6G 상용화에 중요한 이정표가...',
      'imageUrl': 'https://picsum.photos/800/400?random=72',
    },
    {
      'id': 'tech_3',
      'title': '퀀텀컴퓨팅 상용화 앞당긴다..."양자암호통신 시대 개막"',
      'description':
          '국내 연구진이 양자컴퓨터의 핵심 기술인 큐비트 제어 기술을 개발했다. 이를 통해 퀀텀컴퓨팅 상용화가...',
      'imageUrl': 'https://picsum.photos/800/400?random=73',
    },
    {
      'id': 'tech_4',
      'title': '메타버스 플랫폼에 현실 경제 접목..."가상 부동산 거래 활성화"',
      'description':
          '메타버스 플랫폼에서 가상 부동산 거래가 활발해지고 있다. 기업들은 이를 새로운 비즈니스 기회로 보고...',
      'imageUrl': 'https://picsum.photos/800/400?random=74',
    },
  ],
};
