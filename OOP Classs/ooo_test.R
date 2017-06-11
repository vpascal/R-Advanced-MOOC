library(dplyr)
# source("ooo_code.R")


temp <- read.csv("data/MIE.csv")

temp1 <- make_LD(temp)
class(temp1)
print(temp1)


out <- subject(temp1,10)
print(out)


out <- subject(temp1,14) 
print(out)

out <- subject(temp1,14) %>% summary
print(out)


out <- subject(temp1,14) %>% visit(1)
print(out)

out <- subject(temp1,14) %>% visit(1)  %>% summary
print(out)


out <- subject(temp1,44) %>% visit(1) %>% room('living room') %>% summary()
print(out)


out <- subject(temp1, 44) %>% visit(0) %>% room("bedroom") %>% summary
print(out)

