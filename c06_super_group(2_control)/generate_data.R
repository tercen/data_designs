library(madsim)
library(dplyr)
library(tidyr)

# set parameters settings
supergroup <- "Supergroup"
group      <- "Group"
observation<- "Observation"
variable   <- "Variable" 
measurement<- "Measurement"


num_controls   <- 4
num_treatments <- 4
num_obs        <- num_controls + num_treatments
num_vars       <- 100
num_super_groups <- 2


fparams <- data.frame(m1 = num_controls, m2 = num_treatments, shape2 = 4, lb = 4, ub = 14, pde=0.02, sym=0.5);
dparams <- data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn     <- 0.4
rseed   <- 42


# control <- rep("control", num_controls)
# treatment <- rep("treatment", num_treatments)
# Group <- c(control,treatment)
# 
# Variable <- sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
# Observation <- sprintf(paste0("obs%0", nchar(as.character(num_obs)), "d"), 1:num_obs)
# Supergroup <- sprintf(paste0("supergroup%0", nchar(as.character(num_super_groups)), "d"), 1:num_super_groups)
# 
# annot_df <- data.frame(Group, Supergroup)
# annot_df <- annot_df %>% arrange(Supergroup)

# generate fully synthetic data
get_group_data <- function(supergroup) {
  data_gen <- madsim(mdata = NULL, n = num_vars, ratio = 0, fparams, dparams, sdn, rseed)
  data_gen$xdata %>% 
    as_tibble() %>% 
    mutate(Variable = sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), 1:nrow(.)))%>%
    pivot_longer(c(everything(), -Variable), names_to = observation, values_to = measurement) %>%
    mutate(Group = case_when(
      startsWith(Observation, "cont") ~ "control",
      startsWith(Observation, "test") ~ "treatment")) %>%
    mutate(Supergroup = paste0("supergroup", supergroup)) %>%
    select(Variable, Group, Supergroup, Measurement)
}

Observation <- rep(sprintf(paste0("obs%0", nchar(as.character(num_obs)), "d"), 1:(num_obs*num_super_groups)), num_vars)

data <- do.call(rbind, lapply(seq(num_super_groups), FUN = function(x) {get_group_data(x)})) %>%
  arrange(Variable) %>%
  mutate(Observation = Observation) %>%
  select(Observation, Variable, Group, Supergroup, Measurement)

write.table(data, "c06_super_group(2_control)/c06_super_group(2_control).tsv", sep = "\t", row.names = FALSE)





