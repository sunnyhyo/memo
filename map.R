setwd("C:/Users/User/Documents/제16회SAS분석챔피언십_샘플 데이터")
install.packages('ggmap')
library(ggmap)
library(dplyr)

##accident
accident<-read.csv('accident.csv',header=T)
accident$위도 <- as.numeric(as.character(accident$위도))
g_m<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')
acc<-ggmap(g_m,extent='device')+geom_point(data=accident,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='#980000')+stat_density_2d(data=accident, aes(x=경도, y=위도,fill=..level.., alpha=..level..),geom='polygon',size=0.5,bins=20)
accident.map<-acc+scale_fill_gradient(low='yellow',high='red',guide=F)+scale_alpha(range=c(0.01,1),guide=F)
accident.map


#1_intersection
int<-read.csv('1_intersection.csv',header=T)
g_m<-get_map('Jung-gu',zoom=13,maptype='roadmap')
intersection.map<-ggmap(g_m,extent='device')+geom_point(data=int,aes(x=lon,y=lat),size=0.3,alpha=0.7,color='#980000')
intersection.map


#2_bridge
bdg<-read.csv('2_bridge.csv',header=T)
bdg <- bdg %>% filter(시군구코드==11560)
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
bridge.map<-ggmap(g_m,extent='device')+geom_point(data=bdg,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
bridge.map


#3_busStop
bus<-read.csv('3_busStop.csv',header=T)
bus <- bus %>% filter(시군구코드==11560)
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
busstop.map<-ggmap(g_m,extent='device')+geom_point(data=bus,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
busstop.map


#4_safety
safety<-read.csv('4_safety.csv',header=T)
g_m<-get_map('Seoul',zoom=11,maptype='roadmap')
safety.map<-ggmap(g_m,extent='device')+geom_point(data=safety,aes(x=경도,y=위도),size=1.5,alpha=0.7,color='#980000')
safety.map


#5_schoolZone
schzone<-read.csv('./3. 교통 시설물 데이터/5_어린이 보호 구역 위치정보.csv',header=T)

g_m<-get_map('Seoul',zoom=11,maptype='roadmap')
schoolzone.map<-ggmap(g_m,extent='device')+geom_point(data=schzone,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
schoolzone.map


#6_drivingRestriction
drvres<-read.csv('6_drivingRestriction.csv',header=T)
drvres <- drvres %>% filter(위치=='영등포구'
                              )
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
drvres.map<-ggmap(g_m,extent='device')+geom_point(data=drvres,aes(x=출발경도,y=출발위도),size=0.7,alpha=0.7,color='#980000')
drvres.map


#7_driveWay


#8_residentialZone
reszone<-read.csv('8_residentialZone.csv',header=T)
reszone <- reszone %>% filter(시군구_한글명=='영등포구')
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
reszone.map<-ggmap(g_m,extent='device')+geom_point(data=reszone,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
reszone.map


#9_CCTV
cctv<-read.csv('9_CCTV.csv',header=T)
g_m<-get_map('Yeongdeungpo-gu',zoom=13,maptype='roadmap')
cctv.map<-ggmap(g_m,extent='device')+geom_point(data=cctv,aes(x=경도,y=위도),size=0.7,alpha=0.7,color='#980000')
cctv.map


#10_crosswalk
cw<-read.csv('10_crosswalk.csv',header=T)
cw <- cw %>% filter(GU_CDE==680)     #GU_CDE 680:강남구 560:영등포 140:중구
g_m<-get_map('Gangnam-gu',zoom=13,maptype='roadmap')
crosswalk.map<-ggmap(g_m,extent='device')+geom_point(data=cw,aes(x=lon,y=lat),size=0.7,alpha=0.7,color='#980000')
crosswalk.map


#11_hump
hump<-read.csv('11_hump.csv',header=T)  
hump <- hump %>% filter(GU_CDE==140)   #GU_CDE 680:강남구 560:영등포 140:중구
g_m<-get_map('Jung-gu',zoom=13,maptype='roadmap')
hump.map<-ggmap(g_m,extent='device')+geom_point(data=hump,aes(x=lon,y=lat),size=0.7,alpha=0.7,color='#980000')
hump.map


