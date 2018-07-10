install.packages("ggmap")
library(ggmap)
library(dplyr)
library(ggplot2)
attach(accident)


gangnam <- subset(accident, grepl("강남구",발생시군구))
getwd()
write.csv(gangnam,"강남구.csv")
         
attach(gangnam)
summary(gangnam)
gnHour <- ggplot(gangnam)+geom_bar(aes(시),stat = "count") + ggtitle("전체 시간대별 사고")
gnHour

gnFri <- gangnam %>%
  filter(발생요일 == "금요일")
gnFriHour <- ggplot(gnFri)+geom_bar(aes(시),stat = "count") + ggtitle("금요일 시간대별 사고")
gnFriHour

gnLight <- gangnam %>%
  filter(사고내용 == "경상사고")
gnLightHour <- ggplot(gnLight)+geom_bar(aes(시),stat = "count") + ggtitle("전체 시간대별 경상사고")
gnLightHour

gnInjury <- gangnam %>%
  filter(사고내용 == "부상신고사고")
gnInjuryHour <- ggplot(gnInjury)+geom_bar(aes(시),stat = "count") + ggtitle("전체 시간대별 부상신고사고")
gnInjuryHour

gnHeavy <- gangnam %>%
  filter(사고내용 == "중상사고")
gnHeavyHour <- ggplot(gnHeavy)+geom_bar(aes(시),stat = "count") + ggtitle("전체 시간대별 중상사고")
gnHeavyHour

gnDie <- gangnam %>%
  filter(사고내용 == "사망사고")
gnDieHour <- ggplot(gnDie)+geom_bar(aes(시),stat = "count") + ggtitle("전체 시간대별 사망사고")
gnDieHour

gnFriTypeHour <- ggplot(gnFri)+geom_bar(aes(시,fill = 사고내용)) + 
  +   geom_bar(stat="count")+ ggtitle("금요일 시간대별 사고")
gnFriTypeHour
gnFriTypeHour <- ggplot(gnFri)+geom_bar(aes(시),stat = "count",fill = 사고내용) + ggtitle("금요일 시간대별 사고")
gnFriTypeHour





