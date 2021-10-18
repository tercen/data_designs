library(dplyr)

# parameters settings
num_vars         <- 10
num_obs          <- 12
num_groups       <- 4
num_pairs        <- 3
total_vals       <- num_vars * num_obs
meas_min_val     <- 0
meas_max_val     <- 1

# generate data
var_vals    <- sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
obs_vals    <- sort(rep(sprintf(paste0("obs%0", nchar(as.character(num_obs)), "d"), 1:num_obs), num_vars))
group_vals  <- unlist(lapply(seq(num_groups), FUN = function(x) {  rep(paste0("group",x), total_vals/num_groups)} ))
pair_vals   <- unlist(lapply(seq(num_groups), FUN = function(g) unlist(lapply(seq(num_pairs), FUN = function(x) { rep(paste0("pair",x), num_vars) }))))
meas_vals   <- runif(total_vals, meas_min_val, meas_max_val)

data <- data.frame(Observation = obs_vals, 
                   Variable = var_vals, 
                   Measurement = meas_vals,
                   Pair = pair_vals,
                   Group = group_vals)  %>% 
           mutate(Group = if_else(Group == "group1", "control", Group))

write.table(data, "groups_pairing_control_exp/groups_pairing_control_exp.tsv", sep = "\t", row.names = FALSE)
