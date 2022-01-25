library(dplyr)
library(tidyr)

# parameters settings
num_vars   <- 10
num_groups <- 10
num_series <- 5
total_obs  <- num_groups * num_series

# generate data
var_vals    <- sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
group_vals  <- sort(rep(sprintf(paste0("group%0", nchar(as.character(total_obs)), "d"), 1:num_groups), num_vars))
series_vals <- unlist(lapply(seq(num_series), FUN = function(x) { rep(x, num_vars*num_groups) }) )
obs_vals    <- sort(rep(sprintf(paste0("obs%0", nchar(as.character(total_obs)), "d"), 1:(num_groups*num_series)), num_vars))

data <- data.frame(Variable = var_vals,
                   Observation = obs_vals,
                   Group = group_vals,
                   Series = series_vals,
                   Measurement = runif(total_obs*num_vars, 0, 1))

write.table(data, "c05_groups_series/c05_groups_series.tsv", sep = "\t", row.names = FALSE)