library(dplyr)
library(tidyr)

# parameters settings
num_vars   <- 10
num_series <- 5
total_obs  <- num_vars * num_series

# generate data
var_vals    <- sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
series_vals <- unlist(lapply(seq(num_series), FUN = function(x) { rep(x, num_vars*num_groups) }) )
obs_vals    <- sprintf(paste0("obs%0", nchar(as.character(total_obs)), "d"), 1:total_obs)

data <- data.frame(Variable = var_vals,
                   Observation = obs_vals,
                   Series = series_vals,
                   Measurement = runif(total_obs, 0, 1))

write.table(data, "series_exp/series_exp.tsv", sep = "\t", row.names = FALSE)