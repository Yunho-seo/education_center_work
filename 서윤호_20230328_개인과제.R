# 평균분석
# 문제     < 서윤호_2023_03_28_개인과제 > < t.test() >
# Cars93 데이터를 이용하여, 생산국이 USA vs Non-USA(Origin) 두 그룹간의
# Price 평균이 차이가 있는지를 테스트. 단 95% 신뢰구간에서 구할 것.
# 귀무가설 : 두 집단이 Price 평균에 따른 차이가 없다.
# 대립가설 : 두 집단이 Price 평균에 따른 차이가 있다.

# 방안 1)
library(MASS)
library(tidyverse)
data <- Cars93
data$Origin
a1 <- Cars93 %>%
  select(Price, Origin) %>%
  filter(Cars93$Origin == "USA")
a2 <- Cars93 %>%
  select(Price, Origin) %>%
  filter(Cars93$Origin == "non-USA")
t.test(a1$Price, a2$Price, var.equal = T, conf.level = 0.95)

############# #############
# 방안 2)
USA <- Cars93$Price[Cars93$Origin == "USA"]
NUSA <- Cars93$Price[Cars93$Origin != "USA"]

# 두 그룹간 평균(mean) 차이를 검정 (등분산이 같다고 가정) (t.test())
t.test(USA, NUSA, var.equal = T, conf.level = 0.95)

# t = -0.96555, df = 91, p-value = 0.3368
# p-value = 0.3368 > 0.05
# 귀무가설이 기각되지 않는다 => USA와 non-USA의 가격 평균에 따른 차이는 없다.
