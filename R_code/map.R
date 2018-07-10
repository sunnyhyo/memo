setwd('c:\\rfolder')
install.packages('ggmap')
library(ggmap)
library(dplyr)
library(scales)

##교통사고 데이터
accident$위도 <- as.numeric(as.character(accident$위도))
g_m<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')
acc<-ggmap(g_m,extent='device')+geom_point(data=accident,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='#980000')+stat_density_2d(data=accident, aes(x=경도, y=위도,fill=..level.., alpha=..level..),geom='polygon',size=0.5,bins=20)
accident.map<-acc+scale_fill_gradient(low='yellow',high='red',guide=F)+scale_alpha(range=c(0.01,1),guide=F)
accident.map

##디지털 운행기록(DTG) 샘플
DTG$lon <- (DTG$lon)/1000000
DTG$lat <- (DTG$lat)/1000000
#DTG_ <- DTG %>% filter() 
g_m<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')
DTG.map<-ggmap(g_m,extent='device')+geom_point(data=DTG,aes(x=lon,y=lat),size=0.3,alpha=0.7,color='#980000')
DTG.map


##교통 시설물 데이터
#1_도로 교차점 위치정보
g_m<-get_map('Jung-gu',zoom=13,maptype='roadmap')
intersection.map<-ggmap(g_m,extent='device')+geom_point(data=intersection,aes(x=lon,y=lat),size=0.3,alpha=0.7,color='#980000')
intersection.map
#2_교량 위치정보
bridge <- bridge %>% filter(시군구코드==11560)
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
bridge.map<-ggmap(g_m,extent='device')+geom_point(data=bridge,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
bridge.map
#3_버스 정류장 위치정보
busStop <- busStop %>% filter(시군구코드==11560)
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
busStop.map<-ggmap(g_m,extent='device')+geom_point(data=busStop,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
busStop.map
#4_안전센터관할 위치정보
g_m<-get_map('Seoul',zoom=11,maptype='roadmap')
safety.map<-ggmap(g_m,extent='device')+geom_point(data=safety,aes(x=경도,y=위도),size=1.5,alpha=0.7,color='#980000')
safety.map
#5_어린이 보호 구역 위치정보
g_m<-get_map('Seoul',zoom=11,maptype='roadmap')
schoolZone.map<-ggmap(g_m,extent='device')+geom_point(data=schoolZone,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
schoolZone.map
#6_운행제한 시설물 위치정보 (출발점)
drivingRestriction <- drivingRestriction %>% filter(위치=='영등포구')
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
drivingRestriction.map<-ggmap(g_m,extent='device')+geom_point(data=drivingRestriction,aes(x=출발경도,y=출발위도),size=0.7,alpha=0.7,color='#980000')
drivingRestriction.map
#7_자동차 전용도로 위치정보
#8_주거지역 위치정보
residentialZone <- residentialZone %>% filter(시군구_한글명=='영등포구')
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
residentialZone.map<-ggmap(g_m,extent='device')+geom_point(data=residentialZone,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
residentialZone.map
#9_CCTV 위치정보
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
CCTV.map<-ggmap(g_m,extent='device')+geom_point(data=CCTV,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
CCTV.map
#10_횡단보도 위치정보
crosswalk <- crosswalk %>% filter(GU_CDE==680)     #GU_CDE 680:강남구 560:영등포 140:중구
g_m<-get_map('Gangnam-gu',zoom=13,maptype='roadmap')
crosswalk.map<-ggmap(g_m,extent='device')+geom_point(data=crosswalk,aes(x=lon,y=lat),size=0.7,alpha=0.7,color='#980000')
crosswalk.map
#11_험프 위치정보
hump <- hump %>% filter(GU_CDE==140)   #GU_CDE 680:강남구 560:영등포 140:중구
g_m<-get_map('Jung-gu',zoom=13,maptype='roadmap')
hump.map<-ggmap(g_m,extent='device')+geom_point(data=hump,aes(x=lon,y=lat),size=0.7,alpha=0.7,color='#980000')
hump.map

##기타 데이터
#1_

##교통 시설물 데이터 종합 지도
g_m<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')
total <-ggmap(g_m,extent='device')+
 stat_density_2d(data=accident, aes(x=경도, y=위도,fill=..level.., alpha=..level..),geom='polygon',size=0.5,bins=20)+ #교통사고점 밀도
  geom_point(data=intersection,aes(x=lon,y=lat),size=0.3,alpha=0.7,color='gray')+  #교차점 회색
  geom_point(data=bridge,aes(x=경도,y=위도),size=0.8,alpha=0.7,color='red')+      #교량 빨강
  geom_point(data=busStop,aes(x=경도,y=위도),size=0.8,alpha=0.7,color='#9494b8')+     #버스정류장 보라
  geom_point(data=safety,aes(x=경도,y=위도),size=1.5,alpha=0.7,color='#00664d')+       #안전센터 초록점
  geom_point(data=schoolZone,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#ffd11a')+ #어린이 보호구역 노랑
  #geom_point(data=drivingRestriction,aes(x=출발경도,y=출발위도),size=0.7,alpha=0.7,color='')+ #운전제한 시설물 시작점
  geom_point(data=crosswalk,aes(x=lon,y=lat),size=0.3,alpha=0.7,color='#ff6699')+  #횡단보도 핑크
  geom_point(data=hump,aes(x=lon,y=lat),size=0.8,alpha=0.7,color='#bbff33')  #험프 연두
total.map <-total+scale_fill_gradient2(low=muted('white'),high=muted('red'), guide="colorbar")+scale_alpha(range=c(0.01,1),guide=F)
total.map
