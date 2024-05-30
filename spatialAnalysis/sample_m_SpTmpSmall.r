library(Hmsc)
print(paste("start time is", Sys.time()))
load("m_SpTmpSmall.rda")
thin = 150 ## modified from 5 and 50 previously
samples = 1000
nChains = 2
nP = 2
m_SpTmpSmall = sampleMcmc(m_SpTmpSmall,
                     samples = samples,
                     thin = thin,
                     transient = ceiling(0.5*samples*thin),
                     nChains = nChains,
                     nParallel = nP,
                     verbose=1)
save(m_SpTmpSmall, file="m_SpTmpSmall_sampled_thin150.rda")
print(paste("finish time is", Sys.time()))

