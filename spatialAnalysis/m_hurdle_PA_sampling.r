library(Hmsc)
print("starting model:")
print("m_hurdle_PA")
print(paste("start time is", Sys.time()))
load("m_hurdle_PA.rda")
thin = 20
samples = 1000
nChains = 4
nP = 2
m_hurdle_PA = sampleMcmc(m_hurdle_PA,
                      samples = samples, 
                      thin=thin, 
                      transient = ceiling(0.5*samples*thin), 
                      nChains = nChains, 
                      nParallel = nP
                     )
save(m_hurdle_PA, file="m_hurdle_PA_sampled.rda")
print(paste("finish time is", Sys.time()))
