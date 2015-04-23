# This script borrows liberally from Gaston Sanchez
# (https://github.com/gastonstat/Mining_Twitter/tree/master/Rscripts),

setwd("~/Dropbox/gh_projects/migration_tweets")
load("cleaned_data/complete.RData")

require(stringr)
require(igraph)

Sys.setlocale(locale="C")

# Let's Identify retweets
# regular expressions to find retweets
grep("(RT|via)((?:\\b\\W*@\\w+)+)", df$text, 
     ignore.case=TRUE, value=TRUE)

# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)", 
                   df$text, ignore.case=TRUE)

# Collect who retweeted and who posted
# We'll use these results to form an edge list in order to create the graph
# create list to store user names

who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))


# for loop
for (i in 1:length(rt_patterns))
{ 
  # get tweet with retweet entity
  twit = df[rt_patterns[i],]
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
el.df<-as.data.frame(retweeter_poster)
el.df<-el.df[order(el.df$who_post),]
el.df<-el.df[-grep(" ", el.df$who_post),]  # remove RTs of multiples
rownames(el.df)<-NULL
rt_ml <- graph.data.frame(el.df, directed=T)
# write.csv(el.df, "cleaned_data/migration_el.csv")
# write.graph(rt_ml, file="cleaned_data/migration_ntwrk.graphml", format="graphml")
