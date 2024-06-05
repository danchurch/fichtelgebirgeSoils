library(Hmsc)
print(paste("start time is", Sys.time()))
load("m_spat_noEnv_01percent.rda")
load("m_spat_PA_01percent.rda")
load("m_spat_Abu_01percent.rda")
thin = 20
samples = 1000
nChains = 4
nP = 4
print("starting null model")
m_spat_noEnv = sampleMcmc(m_spat_noEnv,
                       samples = samples,
                       thin=thin,
                       transient = ceiling(0.5*samples*thin),
                       nChains = nChains,
                       nParallel = nP
                      )
save(m_spat_noEnv, file="m_spat_noEnv_01percent_sampled.rda")
print("finished null model, start PA model")
m_spat_PA = sampleMcmc(m_spat_PA,
                       samples = samples,
                       thin=thin,
                       transient = ceiling(0.5*samples*thin),
                       nChains = nChains,
                       nParallel = nP
                       )
save(m_spat_PA, file="m_spat_PA_01percent.rda_sampled.rda")
print("finished PA model, start abundance model")
m_spat_Abu = sampleMcmc(m_spat_Abu,
                        samples = samples,
                        thin=thin,
                        transient = ceiling(0.5*samples*thin),
                        nChains = nChains,
                        nParallel = nP
                        )
save(m_spat_Abu, file="m_spat_Abu_01percent_sampled.rda")
print(paste("finish time is", Sys.time()))

