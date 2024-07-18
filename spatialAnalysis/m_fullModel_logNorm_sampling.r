library(Hmsc)
print("starting model:")
print("m_fullModel_logNorm")
print(paste("start time is", Sys.time()))
load("m_fullModel_logNorm.rda")
thin = 20
samples = 1000
nChains = 4
nP = 2
#m_fullModel_logNorm = sampleMcmc(m_fullModel_logNorm,
m_fullModel_logNorm2 = sampleMcmc(m_fullModel_logNorm,
                     samples = samples,
                     thin=thin,
                     transient = ceiling(0.5*samples*thin),
                     nChains = nChains,
                     nParallel = nP
                     )
#save(m_fullModel_logNorm, file="m_fullModel_logNorm_sampled.rda")
save(m_fullModel_logNorm2, file="m_fullModel_logNorm_sampled2.rda")
print(paste("finish time is", Sys.time()))

