#사고내용별 지도그리기

#패키지 로드
install.packages('ggmap')
library(ggmap)
library(dplyr)


#교통사고 데이터 로드
accident <- read.csv("./1. 교통사고 데이터/교통사고 데이터.csv", header=TRUE)
head(accident)
accident$위도 <- as.numeric(as.character(accident$위도))
table(accident$사고내용)


#사고내용별 행 추출하고 데이터 프레임만들기
acc.light <- accident %>% filter(사고내용 =="경상사고")       #경상사고
acc.injury <- accident %>% filter(사고내용 =="부상신고사고")  #부상신고사고
acc.die <- accident %>% filter(사고내용 == "사망사고")        #사망사고
acc.heavy <- accident %>% filter(사고내용 =="중상사고")       #중상사고



#지도에 그리기
g_m0<-get_map('Seoul', zoom = 13, maptype = 'roadmap')
g_m1<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')  #영등포구
g_m2<-get_map('Gangnam-gu',zoom=14,maptype='roadmap')       #강남구
g_m3<-get_map('Jung-gu',zoom=14,maptype='roadmap')         #중구


#사고 내용별로 지도에 점찍기
#지역구별로 g_m 숫자 바꾸면서 보면 ㄷ
map.acc.accident <-ggmap(g_m0,extent='device')+
  geom_point(data=accident,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='#980000') #전체사고
map.acc.accident
map.acc.light<-ggmap(g_m,extent='device')+고
  geom_point(data=acc.light,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='#980000') #경상사고
map.acc.injury<-ggmap(g_m,extent='device')+
  geom_point(data=acc.injury,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='#980000') #부상신고사고
map.acc.heavy<-ggmap(g_m,extent='device')+
  geom_point(data=acc.heavy,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='#980000') #중상사고
map.acc.die<-ggmap(g_m,extent='device')+
  geom_point(data=acc.die,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='#980000')고 #사망사고
#+ stat_density_2d(data=acc.die, aes(x=경도, y=위도,fill=..level.., alpha=..level..),geom='polygon',size=0.5,bins=20)

map.accident
map.acc.light
map.acc.injury
map.acc.heavy
map.acc.die



#밀도지도
#지금은 ㅂ필욘ㄴㄴㄴ
map.acc.light<-acc.light+
  scale_fill_gradient(low='yellow',high='red',guide=F)+
  scale_alpha(range=c(0.01,1),guide=F)
map.acc.injury<-acc.injury+
  scale_fill_gradient(low='yellow',high='red',guide=F)+
  scale_alpha(range=c(0.01,1),guide=F)
map.acc.heavy<-acc.heavy+
  scale_fill_gradient(low='yellow',high='red',guide=F)+
  scale_alpha(range=c(0.01,1),guide=F)
map.acc.die<-acc.die+
  scale_fill_gradient(low='yellow',high='red',guide=F)+
  scale_alpha(range=c(0.01,1),guide=F)
map.acc.light
map.acc.injury
map.acc.heavy
map.acc.die



