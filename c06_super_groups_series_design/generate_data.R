library(dplyr)
library(tidyr)

# parameters settings
num_vars    <- 10
num_groups  <- 10
num_sgroups <- 2
num_series  <- 5
total_obs   <- num_vars * num_groups * num_series
IDs         <- c("EFS_246_258", "41_654_666","ANXA2_17_29", "CBL_693_705", "CD3Z_116_128", "CDK2_8_20", "CTNB1_79_91", "DCX_67_79", 
                 "DDR1_506_518", "DYR1A_312_324")

# generate data
ID_vals     <- rep(IDs, 10)
group_vals  <- sort(rep(sprintf(paste0("group%0", nchar(as.character(total_obs)), "d"), 1:num_groups), num_vars))
series_vals <- unlist(lapply(seq(num_series), FUN = function(x) { rep(x, num_vars*num_groups) }) )
obs_vals    <- sprintf(paste0("obs%0", nchar(as.character(total_obs)), "d"), 1:total_obs)
supergroup_vals <- sort(unlist(lapply(seq(num_sgroups), FUN = function(x) { rep(paste0("supergroup", x), total_obs/num_sgroups)})))

data <- data.frame(ID = ID_vals,
                   Observation = obs_vals,
                   Group = group_vals,
                   Supergroup = supergroup_vals,
                   Series = series_vals,
                   Measurement = runif(total_obs, 0, 1))

write.table(data, "c06_super_groups_series_design/c06_super_groups_series_design.tsv", sep = "\t", row.names = FALSE)