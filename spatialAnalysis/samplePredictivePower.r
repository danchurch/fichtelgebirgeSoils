library(Hmsc)

print(paste("start time is", Sys.time()))
load("m_SpTmpSmall_sampled_thin150.rda")
m = m_SpTmpSmall; rm(m_SpTmpSmall)

partition=createPartition(hM=m, nfolds=2)
predY.CV = computePredictedValues(m, expected=TRUE, partition=partition, nChains = 1, nParallel = 1)

MF.CV = evaluateModelFit(hM=m, predY=predY.CV)

save(list(predY.CV,MF.CV), file="m_SpTmpSmall_sampled_modelFit_thin150.rda")

postBeta = getPostEstimate(m, parName = "Beta")

png("postBeta_support_thin150.png")
plotBeta(m, post = postBeta, param = "Support", supportLevel = 0.95)
dev.off()

print(paste("finish time is", Sys.time()))

