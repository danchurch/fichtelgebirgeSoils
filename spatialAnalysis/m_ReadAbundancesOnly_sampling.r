library(Hmsc)
print("starting model:")
print("m_ReadAbundancesOnly")
print(paste("start time is", Sys.time()))
load("m_ReadAbundancesOnly.rda")
thin = 20
samples = 1000
nChains = 4
nP = 2
#m_ReadAbundancesOnly = sampleMcmc(m_ReadAbundancesOnly, 
m_ReadAbundancesOnly2 = sampleMcmc(m_ReadAbundancesOnly, 
                     samples = samples, 
                     thin=thin, 
                     transient = ceiling(0.5*samples*thin), 
                     nChains = nChains, 
                     nParallel = nP
                     )
#save(m_ReadAbundancesOnly, file="m_ReadAbundancesOnly_sampled.rda")
save(m_ReadAbundancesOnly2, file="m_ReadAbundancesOnly_sampled2.rda")
print(paste("finish time is", Sys.time()))

