library(dplyr)

# parameters settings
num_vars         <- 10
num_obs          <- 10
num_groups       <- 2   # Control and Treatment
num_super_groups <- 2
total_vals       <- num_vars * num_obs
meas_min_val     <- 0
meas_max_val     <- 1

# generate data
var_vals    <- sprintf(paste0("variable%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
obs_vals    <- sort(rep(sprintf(paste0("observation%0", nchar(as.character(num_obs)), "d"), 1:num_obs), num_vars))
group_vals  <- c(rep("Control", total_vals/2), rep("Treatment", total_vals/2))

get_group_data <- function(supergroup) {
  meas_vals   <- runif(total_vals, meas_min_val, meas_max_val)
  data.frame(Observation = obs_vals, 
             Variable = var_vals, 
             Measurement = meas_vals,
             Group = group_vals,
             Supergroup = paste0("supergroup", supergroup))
}

data <- do.call(rbind, lapply(seq(num_super_groups), FUN = function(x) {get_group_data(x)}))
write.table(data, "groups_super_control_exp/groups_super_control_exp.tsv", sep = "\t", row.names = FALSE)
