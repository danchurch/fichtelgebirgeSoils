library(Hmsc)
load("m_SpTmpSmall_sampled_thin50.rda")
#load("m_SpTmpSmall_sampled_thin150.rda")
m = m_SpTmpSmall; rm(m_SpTmpSmall)
mpost = convertToCodaObject(m)

es.beta = effectiveSize(mpost$Beta)
ge.beta = gelman.diag(mpost$Beta,multivariate=FALSE)$psrf
png(file="essBetaSpTmpSmall_thin150.png")
par(mfrow=c(1,2))
hist(es.beta, main="effective sample size for beta")
hist(ge.beta, main="potential scale reduction factor for beta)")
dev.off()

es.gamma = effectiveSize(mpost$Gamma)
ge.gamma = gelman.diag(mpost$Gamma,multivariate=FALSE)$psrf
png(file="essGammaSpTmpSmall_thin150.png")
par(mfrow=c(1,2))
hist(es.gamma, main="effective sample size for gamma")
hist(ge.gamma, main="potential scale reduction factor for gamma)")
dev.off()

es.V = effectiveSize(mpost$V)
ge.V = gelman.diag(mpost$V,multivariate=FALSE)$psrf
png(file="essV_SpTmpSmall_thin150.png")
par(mfrow=c(1,2))
hist(es.V, main="effective sample size for V")
hist(ge.V, main="potential scale reduction factor for V)")
dev.off()

## omega is too large. take the first thousand species/species interactions
mpost$temp = mpost$Omega[[1]]
for(i in 1:length(mpost$temp)){
  mpost$temp[[i]] = mpost$temp[[i]][,1:1000]
}
es.omega1 = effectiveSize(mpost$temp)
ge.omega1 = gelman.diag(mpost$temp,multivariate=FALSE)$psrf
png(file="essOmega1_SpTmpSmall_thin150.png")
par(mfrow=c(1,2))
hist(es.omega1, main="ess(omega)")
hist(ge.omega1, main="psrf(omega)")
dev.off()

mixing = list(es.beta=es.beta, ge.beta=ge.beta,
              es.gamma=es.gamma, ge.gamma=ge.gamma,
              es.V=es.V, ge.V=ge.V,
              es.omega=es.omega1, ge.omega=ge.omega1)
#save(mixing,file="m_SpTmpSmall_sampled_thin150_mixingStats.rda")
save(mixing,file="m_SpTmpSmall_sampled_thin50_mixingStats.rda")

