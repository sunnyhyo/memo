########
#DGT
library(dplyr)

head(DGT)
names(DGT)


###################
#위험운전 행동분석 기준
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

names(DGT)
cor(DGT$Vx, DGT$Vy)



##########
#행추출


b_urgStart<- DGT %>% filter(speed <= 5 & Vx >10 | Vy >10 )  #급출발  (아마도...) 
#가속도 정의 잘모름...






