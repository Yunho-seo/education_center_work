# 문제 < 미래융합교육원 서윤호_20230404_개인과제 >
# 1) 가족관계 및 교육수준이 소득과의 연관성 확인
# {가족관계, 교육수준} = 소득
# {relationship, education} -> income
str(AdultUCI)
summary(adult)
adult <- AdultUCI
count(unique(adult["relationship"]))
count(unique(adult["education"]))

head(cbind(AdultUCI["relationship"], AdultUCI["education"]))
re1 <- apriori(cbind(AdultUCI["relationship"], AdultUCI["education"], AdultUCI["income"]), parameter = list(supp=0.01, conf=0.01))
re1 = subset(re1, rhs %pin% 'income')
inspect(re1)

# 2) 주당 일하는 시간과 소득과의 관계를 확인
str(adult)
re2 <- apriori(AdultUCI[c("hours-per-week", "income")], parameter = list(supp=0.01, conf=0.01))
re2 = subset(re2, rhs %pin% 'income')
inspect(re2)

# 3) 기타 위의 데이터로부터 자기가 주장하고자하는 내용을 확인하고 의견을 제시

# 나이와 주당 일하는 시간과의 연관성 
str(adult)
re3 <- apriori(AdultUCI[c("age", "hours-per-week")], parameter = list(supp=0.01, conf=0.01))
re3 = subset(re3, rhs %pin% 'hours-per-week')
inspect(re3)

 young
- part.time = 0.057 / 0.292 / 2.418
- full.time = 0.113 / 0.577 / 0.987
- over.time=  0.023 / 0.117 / 0.452

middle
- part.time  = 0.026 / 0.051 / 0.425
- full.time  = 0.301 / 0.596 / 1.020
- over.time  = 0.156 / 0.310 / 1.196
- workaholic = 0.020 / 0.041 / 1.196

senior
- part.time =  0.057 / 0.292 / 2.418
- full.time =  0.113 / 0.577 / 0.987
- over.time =  0.023 / 0.117 / 0.452

old
- part.time =  0.017 / 0.468 / 3.886
- full.time =  0.014 / 0.400 / 0.684

# 어린 회사원(young)은 풀 타임 근무가 많다..
# 중간 회사원(middle)은 풀 타임과 야근이 많다..
# 고급 회사원(senior)는 풀 타임과 파트타임 수준이 많고 야근은 거의 없다. 
# 늙은 회사원(old)는 풀 타임 근무보다 파트타임 근무가 많다.