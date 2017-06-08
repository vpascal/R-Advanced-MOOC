library(dplyr)
source("ooo_code.R")


temp <- read.csv("data/MIE.csv")

file <- make_LD(temp)
class(file)
print(class(file))
print(file)


out <- subject(file,14)
print(out)

