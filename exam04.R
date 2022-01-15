# dplyr : dataFrame + plyr = 데이터프레임을 가공하는 도구
# 데이터 전처리 할때 주로 사용하는 패키지 dplyr
install.packages("dplyr")
library(dplyr)
library(readxl)

list.files()
score <- read_excel("score_10차시.xlsx")
score
# DataFrame의 컬럼명을 바꾸는 함수 rename()
# 파이프 연산자 %>% - 단축키 : ctrl shift m
# ( 바꿀이름 = 전 이름 ) 으로 사용하고 출력만하고 저장 안됨
score <- score %>% rename(id = 학번, grade = 학년, mid = 중간고사, fin = 기말고사, assign = 과제제출, att = 출석점수)
 
# 조건에 맞는 행만 추출하기 filter()
# 조건의 결과가 TRUE인 행만 추출
# grade가 1인 행만 출력하기
score %>% filter(grade == 1)
# grade가 1이고 mid점수가 25점 이상인 학생의 행만 출력
score %>% filter(grade == 1) %>% filter(mid >= 25)
score %>% filter(grade == 1 & mid >= 25)

# 원하는 컬럼만 추출하는 함수 select()
names(score)
score %>% select(grade)
score %>% select(grade, mid)

# 문제. 1학년 학생들의 중간점수와 기말점수만 출력하시오
score %>% filter(grade == 1) %>% select(mid, fin)

# 컬럼명을 기준으로 정렬할때 사용하는 함수 arrange()
# 정렬함수는 기본값이 오름차순
score %>% arrange(mid)
# 내림차순 : score %>% arrange(desc(mid))       <<<<<
# 두개 이상도 가능하고 앞에서부터 정렬 시작
score %>% arrange(mid, fin)

# 문제. 4학년 학생들의 기말고사 점수만 내림차순으로 출력
score %>% filter(grade == 4) %>% arrange(desc(fin)) %>% select(fin)

# 파생변수 : 기존의 데이터로 새로 생성한 데이터
# 파생변수를 만드는 함수 mutate()
# 출력만 하고 저장은 안됨
score <- score %>% mutate(total = mid + fin + assign + att)
score
# 조건을 통해 파생변수 만들고 값 넣기
# 컬럼명은 이름만 내부 값은 "" 써서 구별
score <- score %>% mutate(fp = ifelse(total >= 60 , "pass" , "fail"))
score
