library(Hmsc)
library(tools)

args = commandArgs(trailingOnly=TRUE)

print("starting model:")
print(args[1])
print(paste("start time is", Sys.time()))
model2samp <- readRDS(args[1])
thin = as.numeric(args[2])
samples = as.numeric(args[3])
nChains = as.numeric(args[4])
nP = as.numeric(args[5])

print(model2samp)
print(paste("thin =", thin))
print(paste("samples =", samples))
print(paste("nChains =", nChains))
print(paste("nP =", nP))

modelSampled = sampleMcmc(model2samp,
                     samples = samples,
                     thin = thin,
                     transient = ceiling(0.5*samples*thin),
                     nChains = nChains,
                     nParallel = nP,
		     #verbose = 500*thin ## doesn't work?
                     )


sampledFileName=paste0(file_path_sans_ext(args[1]),"_sampled.rds")
save(modelSampled, file=sampledFileName)
print(sampledFileName)
print(paste("Finish time is", Sys.time()))

