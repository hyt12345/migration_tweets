import sys
import re
import datetime
import json
from pymongo import MongoClient
from bson.objectid import ObjectId



#public variables
client =  None
db = None
collection = None


#Usi this method FIRST in order to establish a connection to a server
def connectToMongoServer(serverAddress):
    try:
        global client
        client = MongoClient(serverAddress)
    except:
        print( "error")


#connec to a database
def connectoMongoDatabase(databaseName):
    try:
        global db
        db = client[databaseName]
    except Exception as e:
        print (e)




#connec to a database
def connectoMongoCollection(collectionName):
    try:
        global collection
        collection = db[collectionName]
    except Exception as e:
        print (e)


#required for unloading text to 
def encodeText(text):
    text = text.encode('utf-8').strip()
    return text


#Example query to retunr all records.
def returnAllRecordsCounts():
    print ("Count in collection:",collection.count())
    count= 0
    for tweet in collection.find(): 
        try:
            count = count+1
        except Exception as e:
            print( e )             

    print ("total:" +str(count))




#TEMPLATE - HERE YOU NEED TO WRITE SOME OF THE TWEETS TO DO SOME PROCESSING
def returnAllRecords():
    output = open("output.json","w")
    print ("Collection Size:",collection.count())
    count= 0
    regx = re.compile("bulgarian|bulgaria|romania|romanian|england|uk|britain", re.IGNORECASE)
    
    for tweet in collection.find({'interaction.twitter.text':regx}): 
        try:
            print("x")
            twitter = tweet['interaction']['twitter']
            #print json.dumps(twitter)
            count = count+1
            
            output.write(json.dumps(twitter)+"\n")
            #print jsonTweet['twitter']
            # timestamp = tweet['timestamp'].encode('utf-8').strip()
            # tweetUser = tweet['user'].encode('utf-8').strip()
            # tweetText = tweet['tweetText'].encode('utf-8').strip()
            # output.write(forumTitle+','+userName+'\n')
        except Exception as e :
            print (e)              

    print ("total:" +str(count))



#main run module
if __name__ == '__main__':
    #first connect to a server, database, and collection 
    connectToMongoServer("mongodb://dsUser:webobservatory@ec2-54-228-51-114.eu-west-1.compute.amazonaws.com:27017/datasift");
    #connectToMongoServer("mongodb://justin:password123@mdb-001.ecs.soton.ac.uk:27017/twitter_immigration");
    connectoMongoDatabase("datasift")
    connectoMongoCollection("immigration")

    #do a check to see if you can found the collection and records.
    #returnAllRecordsCounts()
    returnAllRecords()

    #DO SOME MORE THINGS HERE:)
    
