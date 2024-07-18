library(Hmsc)
print("starting model:")
print("m_environmentalOnly")
print(paste("start time is", Sys.time()))
load("m_environmentalOnly.rda")
thin = 20
samples = 1000
nChains = 4
nP = 2
#m_environmentalOnly = sampleMcmc(m_environmentalOnly, 
m_environmentalOnly2 = sampleMcmc(m_environmentalOnly, 
                     samples = samples, 
                     thin=thin, 
                     transient = ceiling(0.5*samples*thin), 
                     nChains = nChains, 
                     nParallel = nP
                     )
#save(m_environmentalOnly, file="m_environmentalOnly_sampled.rda")
save(m_environmentalOnly2, file="m_environmentalOnly_sampled2.rda")
print(paste("finish time is", Sys.time()))

