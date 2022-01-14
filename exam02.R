# 벡터 : 동일한 자료가 일차원으로 나열된 것
vec1 <- c(10,20,30,40,50)
vec1
vec2 <- c("사과",100,TRUE)
vec2
vec3 <- c(100.3, 33, TRUE, FALSE)
vec3

v_no <- seq(1,7)
v_name <- c('Apple','Peach','Banana','Grape','Kiwi','Orange','Mango')
v_price <- c(500,200,100,300,150,250,450)
v_stock <- c(5,2,4,7,5,3,8)

# 데이터프레임 만드는 방법 data.frame()
sales <- data.frame(v_no,v_name,v_price,v_stock)
sales
# 데이터를 꺼냈는데 콘솔에 [] 가 없으면 데이터 프레임
# []가 있으면 벡터

# 자료구조를 좀 더 괜찮게 보는 방법
View(sales)

# DataFrame에서 원하는 데이터만 조회하기
# sales 데이터프레임에서 v_name 값만 뽑아서 보기
sales$v_name

sales[3,2]
sales$v_name[4]
sales[3, ]
sales[ ,2]

# 데이터프레임에서 컬럼의 개수를 알 수 있는 방법
ncol(sales)
sales[1,3:ncol(sales)]

# 데이터프레임에서 행의 개수를 알 수 있는 방법
nrow(sales)
sales[2:nrow(sales), ]

# 데이터프레임에서 컬럼의 이름들만 추출하는 방법
names(sales)

# 다양한 함수를 데이터프레임에 적용하기
sum(sales$v_price)
mean(sales$v_price)
round(mean(sales$v_price), digits = 2) # 소숫점 자르기
min(sales$v_price)
max(sales$v_price)
range(sales$v_price) # 범위

No <- seq(1,10)
Name <- c('이은비','김서아','장하윤','유이서','나서윤','이지안','박나은','황유나','김하율','윤시아')
Kor <- c(80,76,26,61,44,19,53,81,26,64)
Eng <- c(8,76,69,18,82,56,48,14,73,83)
Math <- c(65,27,100,76,37,77,73,19,74,60)

# 1 DataFrame 생성
Score <- data.frame(No,Name,Kor,Eng,Math)
View(Score)
# 2 Kor 데이터 출력
Score['Kor']
# 3 Eng 데이터 출력
Score$Eng
# 4 컬럼 개수
ncol(Score)
# 5 행 개수
nrow(Score)
# 6 컬럼 명
names(Score)
# 7 Kor의 평균점수를 소수 첫째자리까지
round(mean(Score$Kor),digits = 1)
# 8 Eng의 가장 큰 점수
max(Score$Eng)
# 9 Math의 가장 작은 점수
min(Score$Math)

# 내가 작업하는 공간의 파일 목록보기
list.files()

# 엑셀 데이터파일을 읽을 수 있는 함수들이 모여있는 패키지 다운로드
install.packages("readxl")

# 패키지를 로딩하여 사용하기
library(readxl)

# 함수를 사용하여 파일 불러오기
read_excel("score.xlsx")

# csv파일을 읽어와서 데이터프레임 형태로 저장
titanic <- read.csv("titanic.csv")
titanic

list.files()
# 문자열 데이터를 범주형으로 읽어들이는 옵션
titanic_2 <- read.csv("titanic_2.csv", stringsAsFactors = TRUE)

heart <-read.csv("heart_failure_clinical_records_dataset.csv", stringsAsFactors = TRUE)

# obs = observation   :   299obs = 행이 299개
