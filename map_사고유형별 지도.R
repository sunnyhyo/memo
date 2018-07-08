#사고유형별 지도 그리기

#패키지 로드 
library(dplyr)
library(ggmap)


#교통사고 데이터 로드
accident <- read.csv("./1. 교통사고 데이터/교통사고 데이터.csv", header=TRUE)
accident$위도 <- as.numeric(as.character(accident$위도))
names(accident)
table(accident$사고유형)
str(accident$사고유형)

#사고유형별 행 추출하고 데이터 프레임 만들기
acc.onlycar <- accident %>% filter(사고유형 == "차량단독 - 공작물충돌"|
                                         사고유형 == "차량단독 - 기타"|
                                         사고유형 == "차량단독 - 도로외이탈 - 기타"|
                                         사고유형 == "차량단독 - 도로외이탈 - 추락"|
                                         사고유형 == "차량단독 - 전도전복"|
                                         사고유형 == "차량단독 - 전도전복 - 전도"|
                                         사고유형 == "차량단독 - 전도전복 - 전복"|
                                         사고유형 == "차량단독 - 주/정차차량 충돌"|
                                         사고유형 == "차량단독 - 주차차량충돌")    
acc.carperson <- accident %>% filter(사고유형 =="차대사람 - 기타" |
                                           사고유형 =="차대사람 - 길가장자리구역통행중"|
                                           사고유형 =="차대사람 - 보도통행중"|
                                           사고유형 =="차대사람 - 차도통행중"|
                                           사고유형 =="차대사람 - 횡단중")
acc.carcar <- accident %>% filter(사고유형 =="차대차 - 기타"|
                                        사고유형 =="차대차 - 정면충돌"|
                                        사고유형 =="차대차 - 추돌"|
                                        사고유형 =="차대차 - 추돌 - 진행중"|
                                        사고유형 =="차대차 - 측면직각충돌"|
                                        사고유형 =="차대차 - 측면충돌"|
                                        사고유형 =="차대차 - 후진중충돌")   

nrow(acc.onlycar)   #차량단독 2603건
nrow(acc.carperson) #차대사람 20932건
nrow(acc.carcar)    #차대차 55128ㄱ

#지도에 그리기
g_m0<-get_map('Seoul', zoom = 13, maptype = 'roadmap')
g_m1<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')  #영등포구
g_m2<-get_map('Gangnam-gu',zoom=14,maptype='roadmap')       #강남구
g_m3<-get_map('Jung-gu',zoom=14,maptype='roadmap')         #중구



#사고 내용별로 지도에 점찍기
#지역구별로 g_m 숫자 바꾸면서 보면 됨
map.acc0   <- ggmap(g_m0, extent = 'device') +
  geom_point(data=acc.onlycar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='yellow')+  #차대차(노랑)
  geom_point(data=acc.carperson, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='red')+  #차대사람(빨강)
  geom_point(data=acc.carcar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='blue')     #차대차(파랑)
map.acc1   <- ggmap(g_m1, extent = 'device') +
  geom_point(data=acc.onlycar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='yellow')+  #차대차(노랑)
  geom_point(data=acc.carperson, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='red')+  #차대사람(빨강)
  geom_point(data=acc.carcar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='blue')     #차대차(파랑)
map.acc2   <- ggmap(g_m2, extent = 'device') +
  geom_point(data=acc.onlycar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='yellow')+  #차대차(노랑)
  geom_point(data=acc.carperson, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='red')+  #차대사람(빨강)
  geom_point(data=acc.carcar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='blue')     #차대차(파랑)
map.acc3   <- ggmap(g_m3, extent = 'device') +
  geom_point(data=acc.onlycar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='yellow')+  #차대차(노랑)
  geom_point(data=acc.carperson, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='red')+  #차대사람(빨강)
  geom_point(data=acc.carcar, aes(x=경도,y=위도),size=0.3,alpha=0.7,color='blue')     #차대차(파랑)

map.acc0 #서울전체
map.acc1 #영등포구
map.acc2 #강남구
map.acc3 #중구


