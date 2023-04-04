# 조별 문제  < 4조 팀 과제 >
# 수작업 (다음 조합에 대하여 지지도, 신뢰도, 향상도 구하기)
# {맥주} = 고기
# {라면, 우유} = 맥주

# {맥주} = 고기 
# 지지도 : 1/6
# 신뢰도 : 1/6 / 1/3 = 1/2
# 향상도 : 1/2 / 2/3 = 3/4

# {라면, 우유} = 맥주
# 라면 우유 지지도 : 1/2, 맥주 지지도 : 1/3
# 지지도 : 1/6
# 신뢰도 : 1/6 / 1/2 = 1/3
# 향상도 : 1/3 / 1/3 = 1

# 연관분석을 통해..
# 적당한 지지도와 신뢰도를 결정
# 향상도를 이용하여 결과를 해석하고 정렬한 다음 출력
# 데이터를 데이터베이스에 입력하고 로딩하여 처리하기 (연관분석 : 데이터베이스)
data <- read.transactions('tran.txt', format = "basket", sep=",")
data
inspect(data)
image(data)
rule <- apriori(data, parameter = list(supp=0.02, conf=0.02))
inspect(rule)

# {맥주} => {고기}       supp : 0.1666667, conf : 0.5000000, lift : 0.75
# {라면, 우유} => {맥주} supp : 0.1666667, conf : 0.3333333, lift : 1.00

# 향상도 정렬
str(data)
inspect(head(data))
inspect(head(sort(data, decreasing=T, by = c("lift"))))
############

data_df <- as.data.frame(data)
class(data_df)
colnames(data_df) <- c("ramen","beer","milk","meat","fruit") 
data_df

####################################

pb_matrix <- matrix(c(
  1,1,1,0,0,
  1,0,1,1,0,
  1,0,0,1,1,
  0,1,1,1,0,
  1,0,1,1,0,
  0,0,1,0,1
), ncol = 5, byrow=T)
dimnames(pb_matrix) <- list(paste("Tr", c(1:6), sep=""),
                            c("ramen","beer","milk","meat","fruit"))
pb_matrix
image(pb_matrix)
trans2 <- as(pb_matrix, "transactions")   # 희소행렬 처리 format으로 변환.
trans2 #
rule <- apriori(trans2, parameter = list(supp=0.15, conf=0.15))
inspect(rule)

pb_matrix_df <- as.data.frame(pb_matrix)
class(pb_matrix_df)
colnames(pb_matrix_df) <- c("ramen","beer","milk","meat","fruit") 
pb_matrix_df

library(dplyr)
library(dbplyr)
library(DBI)
library(RMySQL)
conn = dbConnect(MySQL(), user='root', password='acorn1234', dbname='conn',
                 host = '192.168.41.184')
dbListTables(conn)
dbWriteTable(conn, "conn", pb_matrix_df)

res <- dbSendQuery(conn, "select * from conn")
(query_result <- dbFetch(res))
dim(query_result)

# 적당한 지지도와 신뢰도를 결정
(trans1 <- as(as.matrix(query_result),"transactions"))
rule <- apriori(trans1, parameter = list(supp=0.15, conf=0.15), control=list(sort=1))
inspect(rule)

# 결과를 해석하고 향상도를 이용해서 정렬한 다음 출력
inspect(sort(rule, decreasing = T, by=c("lift")))

# 출력
plot(rule, method="graph", engine = "interactive")
