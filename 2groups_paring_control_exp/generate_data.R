library(madsim)
library(dplyr)
library(tidyr)

# set parameters settings

supergroup <- "Supergroup"
group      <- "Group"
observation<- "Observation"
variable   <- "Variable" 
measurement<- "Measurement"


num_controls   <- 7
num_treatments <- 7
num_obs        <- num_controls + num_treatments
num_vars       <- 1000

vars           <- as_tibble(rep(variable, num_vars)) %>% mutate(num=(1:num_vars))


var_name <- tibble(variable = sprintf(paste0("variable%0", nchar(as.character(num_vars)), "d"), 1:num_vars)) %>% rename()
colnames(var_name) <- variable

obs_name <- tibble(observation = sprintf(paste0("observation%0", nchar(as.character(num_obs)), "d"), 1:num_obs)) %>% rename()
colnames(obs_name) <- observation

fparams <- data.frame(m1 = num_controls, m2 = num_treatments, shape2 = 4, lb = 4, ub = 14,pde=0.02,sym=0.5);
dparams <- data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn <- 0.4
# rseed <- 50

# generate fully synthetic data
data_gen1 <- madsim(mdata = NULL, n = num_vars, ratio = 0, fparams, dparams, sdn, 42)
data1 <- as_tibble(data_gen1$xdata) %>% mutate


data_gen2 <- madsim(mdata = NULL, n = num_vars, ratio = 0, fparams, dparams, sdn, 142)
data2 <- data_gen2$xdata

colnames1 <- colnames(data1)
colnames2 <- colnames(data2)

data_long <- pivot_longer(data1, everything(), names_to = observation, values_to = measurement)





