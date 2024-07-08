library(Hmsc)
print("starting model:")
print("m_hurdle_aba")
print(paste("start time is", Sys.time()))
load("m_hurdle_abu.rda")
thin = 20
samples = 1000
nChains = 4
nP = 2
m_hurdle_abu = sampleMcmc(m_hurdle_abu,
                       samples = samples, 
                       thin=thin, 
                       transient = ceiling(0.5*samples*thin), 
                       nChains = nChains, 
                       nParallel = nP
                      )
save(m_hurdle_abu, file="m_hurdle_abu_sampled.rda")
print(paste("finish time is", Sys.time()))

