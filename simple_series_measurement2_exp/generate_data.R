library(dplyr)
library(tidyr)

# parameters settings
num_vars   <- 10
num_obs    <- 10
num_series <- 5
total_vals <- num_vars * num_obs * num_series

# generate data
var_vals    <- sprintf(paste0("variable%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
obs_vals    <- sort(rep(sprintf(paste0("observation%0", nchar(as.character(num_obs)), "d"), 1:num_obs), num_vars))
series_vals <- unlist(lapply(seq(num_series), FUN = function(x) { rep(x, num_vars*num_obs) }) )

data <- data.frame(Series = series_vals,
                   Observation = obs_vals, 
                   Variable = var_vals, 
                   Measurement = runif(total_vals, 0, 1), 
                   Measurement2 = runif(total_vals, 0, 0.1))

write.table(data, "simple_series_measurement2_exp/simple_series_measurement2.tsv", sep = "\t", row.names = FALSE)