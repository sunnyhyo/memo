#######################
###패키지 다운로드
#출처 http://3months.tistory.com/291
install.packages("dplyr")
install.packages("gridExtra")
install.packages("ggplot2")
install.packages("xlsx")   #java 별도 설치 필요 링크: https://www.java.com/ko/download/windows-64bit.jsp
install.packages("openxlsx")

#데이터 로드
library(xlsx)     #엑셀 read, write  
library(foregin)  #SAS, SPSS 데이터셋 읽어올 때 사용
library(openxlsx)
#데이터 핸들링
library(dplyr)  
library(tidyr)      #데이터셋 레이아웃을 바꿀 때 유용한 툴
library(stringr)    #문자열 다루는 것과 정규 표현식 관련 패키지
library(lubridate)  #date, time 더욱 쉽게 다루는 툴

#데이터 시각화
library(ggplot2)
library(gridExtra)

#데이터 모델링
library(car)
library(randomForest)
library(multcomp)
library(glmnet)
library(fpc)
library(cluster)
library(nnet)       #신경ㅁ

#시계열 데이터
library(zoo)

#######################
###경로 설정
getwd()
setwd("C:/Users/HS/Documents/GitHub/제16회SAS분석챔피언십_샘플 데이터")  
#본인 저장위치로 변경


#######################
###데이터 읽어들이기
#드라이브에 샘플데이터 폴더에 csv 파일로 변환해서 만들어 놨어요. 그대로 다운받아서 코드실행하면 됩니당
#거의 다 csv 파일로 바꾸긴 했지만, 4.기타데이터>1. 도로별 통행속도, 2. 도로별 교통량 데이터셋은 엑셀입니다.


#1. 교통사고 데이터
accident <- read.csv("./1. 교통사고 데이터/교통사고 데이터.csv", header=TRUE)
#2. 디지털 시설물 데이터
DGT <- read.csv("./2. 디지털 운행 기록(DTG) 샘플/디지털 운행기록(DTG) 샘플.csv", header=TRUE)
#3. 교통 시설물 데이터
intersection <- read.csv("./3. 교통 시설물 데이터/1_도로 교차점 위치정보.csv", header=TRUE)
brige <- read.csv("./3. 교통 시설물 데이터/2_교량 위치정보.csv", header=TRUE)
busStop <- read.csv("./3. 교통 시설물 데이터/3_버스 정류장 위치정보.csv", header=TRUE)
safety <- read.csv("./3. 교통 시설물 데이터/4_안전센터관할 위치정보.csv", header=TRUE)
schoolZone <- read.csv("./3. 교통 시설물 데이터/5_어린이 보호 구역 위치정보.csv", header=TRUE)
drivingRestriction <- read.csv("./3. 교통 시설물 데이터/6_운행제한 시설물 위치정보.csv", header=TRUE)
drivingWay <- read.csv("./3. 교통 시설물 데이터/7_자동차 전용도로 위치정보.csv", header=TRUE)
residentialZone <- read.csv("./3. 교통 시설물 데이터/8_주거지역 위치정보.csv", header=TRUE)
CCTV <- read.csv("./3. 교통 시설물 데이터/9_CCTV 위치정보.csv", header=TRUE)
crosswalk <- read.csv("./3. 교통 시설물 데이터/10_횡단보도 위치정보.csv", header=TRUE)
hump <- read.csv("./3. 교통 시설물 데이터/11_험프 위치정보.csv", header=TRUE)
#4. 기타 데이터
spot_roadSpeed <-read.csv("./4. 기타 데이터/1_도로 별 통행속도/(별첨) 링크 위치 정보.csv", header= TRUE)
raw_roadSpeed <- read.xlsx("./4. 기타 데이터/1_도로 별 통행속도/2016년 도로 별 통행 속도.xlsx",sheet= 1, colNames=TRUE)
roadSpeed <- merge(x= spot_roadSpeed, y=raw_roadSpeed, by="링크아이디")

spot_roadTraffic <- read.csv("./4. 기타 데이터/2_도로 별 교통량/(별첨) 교통량 지점정보.csv", header=TRUE)
raw_roadTraffic <-  read.xlsx("./4. 기타 데이터/2_도로 별 교통량/2016년 도로 별 교통량.xlsx", sheet=1, colNames =TRUE)
roadTraffic <- merge(x=spot_roadTraffic, y=raw_roadTraffic, by="지점번호")

#csv로 작성
write.csv(roadSpeed, "./4. 기타 데이터/1_도로 별 통행속도/도로별 통행속도와 위치.csv")
write.csv(roadTraffic, "./4. 기타 데이터/2_도로 별 교통량/도로별 교통량 위치.csv")
