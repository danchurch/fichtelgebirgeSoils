library(Hmsc)
load("m_hurdleSpatial.rda")

thin = 5
samples = 1000
nChains = 2
nP = 8
m_hurdleSpatial = sampleMcmc(m_hurdleSpatial, 
                     samples = samples, 
                     thin=thin, 
                     transient = ceiling(0.5*samples*thin), 
                     nChains = nChains, 
                     nParallel = nP,
                     verbose=1)

save(m_hurdleSpatial, file="m_hurdleSpatial_sampled.rda")
