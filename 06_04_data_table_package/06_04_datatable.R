# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Demonstration of data.table package

# data.table: based on data.frame.
# includes elements of tidyverse: dplyr, tibbles
# Also includes SQL like notation. 

install.packages("data.table")
library(data.table)

myDataTable <- fread("../40797218_T_ONTIME.csv")
myDataFrame <- read.csv("../40797218_T_ONTIME.csv")

# data.table syntax vs sql
# i = where
# j = select or update
# by = group by
# so ... data.table[ i, j, by ]

# select rows WHERE DISTANCE > 500 (demonstrates i)
normalDataFrameSyntax <- myDataFrame[ myDataFrame$DISTANCE > 500, ]
datatableSyntax <- myDataTable[ DISTANCE > 500 ] # no prefix. No comma

# return median DISTANCE where DISTANCE > 500 (demonstrates i & j )
# SQL equivalent would be SELECT median(DISTANCE) FROM data WHERE DISTANCE > 500
datatableSyntax <- myDataTable[ DISTANCE > 500, median(DISTANCE) ] # no prefix
normalDataFrameSyntax <- median(myDataFrame[ myDataFrame$DISTANCE > 500, "DISTANCE" ])

# Aggregate with data.table's "BY"
# find the median DISTANCE where DISTANCE > 500 for every state
datatableSyntax <- myDataTable[ DISTANCE > 500, median(DISTANCE), by = ORIGIN_STATE_ABR ] # no prefix

# base r requires two steps
normalDataFrameSyntax <- myDataFrame[ myDataFrame$DISTANCE > 500, ]
agg_dataFrame <- aggregate(x = normalDataFrameSyntax$DISTANCE, 
                           by = list( normalDataFrameSyntax$ORIGIN_STATE_ABR), 
                           FUN = median)
