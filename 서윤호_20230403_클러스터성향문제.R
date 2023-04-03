# 문제  < 미래융합 서윤호 문제 제출, 2023.04.03 >
# 클러스터별 자기가 알고싶은 성향을 확인하여 제출
# 3개 이상

# 남자는 음악과 드레스에 관심이 많은가?
aggregate(data=teens, music + dress ~ gender == 'M', mean)

# 남자는 음주와 마약에 관심이 많은가?
aggregate(data = teens, drunk + drugs ~ gender=='M', mean)

# 여자는 야구 + 스포츠에 관심이 많은가?
aggregate(data = teens, basketball + sports ~ gender=='F', mean)

# 여자는 쇼핑에 관심이 많은가?
aggregate(data = teens, shopping ~ gender=='F', mean)
