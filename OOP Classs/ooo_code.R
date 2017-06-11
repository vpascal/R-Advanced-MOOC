library(tidyr)

make_LD <- function(x){
  
  structure(list(data = x),class="LongitudinalData")
  
}

print.LongitudinalData <- function(x){
  
  cat("Longitudinal dataset with",length(unique(x$data$id)),"subjects")
  
}

subject <- function(x,condition){
  
  if(!condition %in% x$data$id){ 
    
    NULL} 
  
   else {
       temp <- x$data %>% select(id, visit, room, value) %>%
        filter(id == condition) %>% 
        group_by(visit,room) %>% summarise(value=mean(value)) %>% 
        spread(room,value)
        temp <- data.frame(temp)
       
      structure(list(data=temp,id=condition),class="subject")
  }
  
 }

print.subject <- function(x){
   cat("Subject ID:",x$id)
 }

summary.subject <- function(x){

  mylist <- list(id=x$id,data=x$data)
  structure(mylist,class="summary")

 }

print.summary <- function(x){
  cat("ID:",x$id,"\n\n")
  print(x$data)
}

visit <- function(x,condition){

    temp <- x$data %>% filter(visit == condition)
    temp <- data.frame(temp)
    structure(list(data=temp,id=x$id, visit=condition),class="visit")

}

print.visit <- function(x){
  cat("Subject ID:",x$id,"\n")
  cat("Visit:", x$visit)
}

summary.visit <- function(x){

  mylist <- list(id=x$id,visit=x$visit, data=x$data)
  structure(mylist,class="summaryvisit")
}

print.summaryvisit <- function(x){
  cat("ID:",x$id,"\n")
  cat("Room:",x$visit, "\n\n")
  print(x$data)
}

room <- function(x, condition){
  
  structure(list(data=temp,id=x$id, visit=x$visit, room=condition),class='room')
    
}

summary.room <- function(x){
  
  temp <- filter(x$data, room == x$room,id==x$id,visit==x$visit) %>% select(value) %>% 
  summary()  
  
}


#Need to implement new print method