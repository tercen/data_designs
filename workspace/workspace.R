gen_design <- function(n_participant, n_stimulus, n_levels){
  participants <- rep(1:n_participant, each = n_stimulus)
  #stims <- rep(1:n_stimulus, times = n_participant)
  x <- c()
  stims <- as.vector(sapply(seq(1, n_participant), function(x) sample(seq(1,n_stimulus), size = n_stimulus)))
  for(i in 1:n_participant){
    x <- append(x, seq(0,(n_levels-1)))
    #x <- append(x, sapply(seq(1,n_stimulus), function(x) sample(seq(1,n_levels), size = n_levels)))
  }
  expdesign <- data.frame(participant = participants, stimulus = stims, x = x)
  return(expdesign)
}

sp <- list(n_participant = 30, n_stimulus = 20, n_levels =2) # data with 30 participants each seeing 20 stimuli (which will not be modelled in this example) with 2 levels (10 obs per participant per cell)
exp1 <- gen_design(n_participant = sp$n_participant, n_stimulus = sp$n_stimulus, n_levels = sp$n_levels)