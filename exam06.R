# ggplot2 패키지 설치
install.packages("ggplot2")
# 패키지 로딩
library(ggplot2)
# ggplot2 패키지는 시각화를 손쉽게 해주는 전용 패키지
library(dplyr)

# 연습용 데이터
# mpg - 1999 ~ 2008년 사이 미국에서 출시된 자동차 234종의 연비관련 정보
View(mpg)
str(mpg) # 속성 정보
# ggplot을 쓰기위해
# tibble형태의 데이터를 dataframe 구조로 변경
mpg <- data.frame(mpg)

# ggplot 3단계 구조
# 1. x, y 축을 그린다 # 2. 그래프를 그린다 # 3. 옵션 추가
# x축은 배기량, y축은 고속도로 연비
# 각 위치에 데이터를 산점도로 표현
# 1. 축 설정
ggplot(mpg, aes(x = displ, y = hwy))
# 2. 그래프 설정 ( 다른 종류들은 PPT )
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
# 3. 옵션 추가
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(size=3 , color = "#191970") + xlim(3,6) + ylim(10,30) + labs(x = "배기량" , y = "연비비") + theme(axis.title.x = element_text(size = 30), axis.title.y = element_text(size = 30))

# 구동방식(drv) 배기량에 따른 고속도로 연비를 시각화
# color 안의 기준점이 범주형인 경우
# 각각 다른 색상으로 표현된다.
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) + geom_point(size = 4)

# color안의 기준점이 수치형인 경우
# 같은 색상이지만 진한 정도가 다름
ggplot(mpg, aes(x = displ, y = hwy, color = cyl)) + geom_point(size = 4)

# 추세선 그리기 geom_smooth()
ggplot(mpg, aes(x = displ, y = hwy, color = cyl)) + geom_point(size = 4) + geom_smooth()

# 막대그래프 geom_col()
# 문제) 제조사별 고속도로 평균 연비 출력
manu_hwy <- mpg %>% group_by(manufacturer) %>% summarise(mean_hwy = mean(hwy))

manu_hwy
# X 축의 이름 순으로 오름차순 정렬
# reorder(정렬할 컬럼, 기준) : 재명령
# 기준컬럼에 - 붙이면 내림차순
ggplot(manu_hwy, aes(x = reorder(manufacturer, mean_hwy), y = mean_hwy)) + geom_col()

# 제조 회사별 구동방식별 평균 고속도로 연비 평균 출력
mdh <- mpg %>% group_by(manufacturer , drv) %>% summarise(mean_hwy = mean(hwy))

mdh

ggplot(mdh, aes(x = manufacturer , y = mean_hwy)) + geom_col(aes(fill = drv) , position = "dodge")

# 구동방식(drv)별 빈도수 그래프 geom_bar
ggplot(mpg, aes(x = drv)) + geom_bar()

# 제조회사별 차종별 빈도 그래프
ggplot(mpg, aes(x = manufacturer)) + geom_bar(aes(fill=class))

list.files()

titanic <- read.csv("titanic_2.csv" , stringsAsFactors = T)

dim(titanic)
str(titanic)
summary(titanic)
names(titanic)
# 특정 컬럼을 범주형 데이터로 변환
titanic$Survived <- factor(titanic$Survived)
summary(titanic)

# 나머지 범주형 데이터 변환하기 ( 3개 추가 )
titanic$Pclass <- factor(titanic$Pclass)
titanic$Sex <- factor(titanic$Sex)
titanic$Embarked <- factor(titanic$Embarked)

titanic$SibSp <- factor(titanic$SibSp)
titanic$Parch <- factor(titanic$Parch)
titanic$Ticket <- factor(titanic$Ticket)
titanic$Cabin <- factor(titanic$Cabin)

table(is.na(titanic$Name))
table(is.na(titanic$Cabin))

# 빈칸으로 들어간 결측치 제거
titanic$Name <- ifelse(titanic$Name == "",NA,titanic$Name)
titanic$Cabin <- ifelse(titanic$Cabin == "",NA,titanic$Cabin)

table(is.na(titanic$Name))
table(is.na(titanic$Cabin))

# 나이 결측치 평균값으로 
table(is.na(titanic$Age))
titanic$Age <- ifelse(is.na(titanic$Age), mean(titanic$Age, na.rm = T), titanic$Age)

titanic$Fare <- ifelse(titanic$Fare == 0 , mean(titanic$Fare, na.rm = T) , titanic$Fare)

# Embarked가 없는 행 걸러주기
titanic <- titanic %>% filter(Embarked != "")

table(titanic$Cabin)

titanic$Cabin <- ifelse(titanic$Cabin =="","Z",titanic$Cabin)
titanic$Cabin <- substr(titanic$Cabin,1,1)

table(titanic$Cabin)

titanic$Cabin

titanic <- titanic %>% mutate(FamilySize = SibSp + Parch + 1)

titanic <- titanic %>% mutate(FamilyLevel = ifelse(FamilySize == 1, "Single", ifelse(FamilySize <= 4, "Small", "Large")))


titanic <- titanic %>% filter(Cabin != "Z")

ggplot(data = titanic, aes(x = Cabin)) + geom_bar(aes(fill=Survived), position = "dodge")



# 하던거
titanic<-read.csv("titanic_2.csv",stringsAsFactors = T)
titanic$Survived <- factor(titanic$Survived)
summary(titanic)
titanic$Pclass <- factor(titanic$Pclass)
summary(titanic)
titanic$Embarked <-factor(titanic$Embarked)
titanic$Sex <- factor(titanic$Sex)
titanic$Cabin <- as.character(titanic$Cabin)
titanic$Cabin <- substr(titanic$Cabin,1,1) 
titanic$Cabin <- ifelse(titanic$Cabin=="","Z",titanic$Cabin)
titanic <- titanic %>% mutate(FamilySize=SibSp+Parch+1)

titanic <- titanic %>% mutate(FamilyLevel = ifelse(FamilySize == 1, "Single", ifelse(FamilySize <= 4, "Small", "Large")))

titanic <- titanic %>%  filter(Cabin !="Z")
ggplot(data=titanic, aes(x=Cabin))+geom_bar(aes(fill=Survived), position = "dodge")





