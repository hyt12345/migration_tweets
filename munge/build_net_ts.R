setwd("~/Dropbox/gh_projects/migration_tweets")
load("cleaned_data/complete.RData")

require(stringr)
require(igraph)

Sys.setlocale(locale="C")

per1<-df[1:27392,]
per2<-df[27393:54785,]
per3<-df[54786:82177,]
per4<-df[82178:109569,]
per5<-df[109569:136960,]

# Let's Identify retweets
# regular expressions to find retweets
grep("(RT|via)((?:\\b\\W*@\\w+)+)", df$text, 
     ignore.case=TRUE, value=TRUE)

##### Network Snapshot 1

# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)", 
                   per1$text, ignore.case=TRUE)

# Collect who retweeted and who posted
# We'll use these results to form an edge list in order to create the graph
# create list to store user names

who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))


# for loop
for (i in 1:length(rt_patterns))
{ 
  # get tweet with retweet entity
  twit = per1[rt_patterns[i],]
  # get retweet source 
  poster = str_extract_all(twit$text,
                           "(RT|via)((?:\\b\\W*@\\w+)+)") 
  #remove ':'
  poster = gsub(":", "", unlist(poster)) 
  # name of retweeted user
  who_post[[i]] = gsub("(RT @|via @)", "", poster, ignore.case=TRUE) 
  # name of retweeting user 
  who_retweet[[i]] = rep(twit$user.screen_name, length(poster)) 
}

# unlist results
who_post = unlist(who_post)
who_retweet = unlist(who_retweet)

# print(paste(length(unique(who_post)), " users retweeted by ", length(unique(who_retweet)), " users ", sep=""))



# Create graph from an edglist
# two column matrix of edges
retweeter_poster = cbind(who_retweet, who_post)

# generate graph
el.df1<-as.data.frame(retweeter_poster)
el.df1<-el.df1[order(el.df1$who_post),]
el.df1<-el.df1[-grep(" ", el.df1$who_post),]  # remove RTs of multiples
rownames(el.df1)<-NULL
write.csv(el.df1, "cleaned_data/migration_el1.csv")

##### Network Snapshot 2

# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)", 
                   per2$text, ignore.case=TRUE)

# Collect who retweeted and who posted
# We'll use these results to form an edge list in order to create the graph
# create list to store user names

who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))


# for loop
for (i in 1:length(rt_patterns))
{ 
  # get tweet with retweet entity
  twit = per2[rt_patterns[i],]
  # get retweet source 
  poster = str_extract_all(twit$text,
                           "(RT|via)((?:\\b\\W*@\\w+)+)") 
  #remove ':'
  poster = gsub(":", "", unlist(poster)) 
  # name of retweeted user
  who_post[[i]] = gsub("(RT @|via @)", "", poster, ignore.case=TRUE) 
  # name of retweeting user 
  who_retweet[[i]] = rep(twit$user.screen_name, length(poster)) 
}

# unlist results
who_post = unlist(who_post)
who_retweet = unlist(who_retweet)

# print(paste(length(unique(who_post)), " users retweeted by ", length(unique(who_retweet)), " users ", sep=""))



# Create graph from an edglist
# two column matrix of edges
retweeter_poster = cbind(who_retweet, who_post)

# generate graph
el.df2<-as.data.frame(retweeter_poster)
el.df2<-el.df2[order(el.df2$who_post),]
el.df2<-el.df2[-grep(" ", el.df2$who_post),]  # remove RTs of multiples
rownames(el.df2)<-NULL
write.csv(el.df2, "cleaned_data/migration_el2.csv")

##### Network Snapshot 3

# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)", 
                   per3$text, ignore.case=TRUE)

# Collect who retweeted and who posted
# We'll use these results to form an edge list in order to create the graph
# create list to store user names

who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))


# for loop
for (i in 1:length(rt_patterns))
{ 
  # get tweet with retweet entity
  twit = per3[rt_patterns[i],]
  # get retweet source 
  poster = str_extract_all(twit$text,
                           "(RT|via)((?:\\b\\W*@\\w+)+)") 
  #remove ':'
  poster = gsub(":", "", unlist(poster)) 
  # name of retweeted user
  who_post[[i]] = gsub("(RT @|via @)", "", poster, ignore.case=TRUE) 
  # name of retweeting user 
  who_retweet[[i]] = rep(twit$user.screen_name, length(poster)) 
}

# unlist results
who_post = unlist(who_post)
who_retweet = unlist(who_retweet)

# print(paste(length(unique(who_post)), " users retweeted by ", length(unique(who_retweet)), " users ", sep=""))



# Create graph from an edglist
# two column matrix of edges
retweeter_poster = cbind(who_retweet, who_post)

# generate graph
el.df3<-as.data.frame(retweeter_poster)
el.df3<-el.df3[order(el.df3$who_post),]
el.df3<-el.df3[-grep(" ", el.df3$who_post),]  # remove RTs of multiples
rownames(el.df3)<-NULL
write.csv(el.df3, "cleaned_data/migration_el3.csv")


##### Network Snapshot 4

# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)", 
                   per4$text, ignore.case=TRUE)

# Collect who retweeted and who posted
# We'll use these results to form an edge list in order to create the graph
# create list to store user names

who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))


# for loop
for (i in 1:length(rt_patterns))
{ 
  # get tweet with retweet entity
  twit = per4[rt_patterns[i],]
  # get retweet source 
  poster = str_extract_all(twit$text,
                           "(RT|via)((?:\\b\\W*@\\w+)+)") 
  #remove ':'
  poster = gsub(":", "", unlist(poster)) 
  # name of retweeted user
  who_post[[i]] = gsub("(RT @|via @)", "", poster, ignore.case=TRUE) 
  # name of retweeting user 
  who_retweet[[i]] = rep(twit$user.screen_name, length(poster)) 
}

# unlist results
who_post = unlist(who_post)
who_retweet = unlist(who_retweet)

# print(paste(length(unique(who_post)), " users retweeted by ", length(unique(who_retweet)), " users ", sep=""))



# Create graph from an edglist
# two column matrix of edges
retweeter_poster = cbind(who_retweet, who_post)

# generate graph
el.df4<-as.data.frame(retweeter_poster)
el.df4<-el.df4[order(el.df4$who_post),]
el.df4<-el.df4[-grep(" ", el.df4$who_post),]  # remove RTs of multiples
rownames(el.df4)<-NULL
write.csv(el.df4, "cleaned_data/migration_el4.csv")

##### Network Snapshot 5

# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)", 
                   per5$text, ignore.case=TRUE)

# Collect who retweeted and who posted
# We'll use these results to form an edge list in order to create the graph
# create list to store user names

who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))


# for loop
for (i in 1:length(rt_patterns))
{ 
  # get tweet with retweet entity
  twit = per5[rt_patterns[i],]
  # get retweet source 
  poster = str_extract_all(twit$text,
                           "(RT|via)((?:\\b\\W*@\\w+)+)") 
  #remove ':'
  poster = gsub(":", "", unlist(poster)) 
  # name of retweeted user
  who_post[[i]] = gsub("(RT @|via @)", "", poster, ignore.case=TRUE) 
  # name of retweeting user 
  who_retweet[[i]] = rep(twit$user.screen_name, length(poster)) 
}

# unlist results
who_post = unlist(who_post)
who_retweet = unlist(who_retweet)

# print(paste(length(unique(who_post)), " users retweeted by ", length(unique(who_retweet)), " users ", sep=""))



# Create graph from an edglist
# two column matrix of edges
retweeter_poster = cbind(who_retweet, who_post)

# generate graph
el.df5<-as.data.frame(retweeter_poster)
el.df5<-el.df5[order(el.df5$who_post),]
el.df5<-el.df5[-grep(" ", el.df5$who_post),]  # remove RTs of multiples
rownames(el.df5)<-NULL
write.csv(el.df5, "cleaned_data/migration_el5.csv")

