library(tidyr)

make_LD <- function(x){
  
  structure(list(data = x),class="LongitudinalData")
  
}

print.LongitudinalData <- function(x){
  
  paste("Longitudinal dataset with",length(unique(x$data$id)),"subjects")
  
}


subject <- function(x,condition){
  UseMethod("subject", x)
}

subject.LongitudinalData <- function(x, condition){

  
  if(!condition %in% x$data$id){NULL} else{
  temp <- x$data %>% filter(id == condition) #%>% 
  make_LD(temp)
  }
}


visit <- function(x,condition){
  UseMethod("visit", x)
}

visit.LongitudinalData <- function(x, condition){
  
  temp <- x$data %>% filter(visit == condition) #%>% 
  make_LD(temp)
  
}


room <- function(x,condition){
  UseMethod("room", x)
}

room.LongitudinalData <- function(x, condition){
  
  temp <- x$data %>% filter(room == condition) %>% select(value) 
  #make_LD(temp)
  
}



summary <- function(x,...){
  UseMethod("summary", x)
}

summary.LongitudinalData <- function(x){
  
  x$data %>% #filter(id == condition) %>% 
  select(id, visit, room, value) %>% 
 # filter(room %in% c ("bedroom","den","living room","office")) %>% 
  group_by(visit, room) %>% summarise(value=mean(value)) %>% 
  spread(room,value)
  
}



