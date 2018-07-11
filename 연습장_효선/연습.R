#횡단보도  위치 찍고
#차대사람만 찍기- 

#패키지 로드 
library(dplyr)
library(ggmap)

accident <- read.csv("./1. 교통사고 데이터/교통사고 데이터.csv", header=TRUE)
accident$위도 <- as.numeric(as.character(accident$위도))




#지도에 그리기
g_m0<-get_map('Seoul', zoom = 13, maptype = 'roadmap')
g_m1<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')  #영등포구
g_m2<-get_map('Gangnam-gu',zoom=14,maptype='roadmap')       #강남구
g_m3<-get_map('Jung-gu',zoom=14,maptype='roadmap')         #중구



##

crosswalk <- crosswalk %>% filter(GU_CDE==680)     #GU_CDE 680:강남구 560:영등포 140:중구
g_m<-get_map('Gangnam-gu',zoom=13,maptype='roadmap')
crosswalk.map<-ggmap(g_m,extent='device')+geom_point(data=crosswalk,aes(x=lon,y=lat),size=0.7,alpha=0.7,color='#980000')
crosswalk.map

##




