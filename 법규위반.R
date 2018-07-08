accident$위도 <- as.numeric(as.character(accident$위도))

#과속
accident1 <- accident %>% filter(법규위반=='과속')
#교차로운행방법위반
accident2 <- accident %>% filter(법규위반=='교차로운행방법위반')
#보행자보호의무위반
accident3 <- accident %>% filter(법규위반=='보행자보호의무위반')
#불법유턴
accident4 <- accident %>% filter(법규위반=='불법유턴')
#신호위반
accident5 <- accident %>% filter(법규위반=='신호위반')
#안전거리미확보
accident6 <- accident %>% filter(법규위반=='안전거리미확보')
#안전운전불이행
accident7 <- accident %>% filter(법규위반=='안전운전불이행')
#중앙선침범
accident8 <- accident %>% filter(법규위반=='중앙선침범')
#직진우회전진행방해
accident9 <- accident %>% filter(법규위반=='직진우회전진행방해')
#차로위반
accident10 <- accident %>% filter(법규위반=='차로위반')

accident.map <-ggmap(g_m,extent='device')+geom_point(data=accident1,aes(x=경도,y=위도),size=1,alpha=0.7,color='red')+
geom_point(data=accident2,aes(x=경도,y=위도),size=1,alpha=0.7,color='blue')+
geom_point(data=accident3,aes(x=경도,y=위도),size=1,alpha=0.7,color='yellow')

accident.map

#따로 나타내려
g_m<-get_map('Yeongdeungpo-gu',zoom=14,maptype='roadmap')
acc1<-ggmap(g_m,extent='device')+geom_point(data=accident1,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='red')
acc2<-ggmap(g_m,extent='device')+geom_point(data=accident2,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='orange')
acc3<-ggmap(g_m,extent='device')+geom_point(data=accident3,aes(x=경도,y=위도),size=0.3,alpha=0.7,color='yellow')
