library(Hmsc)
print("starting model:")
print("m_spatTemp_ReadAbundancesOnly")
print(paste("start time is", Sys.time()))
load("m_spatTemp_ReadAbundancesOnly.rda")
thin = 20
samples = 1000
nChains = 8
nP = 8
m_spatTemp_ReadAbundancesOnly = sampleMcmc(m_spatTemp_ReadAbundancesOnly,
                     samples = samples,
                     thin=thin,
                     transient = ceiling(0.5*samples*thin),
                     nChains = nChains,
                     nParallel = nP
                     )
saveRDS(m_spatTemp_ReadAbundancesOnly, file="m_spatTemp_ReadAbundancesOnly_sampled.rds")
print(paste("finish time is", Sys.time()))

