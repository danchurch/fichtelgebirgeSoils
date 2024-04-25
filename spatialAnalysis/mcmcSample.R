library(Hmsc)
thin = 1
samples = 1000
nChains = 4
setwd("/media/vol1/daniel/sulariArne/soilAnalysis/fichtelgebirgeSoils/spatialAnalysis")
print(paste("start time is", Sys.time()))
load("firstHMSCmodelCarbon4d.rds")
m = sampleMcmc(m, samples = samples, thin=thin, adaptNf=ceiling(0.4*samples*thin), transient = ceiling(0.5*samples*thin), nChains = nChains, nParallel = 4,verbose=1)
save(m, file="firstHMSCmodelCarbon4d_sampled.rds")
print(paste("finish time is", Sys.time()))
 
