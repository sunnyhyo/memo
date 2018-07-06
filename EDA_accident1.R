###########################
###교통사고정보 EDA
#참고 : http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization
#  https://rstudio-pubs-static.s3.amazonaws.com/318244_74f2bf9d22894cef909b29984230a311.html

class(accident$사고번호)
class(accident)
summary(accident)


(accident$발생요일)

table(accident$발생요일)
table(accident$발생시군구)
table(accident$사고내용)
#경상사고, 부상신고사고, 사망사고, 중상사고
table(accident$사고유형)
table(accident$법규위반)
table(accident$노면상태)
table(accident$기상상태)
table(accident$피해운전자연령)
class(accident$피해운전자연령)  #운전자 연령을 범주화 하는것이 좋을듯 10대, 20대, 30대



acc_p3<- ggplot(accident)+geom_bar(aes(발생요일), stat="count")+
  ggtitle("발생요일") +
  xlab("발생요일")
acc_p4<- ggplot(accident)+geom_bar(aes(발생시군구), stat="count")+   #흠.....
  ggtitle("발생시군구") +
  xlab("발생시군구") 
acc_p5<- ggplot(accident)+geom_bar(aes(사고내용), stat="count")+
  ggtitle("사고내용") +
  xlab("사고내용")

acc_p10<- ggplot(accident)+geom_bar(aes(사고유형), stat="count")+
  ggtitle("사고유형") +
  xlab("사고유형") + coord_flip()
acc_p11<- ggplot(accident)+geom_bar(aes(법규위반), stat="count")+
  ggtitle("법규위반") +
  xlab("법규위반") + coord_flip()
acc_p12<- ggplot(accident)+geom_bar(aes(노면상태), stat="count")+
  ggtitle("노면상태") +
  xlab("노면상태") + coord_flip()
acc_p13<- ggplot(accident)+geom_bar(aes(기상상태), stat="count")+
  ggtitle("기상상태") +
  xlab("기상상태") + coord_flip()
acc_p14<- ggplot(accident)+geom_bar(aes(도로형태), stat="count")+
  ggtitle("도로형태") +
  xlab("도로형태") + coord_flip()

#가해운전자 정보
acc_p15<- ggplot(accident)+geom_bar(aes(가해운전자차종), stat="count")+
  ggtitle("가해운전자 차종") +
  xlab("가해운전자 차종") + coord_flip()
acc_p16<- ggplot(accident)+geom_bar(aes(가해운전자성별), stat="count")+
  ggtitle("가해운전자 성별") +
  xlab("가해운전자 성별")
acc_p17<- ggplot(accident)+geom_bar(aes(가해운전자연령), stat="count")+
  ggtitle("가해운전자 연령") +
  xlab("가해운전자 연령")
acc_p18<- ggplot(accident)+geom_bar(aes(가해운전자상해정도), stat="count")+
  ggtitle("가해운전자 상해정도") +
  xlab("가해운전자 상해정도") + coord_flip()

#피해운전자 정보
acc_p19<- ggplot(accident)+geom_bar(aes(피해운전자차종), stat="count")+
  ggtitle("피해운전자 차종") +
  xlab("피해운전자 차종") + coord_flip()
acc_p20<- ggplot(accident)+geom_bar(aes(피해운전자성별), stat="count")+   #결측치 존재함
  ggtitle("피해운전자 성별") +
  xlab("피해운전자 성별")
acc_p21<- ggplot(accident)+geom_bar(aes(피해운전자연령), stat="count")+
  ggtitle("피해운전자 연령") +
  xlab("피해운전자 연령")
acc_p22<- ggplot(accident)+geom_bar(aes(피해운전자상해정도), stat="count")+
  ggtitle("피해운전자 상해정도") +
  xlab("피해운전자 상해정도") + coord_flip()


#geom_text(aes(label = Weight), vjust = -0.2)

grid.arrange(acc_p3,acc_p4,acc_p5,acc_p10, ncol=2)
grid.arrange(acc_p11,acc_p12,acc_p13,acc_p14, ncol=2)

acc_p10
acc_p11
acc_p12
acc_p13
acc_p14

grid.arrange(acc_p15,acc_p16,acc_p17,acc_p18, ncol=2)
grid.arrange(acc_p15,acc_p16,acc_p17,acc_p18, ncol=2) #가해운전자 정보
grid.arrange(acc_p19,acc_p20,acc_p21,acc_p22, ncol=2) #피해운전자 정보

