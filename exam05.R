id <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
grade <- c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5)
mid <- c(20,23,26,11,22,29,34,37,15,14,26,15,24,24,33,19,11,27,34,21)
fin <- c(33,39,21,11,16,12,30,29,26,25,27,25,11,10,33,25,18,33,21,34)

install.packages("dplyr")
library(dplyr)

score <- data.frame(id, grade, mid, fin)
score

# 데이터를 그룹별로 묶어주기
# 각 반별로 묶어주는 방법 filter와 다름
# 콘솔에 tibble 과 group이 정리되어 출력됨
# group_by() 단독으로 사용하지 않는다
# 주로 summarise()와 같이 사용된다
# summarise() 함수는 요약 통계량을 볼 수 있는 함수

# 출력 불가
score %>% group_by(grade) %>% mean(mid)
# summarise로 출력 가능

# 출력할때 컬럼명을 써주지않으면 함수 그대로 컬럼명에 들어감
score %>% group_by(grade) %>% summarise(mean(mid))
# 컬럼명 변경방법
score %>% group_by(grade) %>% summarise(m_mid = mean(mid))

score %>% group_by(grade) %>% summarise(m_mid = max(mid))

# summarise 에 쓸수 있는 함수 -> ppt 확인



# dataframe 열기준 합치기 - 조인
mid <- data.frame(id=c(101,102,103,104,105),mid=c(60,80,70,90,85))
fin <- data.frame(id=c(103,104,105,106,107),mid=c(70,83,65,50,75))

# innerJoin : 내부 공통으로 가지고 있는 행만 결합
inner_join(mid, fin, by="id")

# full_join : 두개의 데이터프레임을 합함
full_join(mid, fin, by="id")

# left_join : 왼쪽을 기준으로 병합
left_join(mid, fin, by="id")

# right_join : 오른쪽을 기준으로 병합
right_join(mid, fin, by="id")


# 행기준 합치기 bind_rows()
# 컬럼명과 개수가 같아야한다.
mid2 <- data.frame(id=c(106,107), mid=c(85,77))
mid2

bind_rows(mid, mid2)


# 항공데이터 분석하기
install.packages("hflights")
library(hflights)
dim(hflights)
View(hflights)

# 비행기 번호판별 가장 오래걸린 출발시간
# na.rm : 널값 삭제
hflights %>% group_by(TailNum) %>% summarise((max(DepTime, na.rm = T)))

# 결항건수가 가장 많았던 날
# 결항 사유별 건수를 출력
hflights %>% filter(Cancelled == 1) %>% group_by(CancellationCode) %>% summarise(n())
# 선생님 풀이
hflights %>% group_by(CancellationCode) %>% summarise(n = n())

# 결항 사유가 날씨 이거나 기류상황인 데이터만 출력
hflights %>% filter(CancellationCode == "B"| CancellationCode == "C")
#이어서 월별 건수 출력 ( 내림차순 )
hflights %>% filter(CancellationCode == "B"| CancellationCode == "C") %>% group_by(Month) %>% summarise(n = n()) %>% arrange(desc(n))
# -> 2월이 압도적으로 많다

# 그럼 2월 언제 많았나?
hflights %>% filter(CancellationCode == "B"| CancellationCode == "C") %>% group_by(Month, DayofMonth) %>% summarise(n = n()) %>% arrange(desc(n))
# -> 2월 1,3,4일이 압도적

# 이상치, 결측치 제거
list.files()
library(readxl)

score <- read_excel("score.xlsx")
score

# NA( 결측치 )를 파악하는 함수
# NA가 있으면 True 반환
is.na(score)

# True와 False 개수 출력
table(is.na(score))
# 속성(컬럼)별 na의 개수 출력
summary(score)

# filter를 활용하여 mid안에 결측치가 없는행만 출력
score %>% filter(!is.na(mid))

# filter를 활용하여 전체 결측치가 있는 행을 제거
score %>% filter(!is.na(mid)) %>% filter(!is.na(fin)) %>% filter(!is.na(assign)) %>% filter(!is.na(att))
# 한번에 하기
score %>% na.omit()

score

median(score$mid, na.rm = T)


# 문제 mid 안에 결측치가 있다면 중앙값으로 대체해주세요
score$mid <- ifelse(is.na(score$mid) , 25, score$mid)
score

# 문제 mid안에 값이 100점 초과라면 중앙값으로 대체해주세요
score$mid <- ifelse(score$mid > 100, 25, score$mid)
score
