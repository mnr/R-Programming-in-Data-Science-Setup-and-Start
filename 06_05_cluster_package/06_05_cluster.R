# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Demonstration of cluster package

myDataFrame <- read.csv("../40797218_T_ONTIME.csv")

# base R kmeans
mydfnostate <- myDataFrame[ , -c(1,5)]
mydfnostatenona <- mydfnostate[ complete.cases(mydfnostate), ]
mykmeansObject <- kmeans(mydfnostatenona, centers = 3)

# Base R plot
plot(mydfnostatenona, col = mykmeansObject$cluster)


# adding the cluster package ----------------------------------------------

install.packages("cluster")
library(cluster)

# cluster package includes...
# hierarchical methods: 
#    agnes: AGglomerative NESting
#    diana: DIvisive ANAlysis
#    mona: MONothetic Analysis Clustering of Binary Variables
# Partitioning methods: 
#    pam: Partitioning Around Medoids
#    clara: Clustering Large Applications
#    fanny: Fuzzy Analysis Clustering

# plotting the data set from above
clusplot(mydfnostatenona, mykmeansObject$cluster) # using cluster package

# simple demo of clara
myClaraObject <- clara(mydfnostate, k=3)
plot(myClaraObject)


