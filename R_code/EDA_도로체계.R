#도로별로 구분하기

#데이터 로드 
accident <- read.csv("./1. 교통사고 데이터/교통사고 데이터.csv", header=TRUE)
intersection <- read.csv("./3. 교통 시설물 데이터/1_도로 교차점 위치정보.csv", header=TRUE)
roadSpeed <- read.csv("./4. 기타 데이터/1_도로 별 통행속도/도로별 통행속도와 위치.csv", header =TRUE)
roadTraffic <- read.csv("./4. 기타 데이터/2_도로 별 교통량/도로별 교통량 위치.csv", header = TRUE)


#교차점 데이터
#ROA_CLS_SE,ROA_CLS_SE_2   1: 고속도로, 2: 대로, 3:로, 4: 길
#도로별 구분

names(roadSpeed)
table(roadSpeed$차선수)
names(roadTraffic)
table(roadTraffic$지점명칭)


