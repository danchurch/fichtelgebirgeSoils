library(Hmsc)
load("m_spat_noEnv_01percent_sampled.rda")
partition = createPartition(m_spat_noEnv, nfolds = 2, column = "sample")
preds = computePredictedValues(m_spat_noEnv, partition=partition, nParallel = 4)
MF = evaluateModelFit(hM=m, predY=preds)
save(preds, file="predsSpat_noEnv.rda")
save(MF, file="modelFitSpat_noEnv.rda")

