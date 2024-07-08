library(Hmsc)
print("starting model:")
print("m_ReadAbundancesSpatial")
print(paste("start time is", Sys.time()))
load("m_ReadAbundancesSpatial.rda")
thin = 20
samples = 1000
nChains = 4
nP = 2
m_ReadAbundancesSpatial = sampleMcmc(m_ReadAbundancesSpatial, 
                          samples = samples, 
                          thin=thin, 
                          transient = ceiling(0.5*samples*thin), 
                          nChains = nChains, 
                          nParallel = nP
                        )
save(m_ReadAbundancesSpatial, file="m_ReadAbundancesSpatial_sampled.rda")
print(paste("finish time is", Sys.time()))

