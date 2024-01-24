library(dplyr)

# parameters settings
num_vars         <- 10
num_obs          <- 10
num_groups       <- 5
total_vals       <- num_vars * num_obs
meas_min_val     <- 0
meas_max_val     <- 100

# generate data
var_vals    <- sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
obs_vals    <- sort(rep(sprintf(paste0("obs%0", nchar(as.character(num_obs)), "d"), 1:num_obs), num_vars))
group_vals  <- unlist(lapply(seq(num_groups), FUN = function(x) { rep(paste0("group", x), total_vals/num_groups) }))

data <- data.frame(Observation = obs_vals, 
                   Variable = var_vals, 
                   Measurement = runif(total_vals, meas_min_val, meas_max_val),
                   Group = group_vals)

write.table(data, "c04_group/c04_group.tsv", sep = "\t", row.names = FALSE)
