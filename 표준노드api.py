# -*- coding: utf-8 -*-
"""
Created on Sat Jul 28 12:22:53 2018

@author: HS PARK
"""

import pandas as pd
from bs4 import BeautifulSoup
import requests
startnumber=1
endnumber=1000
CommerceInfor = {}
link_id = []
road_name=[]
max_spd =[]
rd_rank_h =[]
rd_type_h=[]
rest_veh_h=[]
rest_w=[]
rest_h=[]
remark=[]
ag_geom=[]


'''codelist = []
codenamelist = []
totalnumberlist = []
maletotallist = []
femaletotallist = []
agrade_10list = []
agrade_20list = []
agrade_30list = []
agrade_40list = []
agrade_50list = []
above_60list = []'''

while endnumber<=2000:
    url='http://openapi.seoul.go.kr:8088/인증키/ xml/   InfoTrdarFlpop/' +str(startnumber)+'/ '+str(endnumber)+ '/201711'
    req = requests.get(url)
    html = req.text
    soup = BeautifulSoup(html, 'html.parser')
    codenumber = soup.find_all('trdar_cd')
    codename = soup.find_all('trdar_cd_nm')
    totalnumber = soup.find_all('tot_flpop_co')
    maletotal = soup.find_all('ml_flpop_co')
    femaletotal = soup.find_all('fml_flpop_co')
    agrade_10 = soup.find_all('agrde_10_flpop_co')
    agrade_20 = soup.find_all('agrde_20_flpop_co')
    agrade_30 = soup.find_all('agrde_30_flpop_co')
    agrade_40 = soup.find_all('agrde_40_flpop_co')
    agrade_50 = soup.find_all('agrde_50_flpop_co')
    above_60 = soup.find_all('agrde_60_above_flpop_co')
    for code in codenumber:
        codelist.append(code.text)
    for code in codename:
        codenamelist.append(code.text)
    for code in totalnumber:
        totalnumberlist.append(code.text)
    for code in maletotal:
        maletotallist.append(code.text)
    for code in femaletotal:
        femaletotallist.append(code.text)
    for code in agrade_10:
        agrade_10list.append(code.text)
    for code in agrade_20:
        agrade_20list.append(code.text)
    for code in agrade_30:
        agrade_30list.append(code.text)
    for code in agrade_40:
        agrade_40list.append(code.text)
    for code in agrade_50:
        agrade_50list.append(code.text)
    for code in above_60:
        above_60list.append(code.text)
startnumber+=1000
endnumber+=1000


url='http://openapi.seoul.go.kr:8088/인증키/xml/InfoTrdarFlpop/1/5/201711'
req=requests.get(url)
html=req.text
soup=BeautifulSoup(html, 'html.parser')
codenumber = soup.find_all('trdar_cd')

CommerceInfor['Code'] = codelist
CommerceInfor['Name'] = codenamelist
CommerceInfor['Total Number'] = totalnumberlist
CommerceInfor['Male Total Number'] = maletotallist
CommerceInfor['Female Total Number'] = femaletotallist
CommerceInfor['Age 10s Number'] = agrade_10list
CommerceInfor['Age 20s Number'] = agrade_20list
CommerceInfor['Age 30s Number'] = agrade_30list
CommerceInfor['Age 40s Number'] = agrade_40list
CommerceInfor['Age 50s Number'] = agrade_50list
CommerceInfor['Age above 60s Number'] = above_60list
df = pd.DataFrame(CommerceInfor)

df = df[['Code','Name', 'Total Number','Male Total Number','Female Total Number','Age 10s Number','Age 20s Number','Age 30s Number','Age 40s Number','Age 50s Number','Age above 60s Number']]