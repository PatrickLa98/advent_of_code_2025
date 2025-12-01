rm(list = ls())

library(tidyverse)

df <- read.delim("Documents/GitHub/advent_of_code_2025/day1_data.txt", header = FALSE) %>% 
      separate(col = V1,
               into = c("Direction", "Movement"),
               sep = "(?<=[LR])") %>% 
  mutate(Movement = as.numeric(Movement))

df$current = NA

current = 50

additional_zeros = 0

for(i in 1:nrow(df)) {
  
  
  
  dir = df$Direction[i]
  mov = df$Movement[i]
  
while (mov > 99) {
  
  mov = mov - 100
  
  additional_zeros =  additional_zeros + 1
  
  
}
  
if (dir == "R") {
  
  current = current + mov
  
  if (current > 99) {
    
    current = current - 100
    
    if (current != 0 && (i == 1 || df$current[i - 1] != 0)) {
      
      additional_zeros =  additional_zeros + 1
    }
    
  }
    
    
} else if (dir == "L") {
  
  
  current = current - mov
  
  if (current < 0) {
    
    current = current + 100
    
    if (current != 0 && (i == 1 || df$current[i - 1] != 0)) {

            additional_zeros =  additional_zeros + 1
    }    
  }
  
}
  
df$current[i] = current

  
}

sum(df$current == 0) + additional_zeros


  





