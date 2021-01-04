# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: calculate readability of a sentence from command line

list.of.packages <- c("readability")

if (! "readability" %in% installed.packages() ) {
	install.packages("readability")
	}

library(readability)

# read arguments
argv <- commandArgs(trailingOnly = TRUE)

readability(argv[1], NULL)
