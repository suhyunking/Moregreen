-- -----------------------------------------------------
-- Table `moregreen`.`member`
-- -----------------------------------------------------

-- set foreign_key_checks = 0;  
-- drop table member;
-- set foreign_key_checks = 1;
create database moregreen;
use moregreen;

CREATE TABLE IF NOT EXISTS `moregreen`.`member` (
  `m_num` INT NOT NULL AUTO_INCREMENT,
  `m_id` VARCHAR(60) NOT NULL,
  `m_pw` VARCHAR(60) NOT NULL,
  `m_email` VARCHAR(60) NOT NULL,
  `m_exit` CHAR(1) NOT NULL DEFAULT 'N',
  `m_exitdate` DATE NULL,
  PRIMARY KEY (`m_num`)
  );
  
 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee0317', 
'qwe123!@#',
'dahee_0317@naver.com',
'N',
null
); 

 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('qwe123123', 
'qwe123!@#',
'qwe123@naver.com',
'N',
null
); 

 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('asd456456', 
'qwe123!@#',
'asd456@naver.com',
'N',
null
); 

 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('zxc789789', 
'zxc789&*&',
'zxc789@naver.com',
'N',
null
); 

 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('iop123123', 
'zxc789&*&',
'jkljkl@naver.com',
'N',
null
); 

-- 1 -----------------------------------------------------------------------
 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee001', 
'zxc789&*&',
'dahee001@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee002', 
'zxc789&*&',
'dahee002@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee003', 
'zxc789&*&',
'dahee003@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee004', 
'zxc789&*&',
'dahee004@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee005', 
'zxc789&*&',
'dahee005@naver.com',
'N',
null
); 

-- 2 ----------------------------------------------------------------------

 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee006', 
'zxc789&*&',
'dahee006@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee007', 
'zxc789&*&',
'dahee007@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee008', 
'zxc789&*&',
'dahee008@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee009', 
'zxc789&*&',
'dahee009@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee010', 
'zxc789&*&',
'dahee010@naver.com',
'N',
null
); 

-- 3 ----------------------------------------------------------------------
 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee011', 
'zxc789&*&',
'dahee011@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee012', 
'zxc789&*&',
'dahee012@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee013', 
'zxc789&*&',
'dahee013@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee014', 
'zxc789&*&',
'dahee014@naver.com',
'N',
null
); 


 INSERT INTO member(m_id, m_pw, m_email, m_exit, m_exitdate) VALUES
('dahee015', 
'zxc789&*&',
'dahee015@naver.com',
'N',
null
); 

-- 4 ----------------------------------------------------------------------

-- -----------------------------------------------------
-- Table `moregreen`.`funding`
-- -----------------------------------------------------

-- set foreign_key_checks = 0;  
-- drop table funding;
-- set foreign_key_checks = 1;

-- desc funding; #테이블 구조 보기

CREATE TABLE IF NOT EXISTS `moregreen`.`funding` (
  `f_num` INT NOT NULL AUTO_INCREMENT, #펀딩 번호	
  `f_title` VARCHAR(60) NOT NULL, #펀딩 명칭
  `f_content` VARCHAR(16000) NOT NULL, #내용
  `f_days` INT NOT NULL, #펀딩 기간
  `f_enddate` DATE NOT NULL, #마감일
  `f_target` INT NOT NULL DEFAULT 500000, #목표 금액
  `f_totalmoney` INT NOT NULL DEFAULT 0, #현재 금액
  `f_rate` DOUBLE NOT NULL NULL DEFAULT 0.0, #펀딩률
  `f_status` INT NOT NULL DEFAULT 1, #진행 상태
  `f_reward` VARCHAR(60) NOT NULL, #리워드 명칭
  `f_price` INT NOT NULL, #리워드 금액
  `f_bname` VARCHAR(60) NOT NULL, #상호명
  `f_bnum` CHAR(10) NOT NULL, #사업자 번호
  `f_regdate` DATE NOT NULL DEFAULT (current_date()), #신청 일자
  `member_m_num` INT NOT NULL,
  PRIMARY KEY (`f_num`),
  CONSTRAINT `fk_funding_member`
    FOREIGN KEY (`member_m_num`)
    REFERENCES `moregreen`.`member` (`m_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUE
(
'국산 콩과 아로니아로 만든 청국장 밀키트', 
'호남평야에서 자란 작물로 만든 건강한 한 끼
시골집청국장은 청정함과 비옥함을 자랑하는 전라남도 무안군의 몽탄면에 위치한 밭에서 가족이 직접 농사지은 국내산 작물을 원재료로 사용해 몸에 좋고 맛도 좋은 청국장과 손두부를 직접 만듭니다. 신토불이라는 말처럼 우리 땅에서 난 농산물이 우리 몸에 가장 잘 맞는다는 믿음 하나로 25년 동안 정직하게 많은 분들의 한 끼에 함께해 왔습니다. 80%의 식재료는 직접 재배해 사용하고 직접 기르지 못한 나머지 재료는 지역 농산물을 활용하기에 지역 경제에 보탬이 되는 의미도 있습니다. 
좋은 재료에 전남의 손맛을 더했습니다.
단순히 농사짓고 식품으로 가공할 뿐 아니라 시골집순두부라는 식당을 함께 운영하며 작물을 더 맛있게 만드는 노하우를 쌓아왔습니다. 지역에서 나는 콩으로 만든 두부와 청국장과 직접 재배한 배추, 고추, 대파, 갓, 생강, 무 등으로 담근 김치는 손맛이 좋기로 유명한 목포 지역에서도 소문이 날 정도입니다. 건강에 좋은 아로니아 등 여러 작물을 직접 재배하고 다양하게 활용하여 드시는 분들에게 건강과 행복을 더하고자 합니다.',
60,
'2022-11-13',
50000,
10,
3,
'청국장 밀키트',
50000,
'시골집청국장',
'1234567890',
1
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'농부가 직접 만드는 영양만점 인절미 3종', 
'농부가 추수한 쌀로 만드는 떡
좋은 떡을 만들기 위한 더미들래의 노력은 농사부터 시작합니다. 봄에는 좋은 쌀을 수확하기 위해 벼의 종자를 선별해서 파종을 하고, 여름에는 벼가 무럭무럭 자랄 수 있도록 구슬땀을 흘리며 모내기를 하고 잡초를 뽑습니다. 오랜 기다림 끝에 가을이 되어 논이 황금색으로 물들면 쌀을 추수해 맛있는 떡을 만듭니다.
가족끼리 농사를 지어 수확한 쌀로 떡을 만들어 이웃과 나누게 된 것이 더미들래의 시작이었습니다. 저희의 떡이 많은 사랑을 받으면서 이제는 직접 생산한 쌀 외에도 이웃 농가에서 재배한 쌀을 계약재배를 통해 공급받아 떡을 만들고 있습니다.
바쁜 시간 속 작은 밥상, 영양만점 인절미 3종
지역에서 키운 국내산 찹쌀에 봄에 자라 영양 가득한 쑥, 블랙푸드 검은깨(흑임자), 맛도 좋고 몸에도 좋은 단호박을 더해 인절미를 새롭게 만들었습니다. 맛은 기본, 드시는 분들의 건강을 생각하는 더미들래는 HACCP 인증을 받은 설비에서 좋은 재료로 믿을 수 있는 떡을 만듭니다.
처음부터 끝까지, 농부의 진심을 담아 만든 더미들래 인절미는 바쁜 아침시간 식사대용, 출출한 오후 또는 손님 접대용 간식으로 안성맞춤입니다. 바쁜 일상 속에서 간편하지만 든든하게 한 끼를 채울 수 있는 인절미를 만들기 위해 노력했습니다. 손바닥만 한 작은 크기로 개별포장이 되어 있어 부담없이 떡을 들고 다니면서 드실 수 있으며, 상온해동으로도 금방 만들어낸 듯한 인절미의 쫄깃함을 즐기실 수 있습니다.',
30,
'2022-10-30',
500000,
100000,
20.8,
3,
'인절미',
25000,
'더미들래',
'2345678901',
2
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'깊은 휴식을 위해 나뭇잎 인센스를 피워요', 
'자연에서 온 향기로운 찬사
힌디어로 “좋은 손” 이라는 의미의 “꼬말핫”은 공정무역, 로컬, 환경가치를 존중하는 서스테이너블 브랜드입니다. 꼬말핫은 자연의 속도로 천천히 만들어진 물건을 통해 기술의 속도에 지친 여러분에게 삶의 여유와 이국의 유니크한 경험을 제안하고 있어요.
저희가 선보일 리워드는 인도의 유명한 생태공동체 “오르빌”에서 온 귀여운 나뭇잎 모양의 천연 인센스와 조약돌 모양의 인센스 홀더에요. 나뭇잎에 불을 붙이고 서서히 피어오르는 연기와 향을 음미해 보세요. 일상 속 루틴에 더해진 향이 여러분의 몸과 마음을 깊은 휴식으로 인도할 거에요.
휴식을 위한 몰입, 내면의 확장을 위한 선물
인센스(INCENSE)는 불에 태워 훈연 (냄새가 좋은 연기)를 감상하는 향 제품입니다. 심신의 안정과 질병예방을 위한 치유법으로, 집안의 잡내 제거, 공간의 향기 인테리어를 위한 오브제 등, 다양한 쓰임으로 사랑받고 있어요.',
90,
'2022-8-30',
500000,
550000,
120,
4,
'인센스+홀더',
20000,
'페이트레이드코리아그루',
'3456789012',
4
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'건강한 육류문화를 전하는 수제 소시지&햄', 
'BBC 굿푸드 잡지가 주목한 미트로칼
안녕하세요. 로컬의 가치를 전하는 수제 소시지&햄 공방 ‘미트로칼’을 운영하는 윤유경입니다. 미트로칼은 건강한 국산 재료와 세계 각국의 오리지널 레시피로 맛있고 건강한 수제 소시지와 햄을 만들고 있어요. 무항생제 인증을 받은 고기는 물론, 우리땅에서 자란 신선한 농산물을 사용해 로컬의 맛을 전하고 있죠. 이러한 철학 덕분에 BBC <굿푸드> 매거진이 선정한 ‘서울 인문식당 50’에 지정되기도 했답니다. 지금부터 미트로칼이 만드는 정통의 소시지와 햄을 소개해드릴게요.
오리지널 레시피와 신선한 로컬 재료로 만들어요
미트로칼을 열기 전, 비영리단체 국제슬로푸드한국협회에서 일하며 유럽의 여러 축산 농가들을 방문하는 기회가 많았습니다. 그들과 이야기하며 자연스럽게 육가공 제조법에 대해 알게 되었고, 뒷다리, 간, 껍질 등 비인기 부위까지 다양한 형태와 맛을 가진 소지지와 햄으로 즐길 수 있다는 것이 매력적으로 다가왔어요.
농장에서 건강하게 키운 한돈, 한우 그리고 로컬 식재료로 만든 맛있고 건강한 수제 소시지를 한국에도 전하고 싶었고, 그렇게 미트로칼의 문을 열게 되었습니다. 미트로칼은 생소시지부터 콜드 스모킹 방식의 훈제소시지, 발효건조 소시지까지 소시지의 형태와 제조 방법에 제한을 두지 않고 다채로운 소시지의 맛을 전하고 있어요!
* 콜드 스모킹 : 열기보다 은은한 연기를 이용해 섬세하게 향을 입히는 방식.',
60,
'2022-11-11',
500000,
100000,
20,
3,
'수제소시지&햄',
20000,
'미트로칼',
'4567890123',
4
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'청년 농부와 어르신이 함께 만든 호박즙', 
'청정한 전남 무안에서 자란 착한 작물
안녕하세요. 황토의 고장 전남 무안에서 할머님들과 함께 호박 농사를 짓고 있는 농부 김현선입니다. 그랜마펌킨은 그랜마(할머니)와 펌킨(호박)의 합성어입니다. 고령화되고 영세해져가는 농촌 문제를 청년 농부의 노력으로 조금씩 해결해 나가고자 합니다. 그래서 작물을 고를 때부터 많은 고민을 했습니다. 태생부터 건강한 호박은 병충해에 강해 어르신도 쉽게 기를 수 있는 실버 작물입니다. 그랜마펌킨은 늙은 호박이 나와 우리 이웃을 살리는 열쇠라 믿고 있습니다.
청년 농부와 어르신이 함께 만드는 호박즙
그랜마펌킨의 호랑이와 할머니 캐릭터는 전래동화 ‘팥죽할멈과 호랑이’에서 영감을 받아 만들어졌습니다. 그랜마펌킨의 용맹한 호랑이, 호열이가 할머니의 호박즙에 반해 할머니를 도와 호박을 심고 호박즙으로 서로 가족이 되는 이야기입니다. 호랑이띠인 저와 시골 할머님이 함께 농사를 짓고 호박으로 호박즙을 만드는 저희 진짜 이야기를 녹여냈답니다. 그랜마펌킨의 모든 제품은 농촌 농가와 1:1 계약재배를 통해 생산됩니다. 이를 통해 농촌은 경제력을 회복하고 소비자는 믿을 수 있는 제품을 받아 보실 수 있습니다.',
60,
'2022-09-11',
500000,
100000,
20,
5,
'호박즙',
10000,
'그랜마펌킨',
'5678901234',
4
);
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'농부의 내년 농사를 돕는 두유 긴급 SOS', 
'갈 곳 잃은 토종콩 두유
우리 땅에서 정성스럽게 생산된 토종콩 두유, 맛과 품질에는 문제가 없지만 판로가 막혀 유통채널로 공급이 어려운 제품들이 있습니다. 보통은 유통기한이 넉넉한 제품을 원하기 때문에 유통기한이 얼마 남지 않은 제품은 문제가 없더라도 유통이 어렵습니다.
올 겨울 농부들에게 두유의 원재료가 되는 약콩과 토종콩을 정당한 가격을 주고 매입하려면 두유 판매가 잘 되어야 합니다. 토종콩 구입 자금 마련을 위해 유통기한이 약 2개월 정도 남은 두유를 30% 할인된 가격으로 판매합니다.
토종콩을 복원한 ‘청서리태’으로 만든 두유
고소한 약콩두유와 함께 지난 펀딩에 400분 넘게 참여해주신 맛있는 초록콩두유도 함께 소개합니다.
옛 어른들은 청태, 서리태를 맛있는 콩이라고 이야기합니다. 경기도에서는 이 토종콩을 기본으로 한 ‘녹풍콩’을 개발해 2017년부터 보급하고 있습니다. 두유 전용으로 개발된 녹풍콩은 노란콩(백태)를 이용해 만든 두유보다 맛이 진하고 고소한 특징을 가지고 있습니다. 좋은 콩이 사라지지 않고 계속 이어지기 위해 두유를 만들었습니다.',
60,
'2022-09-01',
500000,
3000000,
600,
4,
'두유',
10000,
'농사펀드',
'1111111111',
1
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'매달 찾아오는 제주 제철 과일 꾸러미', 
'과일 앞에서 이런 고민을 해보지 않으셨나요?
"이 과일 제철이 지금인가? 지난달에 매대에서 봤던 것 같기도 하고.."
"같은 과일이라도 품종에 따라 조금씩 다르다던데, 다 똑같이 판매하네. 누가 어떻게 재배했는지 알 수는 없을까?"
"고민할 필요 없이 매달 제철 과일을 편하게 받아봤으면 좋겠다!"

고민하지 마세요. 무릉외갓집이 과일을 추천해드립니다!
제주에서는 1년 내내 약 30가지의 과일이 생산됩니다. 제주 하면 떠오르는 감귤류부터 망고, 키위, 포도, 수박, 블루베리와 바나나, 파인애플까지… 바로 이 제주의 과일을 그 과일의 제철에 드실 수 있는 방법이 있습니다. 무릉외갓집이 매달 큐레이션하여 구성한 과일박스를 달마다 받아보세요.
알고 먹으면 더 맛있습니다.
우리는 감귤, 망고, 블루베리라고 알고 있지만, 그 안에서도 품종이 나뉜다는 사실을 알고 계신가요? 조생 감귤도 일남일호, 유라조생 등 다양한 품종이 있고, 블루베리도 신틸라, 수지블루 등 다양하답니다.
또 농부에 따라서, 재배 방식에 따라서도 조금씩 다른 맛이 납니다. 농부에 따라, 재배 방식에 따라 다른 맛을 비교해 볼 수 있는 경험은 무릉외갓집의 과일꾸러미를 통해서 가능합니다. 그리고 상세한 과일 설명과 누가 어떻게 재배했는지 등 스토리를 담은 레터를 넣어드릴거에요. 알고 먹으면 더 맛있지 않을까요?',
60,
'2022-09-11',
500000,
100000,
20,
5,
'과일 꾸러미',
10000,
'무릉외갓집',
'2222222222',
2
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'직접 키운 허브로 만든 식물성 살균제', 
'살균제이지만 향기로운 방향제
농업도 완성도를 높이면 예술이 될 수 있다는 생각으로 시작한 팜아트홀릭 농부들. 평소 좋아하는 허브를 조금더 친근하게 사용하는 방법에 대해 고민하고 노력한 결과, 팜메이드 유칼립투스 & 티트리를 만들게 되었습니다. 허브의 자생환경을 조사하기 위해 직접 호주에 다녀왔습니다. 직접 발아시키고 키운 티트리와 유칼립투스로 제품을 만들고 싶었습니다.
직관적인 재료를 사용하여 살균력을 검증하고, 유칼립투스와 티트리 향기를 오롯이 담았습니다. 믿고 사용하실 수 있도록 직접 키운 허브로, 직접 만들었습니다. 살균제이지만 향기로운 방향제를 제안드립니다.
꼭 필요한 성분들로만 사용하세요.
검증된 핵심 성분들만 추려 원료 3가지 성분으로만 구성했습니다. 조금 더 친근하게 사용하실 수 있도록 식물성 에탄올과 직접 키운 유칼립투스, 티트리 추출물을 사용했습니다.
살균력도 검증받았습니다. 눈에 보이지 않지만, 우리는 유해균에 늘 노출되어 있습니다. 지표세균 대장균, 폐렴의 원인균인 폐렴간균 등 일상에서 자주 접하는 6가지 균에 대한 99.99% 살균력을 검증 받았습니다.',
60,
'2022-09-11',
500000,
100000,
20,
5,
'식물성 살균제',
10000,
'팜아트홀릭',
'3333333333',
4
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'홈바리스타 만들어주는 커피 정기구독 아르미', 
'아르미야, 우리 같이 커피 내려 마시지 않을래?
오늘은 커피 내릴 때가 가장 예쁜 아르미를 찾으러 왔습니다. 아르미가 누구냐고요? 아르미는 아름다운커피의 커피 정기 구독자 분들을 부르는 애칭이에요. 요 알파카들은 아르미 캐릭터 ‘알아 (알파카 아르미)’ 라고 합니다.
나의 선택으로 공정한 댓가를 받는 농가가 늘어나요.
아름다운커피는 한국에서 공정무역을 처음으로 소개한 사회적기업입니다 아름다운커피는 커피농가에 최저 가격이 보장된 생두값을 미리 지불한 뒤 커피를 구매한다는 원칙을 고수하고 있습니다. 제대로 된 생두 값을 받은 커피 농가가 걱정 없이 안정적으로 농사를 짓고, 이를 통해 질 좋은 커피를 생산할 수 있도록 하기 위해서입니다.',
60,
'2022-09-30',
500000,
1000000,
200,
4,
'드립커피',
10000,
'아름다운커피',
'4444444444',
1
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'비누 유목민을 위한 비건 샴푸바와 클렌징바', 
'나를 가꾸는 일이 모두가 행복한 일이 될 수 있도록
환경을 위한 일이 지금보다 간편하고 쉬워지면 어떨까요? 나 자신을 위한 행동이 환경에도 좋은 영향을 준다면 그야말로 일석이조겠지요! 타이거릴리는 사람과 동물, 환경을 생각하는 마음으로 제품을 만듭니다. 거기에 소비자의 목소리까지 놓치지 않죠. 지금부터 단점을 보완한 타이거릴리의 샴푸바와 클렌징바를 소개해드릴게요.
사람과 동물과 환경을 생각하는 ‘타이거릴리’
안녕하세요, 지속가능한 라이프스타일을 추구하는 ‘타이거릴리’입니다. 저희는 EWG* 그린 등급, 유기농, 비정제, 에센셜오일 등 식물성 원료를 바탕으로 한 핸드메이드 비건 워시 제품과 향수, 디퓨저를 선보이고 있어요. 또, 식물성 원료지만 야생동물의 서식지를 파괴하는 팜오일 등의 재료는 일절 배제하고 있지요. 효능은 물론 아름다운 가치를 가진 재료를 사용하고 또 그런 제품을 만들기 위해 노력합니다.
포장과 택배 과정에서도 플라스틱 완충재 대신 신문지를 사용하고, 테이프 사용을 줄이기 위해 조립식 박스를 쓰고 있지요. 가까운 거래처와는 직접 제품을 주고받으며 택배 이용을 지양하고요. 작은 실천이 모든 존재를 위한 존중으로 이어지기를 바라는 마음으로 운영하는 중입니다.

*EWG : 미국의 사설 비영리 환경 단체로, 화장품과 생활화학제품 등에 들어가는 성분의 안전성을 등급과 색깔로 분류하는 일을 하고 있다. 각 단계는 안전함에 따라 그린, 옐로우, 레드로 나뉜다.',
60,
'2022-09-11',
500000,
150000,
30,
5,
'샴푸바와 클렌징바',
10000,
'타이거릴리',
'5555555555',
4
);

-- ----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'당일 수확해 보내 더 달콤한 샤인머스켓', 
'도도팜 도인호 농부의 샤인머스켓
이곳이 포도밭으로 가꿔진지는 50여 년이 넘었지만, ‘도도팜’이라는 이름은 작년에 가지게 되었습니다. 작년부터 도인호 농부가 아버지와 같이 농사를 짓기로 결심하면서 지은 이름이기 때문인데요. 아버지와 아들의 성이 만나 도도, 도씨 가문의 ‘도’와 포도의 ‘도’가 만나 도도팜입니다.
도인호 농부는 아버지가 기르던 검붉은 캠벨 나무 몇 그루를 정리하고 아들은 새초롬한 샤인머스켓 나무를 심었습니다. 쉽지 않은 결정이었지만 시장의 변화에 발맞춰 가며. 아버지의 아버지 때로부터 이어져온 농업과 농촌을 지속 가능하도록 하고자 합니다.
포도나무 한 그루에 담긴 기도하는 마음
포도밭이 있는 대전 판암동은 일제 강점기 때 일본 사람들이 포도라는 작물을 들여와서 농사짓던 지역입니다. 품 삵으로 받은 포도가지로 지금의 포도밭을 일구게 되었습니다. 50여년 동안 포도나무 한 그루 한 그루를 붙잡고 기도하는 마음으로 가꿔온 아버지의 포도밭을 도인호 농부는 잘 이어가보고자 합니다. 도인호 농부는 샤인머스켓을 바라보며 아버지와 같은 품종을 농사짓게 되면 부친의 간섭이 많아 어려울 것 같으니 다른 품종을 선택한 것도 있다며 웃어 보입니다.',
60,
'2022-11-11',
500000,
100000,
20,
3,
'샤인머스켓',
20000,
'논밭상점',
'6666666666',
2
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'북극곰을 위하는 고체 샴푸바&린스바 세트', 
'멸종 위기에 처한 북극곰
급격한 기후변화로 인해 많은 동물이 고통받고 있습니다. 우리에게 친숙한 북극곰도 지구 온난화로 서식지인 빙하가 녹아내리며 멸종 위기에 처하게 되었습니다. 오마이어스는 정성준 작가와 함께 북극곰 캐릭터와 스토리를 개발함으로써 기후변화로 발생하는 위기가 결코 먼 북극의 이야기가 아닌 지금 당장 우리 앞에 펼쳐진 현실이라는 것을 알리고자 합니다.

그 잔잔한 여정의 첫 시작이 저희가 개발한 북극곰 캐릭터인 ‘비비곰’과 함께하는 샴푸바와 린스바입니다. 진정한 제로 웨이스트의 실현을 통해 탄소 발자국은 줄이고 곰 발자국은 늘리자는 취지로 기획되어 매일 아침 비비곰의 발바닥과 우리의 손바닥이 만나 서로 교감을 누림으로써 하루 1회 머리 감기를 실천하고, 하루 1회 북극곰을 응원하는 메시지를 전달하고자 합니다.
환경의 가치를 일깨우고 확산합니다!
오마이어스(Oh my earth)는 지구환경과 기후변화 대응의 상징적 브랜드를 통해 가치소비 모델을 구축하고, 소셜 임팩트를 실현하는 혁신적 플랫폼을 구현하는 예비사회적기업입니다. 저희는 환경문화 콘텐츠 IP 개발을 시작으로 일회용 대체재 솔루션 개발, 도시재생 공간 사업 등 세 가지 사업 영역을 바탕으로 다양한 분야에서 환경의 가치를 일깨우고 확산하고자 합니다. 이런 노력으로 지구의 탄소발자국을 낮추기 위해 계속해서 더 빠르고, 더 쉽게, 더 많은 사람들과 그 길을 함께 가는 방법에 대해 고민하겠습니다.',
60,
'2022-11-11',
500000,
100000,
20,
3,
'샴푸바&린스바',
20000,
'오마이어스',
'7777777777',
2
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'티끌 플라스틱 모아 만든 일상 플로깅 키트', 
'‘환경 운동가’를 떠올리면 무엇이 떠오르나요?
환경 운동가하면 큰 피켓, 현수막을 들고 기후 위기를 외치거나 높은 강연대 어딘가 목소리 높이고 있는 활동가의 모습을 생각하고 있지 않나요. 이번 키트를 준비하며, 우리 주변에는 생각보다 다양한 모습의 일상 활동가들이 있다는 것을 깨달았습니다. 회사 내 다회용기 대여 서비스 도입을 제안하는 회사 동료, 플라스틱 포장 대체재를 찾기 위해 고군분투하고 있는 이웃 가게 사장님, 지역 주민에게 순환 경험을 안겨주는 자원 순환 거점 공간들까지. 로우리트는 지속 가능한 소비와 생산을 고민하고, 이를 주변에 전하는 이들 모두가 ‘데일리 액티비스트’라고 생각했습니다.
데일리 액티비스트를 위한 플로깅 키트
지난여름, 기후 변화로 인한 폭우로 도심 곳곳에 침수 피해를 일으켰습니다. 침수된 강남 고속도로 인근에서 하수구 아래 쓰레기를 퍼내던 남성을 우리는 ‘슈퍼맨’이라고 불렀는데요. 그렇다면 하수구를 채우고 있던 담배꽁초, 쓰레기들을 버린 우리 주변 ‘빌런’들은 어떤 마음을 가지고 있을까요? 환경 문제는 과연 환경단체, 캠페이너들 만의 이야기일까요? 그런 질문과 고민에서 일상 속 영웅, 데일리 액티비스트를 위한 플로깅 키트를 준비하게 되었습니다.',
60,
'2022-11-11',
500000,
500000,
100,
3,
'플로깅 키트',
20000,
'로우리트콜렉티브',
'8888888888',
3
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'비건 성분으로 두피 건강을 지키는 탈모 샴푸', 
'바쁜 현대 사회 속 늘어나는 탈모 인구
예전에 탈모는 중년 이후의 남성에게 주로 일어나는 일로, 젊은 남성 및 여성과는 상관없는 문제로 여겨졌습니다. 하지만 최근에는 유전성 탈모뿐 아니라 비유전성 탈모도 늘어 연령과 성별에 상관없이 누구에게나 생길 수 있습니다. 탈모 인구는 계속 증가해 우리나라 전체 인구 5명 중 1명은 탈모증으로 고민을 하고 있거나 적극적으로 치료하고 있다고 추정되고 있는 상황입니다. 고른 영양 섭취, 충분한 휴식, 스트레스 조절, 약물 치료 등 어려운 탈모 관리법 중에서 우리가 가장 쉽게 할 수 있는 실천 중 하나가 안전하고 순한 샴푸 사용입니다. 작은 생활습관 변화를 함께할 그린아뜰리에 제품을 소개합니다!
100% 식물성 성분으로 이뤄낸 기능성
혹시 탈모샴푸 사용 후 특유의 빳빳함 때문에 쓰기 꺼려지셨나요? 그린아뜰리에만의 비건 포뮬러로 만든 누드 탈모케어 샴푸는 님나무, 미세조류 및 검정콩과 흑미 등 블랙 콤플렉스를 비롯해 피부에 유익한 여러 식물성 성분으로 가득 채웠습니다. 헤어 윤기와 보습감이 뛰어나 바쁜 아침 컨디셔너를 안 사용해도 괜찮을 정도입니다. 비건 제품은 세정력이 떨어진다는 고정 관념을 깰 수 있도록 각질 케어 특허성분과 자연 유래 식물성 계면활성제로 모공을 막아 탈모를 유발하는 오염물을 자극 없이 깨끗이 씻어냅니다. 저(무)자극 피부 테스트와 식약처 등록도 완료해 더 믿을 수 있습니다.',
60,
'2022-11-11',
500000,
2000000,
400,
3,
'탈모 샴푸',
20000,
'그린아뜰리에',
'9999999999',
3
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'가볍고 튼튼한 친환경 종이 의자와 테이블', 
'재활용이 가능한 종이 가구
1인 가구의 증가를 비롯해 많은 현대인의 생활 방식이 변화하며 이사 횟수가 늘고 있습니다. 그로 인해 많은 가구가 짧은 기간 사용 후 매립되거나 소각되고 있습니다. 페이퍼팝은 폐기나 재활용이 어려웠던 기존 가구 소재의 대안으로 50% 이상 재활용 가능한 종이를 선택하여 다양한 일상의 물건을 만듭니다. 종이 가구는 택배로 배송될 수 있는 있을 정도로 이동이 쉬운 동시에 합리적인 가격을 자랑합니다.
탄소발자국을 줄이는 소셜벤처
많은 가구들이 원가를 절감하기 위해 해외에서 생산되고 있지만, 페이퍼팝의 모든 제품은 대한민국에서 개발부터 생산까지 모두 이루어집니다. 해외 제품의 모방이 아닌 자체적인 R&D로 자부심을 갖고 제품을 만들어 가는 동시에 소셜벤처로서 탄소발자국을 조금이라도 더 줄이고자 합니다. 제품 개발 단계부터 사용 이후의 순환을 고려해 재활용될 수 있는 소재를 선택하며 누구나 쉽게 분리배출할 수 있도록 직관적인 디자인과 조립 방식을 우선시하고 있습니다.',
30,
'2022-09-11',
500000,
100000,
20,
4,
'친환경 종의 의자와 테이블',
20000,
'페이퍼팝',
'1212121212',
3
);
-- -----------------------------------------------------------------------------------------------------
INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'원두 껍질로 만든 제로웨이스트 파밍 키트', 
'원두 껍질로 만든 지속 가능성
기후변화의 영향으로 우리가 매일 마시는 커피 또한 지속 가능성에 대한 우려가 커지고 있습니다. 일회용 포장 쓰레기뿐 아니라 커피 한 잔을 만드는 과정에서도 폐기물이 발생하기 때문입니다. 커피의 원두는 로스팅 과정에서 열을 가하면 표피가 떨어지는데 쉽게 생각하면 땅콩껍질과 비슷합니다. 현재 국내에서 발생한 원두 껍질은 보통 일반 쓰레기로 버려집니다. 리와인드에서는 원두 껍질을 매립지가 아닌 자연으로 되돌리기 위해 비료화가 아닌 한 번 더 순환시키는 ‘제로포트’를 만들게 되었습니다. 제로포트는 원두 껍질과 케나프 줄기로 만들어진 리사이클 화분으로 비닐포트를 대체할 수 있습니다.
일회용품을 만들지만 쓰레기는 만들지 않습니다.
리와인드는 일상생활 속에서 불가피하게 사용하게 되는 일회용품의 생산부터 재활용까지의 선순환을 통해 플라스틱 폐기물 문제를 해결해나가는 소셜벤처입니다. 자연에서 유래한 소재로 만든 일회용 포장재를 만들어 플라스틱을 대체하는 친환경 브랜드 아이엠그리너와 생산한 제품들은 일회용이지만, 쓰레기로 취급되어 버려지지 않고 다시 자원으로 활용될 수 있도록 자원순환 플랫폼 ‘ 제로사이클’을 운영하고 있습니다.',
60,
'2022-10-23',
500000,
250000,
50,
3,
'파밍 키트',
25000,
'리와인드',
'1313131313',
1
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'청각장애 플로리스트와 함께하는 생화 정기 구독', 
'꽃잎으로 전하는 따뜻한 이야기
플립(FLIP)은 꽃(FLOWER)과 잎(LEAF)의 합성어입니다. 우리는 청각장애 플로리스트의 “꽃잎(FLIP)으로 전하는 이야기”를 통하여 장애인과 비장애인이 함께하는 사회를 만들어(FLIP) 갑니다. 플립은 청각장애인이 듣지 못하는 사람이 아니라, 더 잘 보는 사람이라는 것을 알고 있습니다. 편견 없이 자신의 재능을 통하여 잘하는 일을 더 잘하게 하는 것이 플립이 해야 할 역할이라 생각합니다.
장애인에게 교육과 일자리를 선물합니다.
플립은 생화 정기배송 서비스를 통해 청각장애 플로리스트를 양성한 뒤, 직접 채용하고 있습니다. 더불어 장애인과 비장애인에 대한 사회적 인식 개선을 위해 다양한 활동을 함께합니다. 삶에 향기를 더하는 꽃 구독으로 청각장애 플로리스트와 함께해 보세요. 발달된 시각과 후각으로 인한 장점을 활용할 뿐 아니라 개인의 창의력까지 발휘하는 전문가들이 여러분을 위한 꽃 선물을 전달합니다.',
60,
'2022-10-23',
500000,
250000,
50,
3,
'꽃 정기구독(3개월도안 총 6번)',
25000,
'플립플라워',
'1414141414',
2
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'꿀벌을 지키는 재밌고 맛있는 쿠키', 
'꿀벌 실종 사건을 아시나요?
2022년 1월, 우리나라에서 갑자기 꿀벌들이 사라진 실종 사건이 있었습니다. 우리나라뿐 아니라 최근 전 세계에서 꿀벌들이 사라지는 추세입니다. 정확한 원인은 아직 밝혀지지 않았지만 이상 기후가 가장 큰 원인으로 꼽히고 있는데요. 2015년 연구에 따르면 꿀벌이 멸종할 경우, 한 해 142만 명의 사람들이 사라질 것이라는 예측이 나오기도 했습니다. 이번 펀딩은 사라져가는 꿀벌을 지키기 위해 시작됐습니다.
꿀벌을 지키는 재밌고 맛있는 쿠키 만들기!
슈가클레잇은 재밌게 만들고, 맛있게 먹을 수 있는 DIY 쿠키 만들기 키트입니다. 말랑 쫀득한 슈가클레잇 반죽으로 귀여운 꿀벌 모양의 디저트를 만들어보세요! 어른, 아이 할 것 없이 손쉽게 만들 수 있는 꿀벌 키트에는 슈가 크래커를 만들 수 있는 재료와 도구가 모두 포함되어 있습니다. 설명서에는 누구나 금손으로 만들어 줄 친절한 만들기 방법과 함께 꿀벌들의 이야기가 담겨있어 아이들도 어렵지 않게 즐길 수 있답니다. 무엇보다 수익은 사라져가는 꿀벌을 지키기 위해 꿀벌 양봉농가와 멸종 위기 동물을 위해 사용됩니다.',
60,
'2022-09-08',
500000,
100000,
20,
5,
'쿠키',
10000,
'크리에이터스랩',
'1515151515',
5
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'나눔을 실천하는 산지 직송 방사 유정란', 
'달걀로 전하는 사랑
월간계란은 충남 홍성에서 3대째 양계업을 이어가고 있는 소셜벤처이자 예비사회적기업입니다. 구매해 주시는 계란 개수의 10%에 해당하는 달걀을 어려운 사정에 있는 노인분들과 아이들에게 기부하고 있습니다. 각자의 소비행위가 자연스럽게 나눔으로 이어져 복지 사각지대에 있는 이웃과 함께하는 사회적 가치를 지향합니다.
맛과 영양을 모두 잡은 방사 유정란
항생제를 쓰지 않고 방사형으로 직접 기른 닭이 낳은 유정란을 중간 유통과정 없이 산지 직송으로 판매하기에 신선하고 맛있습니다. 특히 월간계란의 베스트셀러인 초란은 요즘 병아리가 햇닭이 된 뒤 낳고 있어 품질이 좋습니다. 어린 닭이 알을 낳기 시작하고 4주 동안 낳는 알을 초란이라고 합니다. 마트 계란보다는 크기가 작지만, 영양가는 더 큰 계란입니다. 큰 달걀을 찾는 분들을 위해 대란도 함께 준비했습니다.',
60,
'2022-11-11',
500000,
100000,
20,
3,
'유정란',
20000,
'월간계란',
'1515151515',
5
);

INSERT INTO funding (f_title, f_content, f_days, f_enddate, f_target, f_totalmoney, f_rate, f_status, f_reward, f_price, f_bname, f_bnum, member_m_num) VALUES
(
'저소득층 여성을 돕는 유기농 생리대', 
'월경으로 어려움을 겪는 소녀들
월경 빈곤이란 경제, 환경적 이유로 인해 월경용품을 제대로 사용하지 못하는 상태를 말합니다. 우리나라에도 많은 사람들이 월경 빈곤에 처해 있지만, 그중 대표적인 이들은 저소득층 여성 청소년입니다. 예쁜 선물, 생리대와 함께 축하받는 초경이 저소득층 가정 소녀들에게는 마냥 두렵고 막막하기만 합니다. 여성이라면 겪게 될 자연스러운 현상이 누군가에게는 경제적으로 부담이 되기 때문입니다. 정부에서도 저소득층 가정을 위한 지원 사업이 있지만, 사각지대에 놓이거나 지원을 제대로 활용하지 못해 월경 빈곤에 처한 이들이 여전히 많은 상황입니다.
착한 제품으로 꿈꾸는 생활혁신
업드림코리아는 ‘세상을 따뜻하게 만들자’는 뜻을 가진 16명의 청년이 만든 봉사 모임으로 시작된 착한 소비를 향한 생활혁신 사회적기업입니다. 불합리한 소비를 없애고, 동시에 사회적 가치를 담은 임팩트 생활혁신 제품들로 혁신적인 제품, 서비스, 환경을 고객들에게 제공하고 있습니다. 특히 ‘선함을 일상으로 만들다’라는 슬로건 아래 생리대를 지원받지 못하는 국내 취약계층 아이들에게 지속 가능한 생리대 제공 및 월경에 대한 올바른 인식 개선을 위해 끊임없이 노력하며 성장하고 있습니다.',
90,
'2022-11-11',
500000,
1000000,
200,
1,
'유기농 생리대',
20000,
'업드림코리아',
'1515151515',
5
);

-- -----------------------------------------------------
-- Table `moregreen`.`like`
-- -----------------------------------------------------

-- desc likefunding; #테이블 구조 보기 

-- set foreign_key_checks = 0;  
-- drop table likefunding;
-- set foreign_key_checks = 1;


CREATE TABLE IF NOT EXISTS `moregreen`.`likefunding` (
  `l_num` INT NOT NULL AUTO_INCREMENT,
  `member_m_num` INT NOT NULL,
  `funding_f_num` INT NOT NULL,
  PRIMARY KEY (`l_num`),
  CONSTRAINT `fk_like_member1`
    FOREIGN KEY (`member_m_num`)
    REFERENCES `moregreen`.`member` (`m_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_funding1`
    FOREIGN KEY (`funding_f_num`)
    REFERENCES `moregreen`.`funding` (`f_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `moregreen`.`delivery`
-- -----------------------------------------------------


-- set foreign_key_checks = 0;  
-- drop table delivery;
-- set foreign_key_checks = 1;


CREATE TABLE IF NOT EXISTS `moregreen`.`delivery` (
  `d_num` INT NOT NULL AUTO_INCREMENT,
  `d_name` VARCHAR(60) NULL,
  `d_phone` CHAR(11) NULL,
  `d_zipcode` CHAR(5) NULL,
  `d_addr` VARCHAR(60) NULL,
  `d_detailaddr` VARCHAR(60) NULL,
  PRIMARY KEY (`d_num`)
);


INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'김다희', #배송지에 입력할 회원 이름
01011111111, #배송지에 입력할 회원 전화번호(*** - **** - ****) : 숫자만 사용가능
11111, #배송지에 입력할 우편번호(*****) : 숫자만 사용가능
'경기도 의정부시 범골로 137', #배송지에 입력할 주소
'1층' #배송지에 입력할 상세주소
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'이다희',
01022222222,
22222,
'경기도 의정부시 범골로 137',
'2층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'박다희',
01033333333,
33333,
'경기도 의정부시 범골로 137',
'3층'
);


 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'최다희',
01044444444,
44444,
'경기도 의정부시 범골로 137',
'4층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'정다희',
01055555555,
55555,
'경기도 의정부시 범골로 137',
'5층'
);

-- 1 -----------------------------------------------------------------------------

INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'김수남', #배송지에 입력할 회원 이름
01066666666, #배송지에 입력할 회원 전화번호(*** - **** - ****) : 숫자만 사용가능
66666, #배송지에 입력할 우편번호(*****) : 숫자만 사용가능
'경기도 의정부시 범골로 137', #배송지에 입력할 주소
'6층' #배송지에 입력할 상세주소
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'이수남',
01077777777,
77777,
'경기도 의정부시 범골로 137',
'7층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'박수남',
01088888888,
88888,
'경기도 의정부시 범골로 137',
'8층'
);


 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'최수남',
01099999999,
99999,
'경기도 의정부시 범골로 137',
'9층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'정수남',
01011111112,
11112,
'경기도 의정부시 범골로 137',
'10층'
);

-- 2 -----------------------------------------------------------------------------

INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'김수현', #배송지에 입력할 회원 이름
01011111113, #배송지에 입력할 회원 전화번호(*** - **** - ****) : 숫자만 사용가능
11113, #배송지에 입력할 우편번호(*****) : 숫자만 사용가능
'경기도 의정부시 범골로 137', #배송지에 입력할 주소
'11층' #배송지에 입력할 상세주소
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'이수현',
01011111114,
11114,
'경기도 의정부시 범골로 137',
'12층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'박수현',
01011111115,
11115,
'경기도 의정부시 범골로 137',
'13층'
);


 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'최수현',
01011111116,
11116,
'경기도 의정부시 범골로 137',
'14층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'정수현',
01011111117,
11117,
'경기도 의정부시 범골로 137',
'15층'
);

-- 3 -----------------------------------------------------------------------------

INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'김경민', #배송지에 입력할 회원 이름
01011111118, #배송지에 입력할 회원 전화번호(*** - **** - ****) : 숫자만 사용가능
11118, #배송지에 입력할 우편번호(*****) : 숫자만 사용가능
'경기도 의정부시 범골로 137', #배송지에 입력할 주소
'16층' #배송지에 입력할 상세주소
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'이경민',
01011111119,
11119,
'경기도 의정부시 범골로 137',
'17층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'박경민',
01011111110,
11110,
'경기도 의정부시 범골로 137',
'18층'
);


 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'최경민',
01022222221,
22221,
'경기도 의정부시 범골로 137',
'19층'
);

 INSERT INTO delivery (d_name, d_phone, d_zipcode, d_addr, d_detailaddr) VALUES
(
'정경민',
01022222223,
22223,
'경기도 의정부시 범골로 137',
'20층'
);

-- 4 -----------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table `moregreen`.`purchase`
-- -----------------------------------------------------


-- desc purchase; #테이블 구조 보기 
-- drop table purchase;

CREATE TABLE IF NOT EXISTS `moregreen`.`purchase` (
  `p_num` INT NOT NULL AUTO_INCREMENT,
  `p_payment` INT NULL,
  `p_amount` INT NULL,
  `p_total` INT NULL,
  `p_method` INT NULL,
  `p_tid` VARCHAR(60) NULL,
  `p_date` DATETIME NULL,
  `delivery_d_num` INT NOT NULL,
  `member_m_num` INT NOT NULL,
  `funding_f_num` INT NOT NULL,
  PRIMARY KEY (`p_num`),
  CONSTRAINT `fk_purchase_delivery`
    FOREIGN KEY (`delivery_d_num`)
    REFERENCES `moregreen`.`delivery` (`d_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_member1`
    FOREIGN KEY (`member_m_num`)
    REFERENCES `moregreen`.`member` (`m_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_funding1`
    FOREIGN KEY (`funding_f_num`)
    REFERENCES `moregreen`.`funding` (`f_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1, # 1: 결제 완료 2: 결제 취소
1, #프로젝트 구매에 대한 수량
50000, #프로젝트 수량 * 펀딩금액에 대한 정보
1, #ex) 1: 카카오페이 2: 카드  <결제방법>
'2022-09-11', #구매에 대한 구매한 일시 YYYY-MM-DD hh:mm 형식으로 표시
1, #배송지테이블에 PK를 외래키로 사용
1, #멤버테이블에 PK를 외래키로 사용
1 #펀딩테이블에 PK를 외래키로 사용
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
4,
100000,
1,
'2022-10-15',
2,
2,
2
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
30,
600000,
1,
'2022-08-13',
3,
4,
3
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
5,
100000,
1,
'2022-11-04',
4,
4,
4
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
2,
10,
100000,
1,
'2022-09-01',
5,
4,
5
);

-- 1 --------------------------------------------------------------------------------------------------------------------

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1, # 1: 결제 완료 2: 결제 취소
300, #프로젝트 구매에 대한 수량
3000000, #프로젝트 수량 * 펀딩금액에 대한 정보
1, #ex) 1: 카드 2: API  <결제방법>
'2022-08-20', #구매에 대한 구매한 일시 YYYY-MM-DD hh:mm 형식으로 표시
6, #배송지테이블에 PK를 외래키로 사용
1, #멤버테이블에 PK를 외래키로 사용
6 #펀딩테이블에 PK를 외래키로 사용
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
2,
10,
100000,
1,
'2022-09-02',
7,
2,
7
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
2,
10,
100000,
1,
'2022-09-03',
8,
4,
8
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
100,
1000000,
1,
'2022-09-04',
9,
1,
9
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
2,
15,
150000,
1,
'2022-09-05',
10,
4,
10
);

-- 2 --------------------------------------------------------------------------------------------------------------------

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1, # 1: 결제 완료 2: 결제 취소
5, #프로젝트 구매에 대한 수량
100000, #프로젝트 수량 * 펀딩금액에 대한 정보
1, #ex) 1: 카드 2: API  <결제방법>
'2022-10-11', #구매에 대한 구매한 일시 YYYY-MM-DD hh:mm 형식으로 표시
11, #배송지테이블에 PK를 외래키로 사용
2, #멤버테이블에 PK를 외래키로 사용
11 #펀딩테이블에 PK를 외래키로 사용
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
5,
100000,
1,
'2022-09-15',
12,
2,
12
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
25,
500000,
1,
'2022-09-13',
13,
3,
13
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
100,
2000000,
1,
'2022-10-04',
14,
3,
14
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
5,
100000,
1,
'2022-09-05',
15,
3,
15
);

-- 3 --------------------------------------------------------------------------------------------------------------------

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1, # 1: 결제 완료 2: 결제 취소
10, #프로젝트 구매에 대한 수량
250000, #프로젝트 수량 * 펀딩금액에 대한 정보
1, #ex) 1: 카드 2: API  <결제방법>
'2022-09-11', #구매에 대한 구매한 일시 YYYY-MM-DD hh:mm 형식으로 표시
16, #배송지테이블에 PK를 외래키로 사용
1, #멤버테이블에 PK를 외래키로 사용
16 #펀딩테이블에 PK를 외래키로 사용
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
10,
250000,
1,
'2022-09-15',
17,
2,
17
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
2,
10,
100000,
1,
'2022-07-27',
18,
5,
18
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
5,
100000,
1,
'2022-08-04',
19,
5,
19
);

 INSERT INTO purchase (p_payment, p_amount, p_total, p_method, p_date, delivery_d_num, member_m_num, funding_f_num) VALUES
(
1,
50,
1000000,
1,
'2022-09-11',
20,
5,
20
);

-- 4 --------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table `moregreen`.`alarm`
-- -----------------------------------------------------


-- drop table alarm;

CREATE TABLE IF NOT EXISTS `moregreen`.`alarm` (
  `a_num` INT NOT NULL AUTO_INCREMENT,
  `a_message` VARCHAR(500) NULL,
  `funding_f_num` INT NOT NULL,
  PRIMARY KEY (`a_num`, `funding_f_num`),
  CONSTRAINT `fk_alarm_funding1`
    FOREIGN KEY (`funding_f_num`)
    REFERENCES `moregreen`.`funding` (`f_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
 

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.', #메시지 
1 #펀딩번호
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
2
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
3
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
4
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
5
);

-- 1 --------------------------------------------------

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.', #메시지 
6 #펀딩번호
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
7
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
8
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
9
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
10
);

-- 2 --------------------------------------------------

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.', #메시지 
11 #펀딩번호
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
12
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
13
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
14
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
15
);

-- 3 --------------------------------------------------

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.', #메시지 
16 #펀딩번호
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
17
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
18
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
19
);

 INSERT INTO alarm (a_message, funding_f_num) VALUES
(
'번 프로젝트 개설이 신청되었습니다.',
20
);

-- 4 --------------------------------------------------

-- -----------------------------------------------------
-- Table `moregreen`.`image`
-- -----------------------------------------------------


-- drop table image;

CREATE TABLE IF NOT EXISTS `moregreen`.`image` (
  `i_num` INT NOT NULL AUTO_INCREMENT,
  `i_name` VARCHAR(60) NOT NULL,
  `i_uuid` VARCHAR(60) NOT NULL,
  `i_regdate` TIMESTAMP DEFAULT NOW() NOT NULL,
  `i_type` INT NOT NULL,
  `funding_f_num` INT NOT NULL,
  PRIMARY KEY (`i_num`, `funding_f_num`),
  CONSTRAINT `fk_image_funding`
    FOREIGN KEY (`funding_f_num`)
    REFERENCES `moregreen`.`funding` (`f_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);


-- 1 ------------------------------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'2번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
2 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'2번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
2 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'2번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
2 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'2번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
2 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'2번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
2 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'2번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
2 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
2 #펀딩테이블 PK를 외래키로 사용
);

-- 2 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'3번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
3 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'3번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
3 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'3번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
3 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'3번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
3 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'3번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
3 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'3번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
3 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
3 #펀딩테이블 PK를 외래키로 사용
);

-- 3 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'4번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
4 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'4번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
4 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'4번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
4 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'4번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
4 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'4번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
4 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'4번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
4 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
4 #펀딩테이블 PK를 외래키로 사용
);

-- 4 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'5번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
5 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'5번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
5 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'5번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
5 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'5번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
5 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'5번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
5 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'5번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
5 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
5 #펀딩테이블 PK를 외래키로 사용
);

-- 5 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'6번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
6 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'6번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
6 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'6번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
6 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'6번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
6 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'6번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
6 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'6번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
6 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
6 #펀딩테이블 PK를 외래키로 사용
);

-- 6 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'7번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
7 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'7번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
7 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'7번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
7 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'7번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
7 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'7번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
7 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
7 #펀딩테이블 PK를 외래키로 사용
);

-- 7 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'8번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
8 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'8번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
8 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'8번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
8 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'8번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
8 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'8번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
8 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'8번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
8 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
8 #펀딩테이블 PK를 외래키로 사용
);

-- 8 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'9번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
9 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'9번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
9 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'9번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
9 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'9번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
9 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'9번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
9 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'9번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
9 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
9 #펀딩테이블 PK를 외래키로 사용
);

-- 9 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'10번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
10 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'10번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
10 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'10번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
10 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'10번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
10 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'10번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
10 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'10번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
10 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
10 #펀딩테이블 PK를 외래키로 사용
);

-- 10 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'11번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
11 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'11번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
11 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'11번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
11 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'11번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
11 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'11번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
11 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'11번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
11 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
11 #펀딩테이블 PK를 외래키로 사용
);

-- 11 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'12번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
12 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'12번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
12 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'12번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
12 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'12번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
12 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'12번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
12 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'12번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
12 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
12 #펀딩테이블 PK를 외래키로 사용
);

-- 12 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'13번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
13 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'13번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
13 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'13번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
13 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'13번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
13 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'13번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
13 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'13번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
13 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
13 #펀딩테이블 PK를 외래키로 사용
);

-- 13 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'14번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
14 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'14번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
14 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'14번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
14 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'14번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
14 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'14번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
14 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'14번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
14 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
14 #펀딩테이블 PK를 외래키로 사용
);

-- 14 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'15번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
15 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'15번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
15 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'15번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
15 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'15번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
15 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'15번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
15 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'15번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
15 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
15 #펀딩테이블 PK를 외래키로 사용
);

-- 15 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'16번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
16 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'16번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
16 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'16번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
16 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'16번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
16 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'16번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
16 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'16번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
16 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
16 #펀딩테이블 PK를 외래키로 사용
);

-- 16 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'1번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
1 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'17번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
17 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'17번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
17 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'17번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
17 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'17번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
17 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
17 #펀딩테이블 PK를 외래키로 사용
);

-- 17 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'18번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
18 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'18번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
18 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'18번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
18 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'18번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
18 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'18번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
18 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'18번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
18 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
18 #펀딩테이블 PK를 외래키로 사용
);

-- 18 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'19번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
19 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'19번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
19 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'19번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
19 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'19번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
19 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'19번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
19 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'19번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
19 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
19 #펀딩테이블 PK를 외래키로 사용
);

-- 19 -------------------------------------------------------------

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'20번프로젝트1.jpg', #이미지 이름
1, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
20 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'20번프로젝트2.jpg', #이미지 이름
2, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
20 #펀딩테이블 PK를 외래키로 사용
);

 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'20번프로젝트3.jpg', #이미지 이름
3, #이미지 같은이름을 등록시 uuid추가
1, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
20 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'20번프로젝트1.jpg', #이미지 이름
4, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
20 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'20번프로젝트2.jpg', #이미지 이름
5, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
20 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'20번프로젝트3.jpg', #이미지 이름
6, #이미지 같은이름을 등록시 uuid추가
2, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
20 #펀딩테이블 PK를 외래키로 사용
);
 INSERT INTO image (i_name, i_uuid, i_type, funding_f_num) VALUES
(
'사업자등록증.jpg', #이미지 이름
7, #이미지 같은이름을 등록시 uuid추가
0, #ex) 1: 대표이미지 2: 내용이미지 0: 사업자등록이미지 <사진종류>
20 #펀딩테이블 PK를 외래키로 사용
);

-- 20 -------------------------------------------------------------
