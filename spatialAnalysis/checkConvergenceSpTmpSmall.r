library(Hmsc)
load("m_SpTmpSmall_sampled_thin50.rda")
m = m_SpTmpSmall; rm(m_SpTmpSmall)
mpost = convertToCodaObject(m)
es.beta = effectiveSize(mpost$Beta)
ge.beta = gelman.diag(mpost$Beta,multivariate=FALSE)$psrf
png(file="essBetaSpTmpSmall.png")
par(mfrow=c(1,2)) 
hist(es.beta, main="effective sample size for beta") 
hist(ge.beta, main="potential scale reduction factor for beta)")
dev.off()
es.gamma = effectiveSize(mpost$Gamma)
ge.gamma = gelman.diag(mpost$Gamma,multivariate=FALSE)$psrf
png(file="essGammaSpTmpSmall.png")
par(mfrow=c(1,2)) 
hist(es.gamma, main="effective sample size for gamma") 
hist(ge.gamma, main="potential scale reduction factor for gamma)")
dev.off()
es.V = effectiveSize(mpost$V)
ge.V = gelman.diag(mpost$V,multivariate=FALSE)$psrf
png(file="essGammaSpTmpSmall.png")
par(mfrow=c(1,2)) 
hist(es.V, main="effective sample size for V") 
hist(ge.V, main="potential scale reduction factor for V)")
dev.off()
es.omega = effectiveSize(mpost$Omega[[1]])
ge.omega = gelman.diag(mpost$Omega[[1]], multivariate=FALSE)$psrf

png(file="essGammaSpTmpSmall.png")
par(mfrow=c(1,2)) 
hist(effectiveSize(, main="ess(omega)") 
hist(gelman.diag(, main="psrf(omega)")
dev.off()
mixing = list(es.beta=es.beta, ge.beta=ge.beta,
              es.gamma=es.gamma, ge.gamma=ge.gamma,
              es.V=es.V, ge.V=ge.V,
              es.omega=es.omega, ge.omega=ge.omega)
save(mixing,file="m_SpTmpSmall_mixingStats.rda")
