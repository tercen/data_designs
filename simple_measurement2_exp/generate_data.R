library(dplyr)

# parameters settings
num_vars     <- 10
num_obs      <- 10
total_vals   <- num_vars * num_obs
meas_min_val <- 0
meas_max_val <- 1

# generate data
var_vals    <- sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
obs_vals    <- sort(rep(sprintf(paste0("obs%0", nchar(as.character(num_obs)), "d"), 1:num_obs), num_vars))

data <- data.frame(Observation = obs_vals, 
                   Variable = var_vals, 
                   Measurement = runif(total_vals, meas_min_val, meas_max_val),
                   Measurement2 = runif(total_vals, 1 + meas_min_val, 1 + meas_max_val))

write.table(data, "simple_measurement2_exp/simple_measurement2_exp.tsv", sep = "\t", row.names = FALSE)