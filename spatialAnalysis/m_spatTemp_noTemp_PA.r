library(Hmsc)
print("starting model:")
print("m_spatTemp_noTemp_PA")
print(paste("start time is", Sys.time()))
load("m_spatTemp_noTemp_PA.rda")
thin = 20
samples = 1000
nChains = 8
nP = 2
m_spatTemp_noTemp_PA = sampleMcmc(m_spatTemp_noTemp_PA,
                     samples = samples,
                     thin=thin,
                     transient = ceiling(0.5*samples*thin),
                     nChains = nChains,
                     nParallel = nP
                     )
saveRDS(m_spatTemp_noTemp_PA, file="m_spatTemp_noTemp_PA_sampled.rds")
print(paste("finish time is", Sys.time()))

