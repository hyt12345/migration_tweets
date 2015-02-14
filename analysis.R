setwd("~/Desktop/migration_tweet")

library(plyr)
library(RJSONIO)
require(jsonlite)
lstJson <- fromJSON("output.json", flatten=TRUE)

summary(as.factor(lstJson$lang))

final_data <- do.call(rbind, lstJson)
final_data <- do.call(rbind, final_data)

final_data <- do.call(rbind, json_data)
final_data <- unlist(final_data)
final_data[2]



library(rjson)
json_file <- "output.json"
json_data <- fromJSON(paste(readLines(json_file, n=11000), collapse=""))

data = unlist(json_data)

title=data[names(data)=="titulo"]
print(title)

text=data[names(data)=="textos.texto"]
print(text)

url=data[names(data)=="textos.source_url"]
print(url)



lstJson[2]

names(lstJson)
df<-unlist(lstJson)

summary(lstJson$lang)

colnames(final_data)
[1] "winner" "votes" "startPrice" "lastVote.timestamp" "lastVote.user.name" "lastVote.user.user_id"
final_data[,c("id","verified")]
winner startPrice lastVote.user.name
1 68694999          0              Lamur
lstJson[,c("links")]
