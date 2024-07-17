library(Hmsc)
modelfile = commandArgs(trailingOnly=TRUE)[1]
print(paste("starting",modelfile))
m = readRDS(modelfile)
partition = createPartition(m, nfolds = 2, column = "sample")
preds = computePredictedValues(m, partition=partition, nParallel = 2)
MF = evaluateModelFit(hM=m, predY=preds)
saveRDS(preds, file=sub("_sampled.rds", "_crossValPreds.rds",modelfile))
saveRDS(MF, file=sub("_sampled.rds", "_crossValModelFit.rds",modelfile))
print(paste("finish time is", Sys.time()))

