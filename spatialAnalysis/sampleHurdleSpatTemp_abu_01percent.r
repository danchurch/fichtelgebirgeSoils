library(Hmsc)
print(paste("start time is", Sys.time()))
load("m_spatTempSmall_Abu_01percent.rda")
thin = 20
samples = 1000
nChains = 4
nP = 4
m_spatTempSmall_Abu = sampleMcmc(m_spatTempSmall_Abu,
                     samples = samples,
                     thin=thin,
                     transient = ceiling(0.5*samples*thin),
                     nChains = nChains,
                     nParallel = nP
                     )
save(m_spatTempSmall_Abu, file="m_spatTempSmall_Abu_01percent_sampled.rda")
print(paste("finish time is", Sys.time()))
