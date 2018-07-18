########
#DGT
library(dplyr)
library(ggplot2)
head(DTG)
names(DTG)


###################
#위험운전행동
#과속유형a speeding
a_speeding 
a_longSpeeding  
#급가속유형b  urgent accelerate
b_urgAccel 
b_urgStart  
#급감속유형c  urgent decelerate
c_urgDecel 
c_urgStop
#급회전유형d  rotation
d_urgRotat
d_urgUturn
#급진로변경유형e change Course
e_urgPassing
e_chCourse
#연속운전f contiDriving
f_contiDriving

#########
#함수정의

date = function(x){
  DATE<-0
  time<-0
  for (i in len(x)){
    if(i<=6){
      DATE <- x[i]
    }
    if(7<=i && i <=12){
      time <- x[i]
    }
    
  }
}


##########
#파생변수
#위경도
DTG$lon <- DTG$lon/1000000
DTG$lat <- DTG$lat/1000000
#가속도
DTG$accelerarion <- (Vx**2 + Vy**2)**(1/2)
#시간
DTG$DATE 
DTG$time


