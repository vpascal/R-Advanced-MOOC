factorial_loop <- function(x) {
  if (x == 1) {
    print(1)
  }
  else {
    for (i in x:2) {
      x = x * (i - 1)
      
    }
    x
  }
}

# factorial_loop(1)
# factorial_loop(2)
# factorial_loop(5)
# factorial_loop(6)


factorial_reduce <- function(x){
  
  Reduce("*",1:x)
  
}

# factorial_reduce(1)
# factorial_reduce(2)
# factorial_reduce(5)
# factorial_reduce(6)


factorial_func <- function(x) {
  if (x == 1) {
    1
  }
  else {
    x * factorial_func(x - 1)
    
    
  }
}

#factorial_func(1)
#factorial_func(10)

