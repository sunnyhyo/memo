# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

oh=[]
def dateday(f):
    global oh
    lines=f.readlines()
    for line in lines:
        if (str(line).split(" ") != ""):
            date = str(line).split(" ")[0]+str(line).split(" ")[1]+str(line).split(" ")[2]
            day = str(line).split(" ")[3]
            str(date)
            str(day)
            ohh=date+","+day
            oh.append(ohh)
    return oh



f= open("C:\\Users\\HS\\Documents\\GitHub\\memo\\연습장_효선\\년월일시 칼럼나누기.csv", "r")
oo=dateday(f)
f.close()

f= open("C:\\Users\\HS\\Documents\\GitHub\\memo\\연습장_효선\\년월일시 칼럼나누기.csv", "w")

for i in len(oo):
        a=oo 
        f.write(a)
f.close()


a="2017년 1월 1일 00시"
d= str(a).split(" ")[0] +str(a).split(" ")[1] +str(a).split(" ")[2] 
dd= str(a).split(" ")[3]
print(d)
print(dd)
k=[]
k
k=print(d+","+dd)