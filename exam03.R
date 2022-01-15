list.files()

titanic <- read.csv("titanic_2.csv")
titanic
 
# 데이터의 앞부분 확인 (기본값 6개)
head(titanic , 8) # 8줄
# 데이터의 뒷부분 확인 (기본값 6개)
tail(titanic , 3)
# 데이터 속성별 자료형태 출력
str(titanic)
# 데이터 속성별 통계량 출력
summary(titanic)
# <<< 사분위수 >>>
# five number summary
# 사분위수를 시각화한 그래프
# boxplot()
boxplot(titanic$Fare) 
# 진한선 = 중앙값
# 상자 위아래 선 1사분위수, 3사분위수
# 위,아래 수염 = 극단치 경계선
# 위,아래 수염밖의 점 = 극단치 원으로 표시됨

# 데이터 개수 알아보기
table(titanic$Embarked)
# 데이터의 차원 출력
dim(titanic)

# wordcloud2 패키지 설치 및 적용
install.packages("devtools")

library(devtools)

devtools::install_github("lchiffon/wordcloud2")

library(wordcloud2)

# wordcloud2를 그리는 방법
# 단어와 해당되는 빈도수를 데이터프레임으로 만들면 된다
word <- c("감성돔","굴찜","대방어","고등어","해삼")
fre <- c(100, 10, 30, 80, 90)
food <- data.frame(word, fre)
food
# 패키지 안에 있는 함수의 속성을 알 수 있는 방법
??wordcloud2
# 글자의 크기 size = (기본값 1)
# color 에 random-light 쓰면 랜덤색, 색상코드를 넣을경우 벡터형태로 
wordcloud2(food, size = 0.5, fontFamily = '궁서', color='random-light')

# Export -> save as web page : html 파일로 저장

list.files()
baseball <- read.csv("baseball.csv")

# 데이터 편차를 위해 4제곱 시킴
bb <- data.frame(구단 = baseball$구단, 승 = (baseball$승)^4)
bb

wordcloud2(bb, size=0.5, fontFamily = '굴림')

list.files()

stu <- read.csv("대학 계열별 학과수 및 학년별 재적학생수.csv")

stu1 <- data.frame(학과 = stu$소계열 , 학과수 = stu$학과수)

stu2 <- data.frame(학과 = stu$소계열 , 학생수 = stu$재적학생수)

wordcloud2(stu1, size = 0.5)
wordcloud2(stu2, size = 0.5)

#java, rjava 설치
install.packages("remotes")
remotes::install_github("mrchypark/multilinguer")
library(multilinguer)
install_jdk()

#의존성 패키지 설치
install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")

remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)

v1 <- "이 새벽을 비추는 초생달 오감보다 생생한 육감의 세계로 보내주는 푸르고 투명한 파랑새 술취한 몸이 잠든 이 거릴 휘젓고 다니다 만나는 마지막 신호등이 뿜는 붉은 신호를 따라 회색 거리를 걸어서 가다보니 좀 낯설어 보이는 그녀가 보인적 없던 눈물로 나를 반겨 태양보다 뜨거워진 나 그녀의 가슴에 안겨 창가로 비친 초승달 침대가로 날아온 파랑새가 전해준 그녀의 머리핀을 보고 눈물이 핑돌아 순간 픽하고 나가버린 시야는 오감의 정전을 의미 이미 희미해진 내 혼은 보라빛 눈을 가진 아름다운 그녀를 만나러 파랑새를 따라 몽환의 숲으로 나는 날아가 단 둘만의 가락에 오감의 나락에 아픔은 잊어버리게 내 손은 그녀의 치마자락에 하늘에 날린 아드레날린 하나도 화날일 없는 이곳은 그녀와 나 파랑새만이 육감의 교감으로 오감따위는 초월해버린 기적의 땅 쉿 몽환의 숲 하늘에 날린 아드레날린 하나도 화날일 없는 이곳은 그녀와 나 파랑새만이 육감의 교감으로 오감따위는 초월해버린 기적의 땅 쉿 몽환의 숲"

extractNoun(v1)

useNIADic()


list.files()
# 엑셀파일 또는 메모장의 데이터를
# 한 줄 씩 읽어서 벡터로 저장
news <- readLines("2021_11_29_기준 인공지능 뉴스제목 500개.csv")
news
# 명사 추출하는 함수
news_noun <- extractNoun(news)
# [[1]] : 리스트형태
head(news_noun)
# 리스트형태의 데이터를 벡터로 변환하는 함수
news_unlist <- unlist(news_noun)
news_unlist
# 빈도수를 확인하는 함수
result1 <- table(news_unlist)
# 정렬하기( 내림차순 )
result2 <- sort(result1, decreasing = T)

# wordcloud2 패키지 사용
library(wordcloud2)
wordcloud2(result2, size=1)
# '인공지능' 제거
result3 <- result2[-1]
wordcloud2(result3, size=0.5)
