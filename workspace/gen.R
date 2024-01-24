library(tidyr)
library(tibble)
library(dplyr)

l_1 <- c("obs1","obs2", "obs3", "obs4", "obs5")


l_2 <- (l_1) %>% ntile(n=2) %>% paste("sip") 

r <- c(3,1)


o <- c("")

mutate(mtcars, row_number() == 3L)
mutate(mtcars, ntile())


x<- c(5, 1, 3, 2, 2, NA)
row_number(x)
min_rank(x)
dense_rank(x)
percent_rank(x)
cume_dist(x)

ntile(x, 2)
ntile(runif(100), 10)


x<-(7:1)
