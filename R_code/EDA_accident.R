###########################
###교통사고정보 EDA


class(accident$사고번호)
class(accident)
summary(accident)

#경찰청 데이터?
#변수정의 찾아놓기?
accident$발생요일
table(accident$발생요일)
table(accident$발생시군구)
table(accident$사고내용)
#경상사고, 부상신고사고, 사망사고, 중상사고
table(accident$사고유형)
table(accident$법규위반)
#미분류, 기타 결측치 처리 어떻게 할 지 ?!
#법규위반 어느 지점에서 발생했는지 확인
table(accident$노면상태)
#포장상태 분류기준 알기 ex 습기, 젖음/습기
table(accident$기상상태)
#기상상태랑 노면상태 ....관계?
table(accident$도로형태)
#단일로-기타 (일반도로) , 기타- 기타 , 미분류 - 미분류
#교차로 안/부근???  ->지도그려놓기(위치)
#위치별로 사고 유형 파악
table(accident$가해운전자차종)
table(accident$가해운전자성별)
table(accident$가해운전자연령)
table(accident$가해운전자상해정도)

table(accident$피해운전자차종)
table(accident$피해운전자성별)
table(accident$피해운전자연령)
table(accident$피해운전자상해정도)

#상해 없을 때 ?!연결해서도 분석하기..
#사고유형 - 상해정도 (가해운전자, 피해운전자 종합해서) 
#운전자 연령을 범주화 하는것이 좋을듯 10대, 20대, 30대


#제안서에 결측치 처리 어떤식으로 할지 정ㄹ리


p3<- ggplot(accident)+geom_bar(aes(발생요일), stat="count")+
  ggtitle("발생요일") +
  xlab("발생요일")
p4<- ggplot(accident)+geom_bar(aes(발생시군구), stat="count")+   #흠.....
  ggtitle("발생시군구") +
  xlab("발생시군구") 
p5<- ggplot(accident)+geom_bar(aes(사고내용), stat="count")+
  ggtitle("사고내용") +
  xlab("사고내용")

p10<- ggplot(accident)+geom_bar(aes(사고유형), stat="count")+
  ggtitle("사고유형") +
  xlab("사고유형") + coord_flip()
p11<- ggplot(accident)+geom_bar(aes(법규위반), stat="count")+
  ggtitle("법규위반") +
  xlab("법규위반") + coord_flip()
p12<- ggplot(accident)+geom_bar(aes(노면상태), stat="count")+
  ggtitle("노면상태") +
  xlab("노면상태") + coord_flip()
p13<- ggplot(accident)+geom_bar(aes(기상상태), stat="count")+
  ggtitle("기상상태") +
  xlab("기상상태") + coord_flip()
p14<- ggplot(accident)+geom_bar(aes(도로형태), stat="count")+
  ggtitle("도로형태") +
  xlab("도로형태") + coord_flip()

#가해운전자 정보
p15<- ggplot(accident)+geom_bar(aes(가해운전자차종), stat="count")+
  ggtitle("가해운전자 차종") +
  xlab("가해운전자 차종") + coord_flip()
p16<- ggplot(accident)+geom_bar(aes(가해운전자성별), stat="count")+
  ggtitle("가해운전자 성별") +
  xlab("가해운전자 성별")
p17<- ggplot(accident)+geom_bar(aes(가해운전자연령), stat="count")+
  ggtitle("가해운전자 연령") +
  xlab("가해운전자 연령")
p18<- ggplot(accident)+geom_bar(aes(가해운전자상해정도), stat="count")+
  ggtitle("가해운전자 상해정도") +
  xlab("가해운전자 상해정도") + coord_flip()

#피해운전자 정보
p19<- ggplot(accident)+geom_bar(aes(피해운전자차종), stat="count")+
  ggtitle("피해운전자 차종") +
  xlab("피해운전자 차종") + coord_flip()
p20<- ggplot(accident)+geom_bar(aes(피해운전자성별), stat="count")+   #결측치 존재함
  ggtitle("피해운전자 성별") +
  xlab("피해운전자 성별")
p21<- ggplot(accident)+geom_bar(aes(피해운전자연령), stat="count")+
  ggtitle("피해운전자 연령") +
  xlab("피해운전자 연령")
p22<- ggplot(accident)+geom_bar(aes(피해운전자상해정도), stat="count")+
  ggtitle("피해운전자 상해정도") +
  xlab("피해운전자 상해정도") + coord_flip()


grid.arrange(p3,p4,p5,p10, ncol=2)
grid.arrange(p11,p12,p13,p14, ncol=2)

p10
p11
p12
p13
p14

grid.arrange(p15,p16,p17,p18, ncol=2)
grid.arrange(p15,p16,p17,p18, ncol=2) #가해운전자 정보
grid.arrange(p19,p20,p21,p22, ncol=2) #피해운전자 정보

