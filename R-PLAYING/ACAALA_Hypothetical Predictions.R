# spectra import

setwd("~/Desktop/R-PLAYING")    #Replace this by the directory where you stored the files
SampleInfo<-read.csv("SampleInfo.csv", sep=",", dec=".", header=TRUE)    #Load CSV file containing SampleInfo data
RawNIRData<-read.csv("RawNIRData.csv",sep=",",dec=".",header=TRUE)   #Load CSV file containing RawNIRData
ClassRef<-read.csv("ClassRef.csv",sep=",",dec=".",header=TRUE) #Load CSV file containing Class Reference

# loadpackages
install.packages("mdatools")
library(mdatools)
library(e1071)

AllSampleData<- as.list(c(SampleInfo,RawNIRData))
SamplesData<-data.frame(SampleInfo, NIR = I(RawNIRData[2:ncol(RawNIRData)]))
Wavelength<-RawNIRData[,1]
#SpectraWavelength<-RawNIRData$i..Wavelenght..nm.
NIR <- data.frame(I(RawNIRData[2:ncol(RawNIRData)]))
AllmSampleData<- as.list(c(SampleInfo,NIR))

# Convert the spectra to data frame and split them to each set of 12 categories

RawSpectra<-data.frame(SamplesData$NIR)

RawSpectra<-t(RawSpectra)

S1090ACAA<-RawSpectra[1:100,]
S1090ACLA<-RawSpectra[101:200,]
S1090AALA<-RawSpectra[201:300,]
S5050ACAA<-RawSpectra[301:400,]
S5050ACLA<-RawSpectra[401:500,]
S5050AALA<-RawSpectra[501:600,]
S9010ACAA<-RawSpectra[601:700,]
S9010ACLA<-RawSpectra[701:800,]
S9010AALA<-RawSpectra[801:900,]
S100AC<-RawSpectra[901:1000,]
S100AA<-RawSpectra[1001:1100,]
S100LA<-RawSpectra[1101:1200,]

# Plot the raw spectra
# par(mfrow = c(2, 2))

#layout(matrix(c(1,2,3), 3, 1))
par(mfrow=c(1,1))

matplot(Wavelength,t(S1090ACAA), type = "l",lty=1,col=1,xlab = "wavelength (nm)", ylab = "Absorbance (au)", main = "S1090ACAA") 
matplot(Wavelength,t(S1090ACLA), type = "l",lty=1,col=2,xlab = "wavelength (nm)", ylab = "Absorbance (au)", main = "S1090ACLA") 
matplot(Wavelength,t(S1090AALA), type = "l",lty=1,col=3,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S1090AALA") 
matplot(Wavelength,t(S5050ACAA), type = "l",lty=1,col=4,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S5050ACAA") 
matplot(Wavelength,t(S5050ACLA), type = "l",lty=1,col=5,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S5050ACLA") 
matplot(Wavelength,t(S5050AALA), type = "l",lty=1,col=6,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S5050AALA") 
matplot(Wavelength,t(S9010ACAA), type = "l",lty=1,col=7,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S9010ACAA") 
matplot(Wavelength,t(S9010ACLA), type = "l",lty=1,col=8,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S9010ACLA") 
matplot(Wavelength,t(S9010AALA), type = "l",lty=1,col=9,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S9010AALA") 
matplot(Wavelength,t(S100AC), type = "l",lty=1,col=10,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S100AC") 
matplot(Wavelength,t(S100AA), type = "l",lty=1,col=11,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S100AA") 
matplot(Wavelength,t(S100LA), type = "l",lty=1,col=12,xlab = "wavelength (nm)", ylab = "Absorbance (au)",main = "S100LA") 

# Transform the data for a combined plot


#SPECTRAM<-cbind.data.frame(ClassRef,RawSpectra)

par(mfrow=c(1,1))

SPECTRAraws<-rbind.data.frame(Wavelength,RawSpectra)

SPECTRAraw<-data.frame(t(SPECTRAraws))

SPECTRAraw1<-SPECTRAraw[ ,2:1201]


# Plot all spectra together

matplot(SPECTRAraw$X1,SPECTRAraw1,type="l",col = rep(1:12, each = 100), xlab = "Wavelength (nm)" , ylab = "Absorbance (au)")

legend("topleft",legend = paste("Group",1:12),col=1:12, cex=0.5,pch=19,pt.cex = 1)





# apply SNV data pretreatment the spectra

snvspectra = prep.snv(RawSpectra)

# Group or classify the spectra

snvS1090ACAA<-snvspectra[1:100,]
snvS1090ACLA<-snvspectra[101:200,]
snvS1090AALA<-snvspectra[201:300,]
snvS5050ACAA<-snvspectra[301:400,]
snvS5050ACLA<-snvspectra[401:500,]
snvS5050AALA<-snvspectra[501:600,]
snvS9010ACAA<-snvspectra[601:700,]
snvS9010ACLA<-snvspectra[701:800,]
snvS9010AALA<-snvspectra[801:900,]
snvS100AC<-snvspectra[901:1000,]
snvS100AA<-snvspectra[1001:1100,]
snvS100LA<-snvspectra[1101:1200,]

# par(mfrow = c(2, 2))

# Plot the SNV transformed data

matplot(Wavelength,t(snvS1090ACAA), type = "l",lty=1,col=1,xlab = "wavelength (nm)", ylab = "Transformed Absorbance",main = "snvS1090ACAA" )
matplot(Wavelength,t(snvS1090ACLA), type = "l",lty=1,col=2,xlab = "wavelength (nm)", ylab = "Transformed Absorbance",main = "snvS1090ACLA")
matplot(Wavelength,t(snvS1090AALA), type = "l",lty=1,col=3,xlab = "wavelength (nm)", ylab = "Transformed Absorbance",main = "snvS1090AALA") 
matplot(Wavelength,t(snvS5050ACAA), type = "l",lty=1,col=4,xlab = "wavelength (nm)", ylab = "Transformed Absorbance",main = "snvS5050ACAA") 
matplot(Wavelength,t(snvS5050ACLA), type = "l",lty=1,col=5, xlab = "wavelength (nm)", ylab = "Transformed Absorbance",main = "snvS5050ACLA")
matplot(Wavelength,t(snvS5050AALA), type = "l",lty=1,col=6,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "snvS5050AALA")
matplot(Wavelength,t(snvS9010ACAA), type = "l",lty=1,col=7,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "snvS9010ACAA") 
matplot(Wavelength,t(snvS9010ACLA), type = "l",lty=1,col=8,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "snvS9010ACLA") 
matplot(Wavelength,t(snvS9010AALA), type = "l",lty=1,col=9,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "snvS9010AALA") 
matplot(Wavelength,t(snvS100AC), type = "l",lty=1,col=10,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "snvS100AC") 
matplot(Wavelength,t(snvS100AA), type = "l",lty=1,col=11,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "snvS100AA") 
matplot(Wavelength,t(snvS100LA), type = "l",lty=1,col=12,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "snvS100LA") 


# Transform the data for a combined plot



SPECTRAsnvs<-rbind.data.frame(Wavelength,snvspectra)

SPECTRAsnv<-data.frame(t(SPECTRAsnvs))

SPECTRAsnv1<-SPECTRAsnv[ ,2:1201]

matplot(SPECTRAsnv$X1,SPECTRAsnv1,type="l",col = rep(1:12, each = 100), xlab = "Wavelength (nm)" , ylab = "Transformed Absorbance")

legend("topleft",legend = paste("Group",1:12),col=1:12, cex=0.5,pch=19,pt.cex = 1)


# Apply SG filter for smoothing and take a second derivative

SGspectra = prep.savgol(snvspectra, width = 17, porder = 2, dorder = 2)

# Group or classify the spectra

SGFsnvS1090ACAA<-SGspectra[1:100,]
SGFsnvS1090ACLA<-SGspectra[101:200,]
SGFsnvS1090AALA<-SGspectra[201:300,]
SGFsnvS5050ACAA<-SGspectra[301:400,]
SGFsnvS5050ACLA<-SGspectra[401:500,]
SGFsnvS5050AALA<-SGspectra[501:600,]
SGFsnvS9010ACAA<-SGspectra[601:700,]
SGFsnvS9010ACLA<-SGspectra[701:800,]
SGFsnvS9010AALA<-SGspectra[801:900,]
SGFsnvS100AC<-SGspectra[901:1000,]
SGFsnvS100AA<-SGspectra[1001:1100,]
SGFsnvS100LA<-SGspectra[1101:1200,]

# par(mfrow = c(2, 2))

# layout(matrix(c(1,2), 2, 1))

matplot(Wavelength,t(SGFsnvS1090ACAA), type = "l",lty=1,col=1,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS1090ACAA")
matplot(Wavelength,t(SGFsnvS1090ACLA), type = "l",lty=1,col=2,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS1090ACLA") 
matplot(Wavelength,t(SGFsnvS1090AALA), type = "l",lty=1,col=3,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS1090AALA")
matplot(Wavelength,t(SGFsnvS5050ACAA), type = "l",lty=1,col=4,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS5050ACAA")
matplot(Wavelength,t(SGFsnvS5050ACLA), type = "l",lty=1,col=5,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS5050ACLA")
matplot(Wavelength,t(SGFsnvS5050AALA), type = "l",lty=1,col=6,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS5050AALA")
matplot(Wavelength,t(SGFsnvS9010ACAA), type = "l",lty=1,col=7,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS9010ACAA")
matplot(Wavelength,t(SGFsnvS9010ACLA), type = "l",lty=1,col=8,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS9010ACLA")
matplot(Wavelength,t(SGFsnvS9010AALA), type = "l",lty=1,col=9,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS9010AALA")
matplot(Wavelength,t(SGFsnvS100AC), type = "l",lty=1,col=10,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS100AC")
matplot(Wavelength,t(SGFsnvS100AA), type = "l",lty=1,col=11,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS100AA")
matplot(Wavelength,t(SGFsnvS100LA), type = "l",lty=1,col=12,xlab = "wavelength (nm)", ylab = "Transformed Absorbance (au)",main = "SGFsnvS100LA")

# Transform the data for a combined plot


SPECTRAsgs<-rbind.data.frame(Wavelength,SGspectra)

SPECTRAsg<-data.frame(t(SPECTRAsgs))

SPECTRAsg1<-SPECTRAsg[ ,2:1201]

# Plot all spectra together

matplot(SPECTRAsg$X1,SPECTRAsg1,type="l",col = rep(1:12, each = 100), xlab = "Wavelength (nm)" , ylab = "Transformed Absorbance")

legend("bottomleft",legend = paste("Group",1:12),col=1:12, cex=0.5,pch=19,pt.cex = 1)



# PCA Analysis (1) load the data matrix and (2) split it into two subsets

#layout(matrix(c(1,1), 1, 1))

ispect = seq(1, 1200, 4)

calibset = SGspectra[-ispect, ]

testset = SGspectra[ispect, ]

Calibpca_model = pca(calibset, 10, scale = TRUE, info = "ACAALA PCA model")

Calibpca_model= selectCompNum(Calibpca_model, 5)

# Access the Loadings and the Scores

Calibpca_model$loadings[1:4, 1:4]

Calibpca_model$res$cal$scores[1:4, 1:4]

Predictnmodel = predict(Calibpca_model, testset)

print(Predictnmodel)

# PCA model with test set validation (we will use testset as test data)

Calibpca_model = pca(calibset,7,scale = TRUE, x.test=testset, info = "PCA model")

Calibpca_model = selectCompNum(Calibpca_model, 5)

# Info for Both Result Objects


print(Calibpca_model$res$cal)
print(Calibpca_model$res$test)


# Some Statistics for Evaluation of a Model Performance

summary(Calibpca_model)

var = data.frame(
  cal = Calibpca_model$res$cal$expvar,
  test = Calibpca_model$res$test$expvar)
show(round(var, 1))

# scores and loadings plots for PC1 vs PC2

mdaplot(Calibpca_model$res$cal$scores, type = "p",show.labels = FALSE, show.lines = c(0, 0))


mdaplot(Calibpca_model$loadings, type = "p", show.labels = TRUE, show.lines = c(0, 0))

#########################################################

#PLS - REGRESSION

##layout(matrix(c(1,1), 1, 1))

# Split the spectra to calibration set to build a model and test set for validation of the model

ispectra = seq(4, 1200, 4)


colnames(SPECTRAsgs) <- unlist(SPECTRAsgs[1,])
SPECTRAsgs <- SPECTRAsgs[-1,]

SPECTRAsg2<-cbind.data.frame(ClassRef,SPECTRAsgs)

Calibpca_modely= SPECTRAsg2[-ispectra, 2, drop = FALSE]
Calibpca_modelx = SPECTRAsg2[-ispectra, -(c(1,2))]

testset_modelx= SPECTRAsg2[ispectra, -(c(1,2))]
testset_modely = SPECTRAsg2[ispectra, 2, drop = FALSE]

# Develop PLS prediction Model

PLS_Prediction = pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, info = "Conc. prediction model")
PLS_Prediction = selectCompNum(PLS_Prediction, 3)
print(PLS_Prediction)

PLS_Prediction$coeffs$values

# par(mfrow = c(1, 1))

# Plot the PLS prediction model, compare the number of components

plotRegcoeffs(PLS_Prediction)
plotRegcoeffs(PLS_Prediction, ncomp = 2)
#plot(PLS_Prediction$coeffs, ncomp = 3, type = "b", show.labels = FALSE)
#plot(PLS_Prediction$coeffs, ncomp = 2)

#show(PLS_Prediction$coeffs$values[, 3, 1])

#summary(PLS_Prediction$coeffs)

show(getRegcoeffs(PLS_Prediction, ncomp = 3))

print(PLS_Prediction$res$cal)

print(PLS_Prediction$res$cal$xdecomp)

#PLS - Regression prediction of the testset 

Predict_testset = predict(PLS_Prediction, testset_modelx, testset_modely)
print(Predict_testset)
print(Predict_testset$rmse)

# Number of Components Selection Criteria (MIN,WOLD)

PLS_Prediction1 = pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, ncomp.selcrit = "min")
show(PLS_Prediction1$ncomp.selected)

PLS_Prediction2 = pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, ncomp.selcrit = "wold")
show(PLS_Prediction2$ncomp.selected)

# par(mfrow = c(1, 2))

# Plot the PLS prediction RMSE of validation for testset comparing the selection criteria above

plotRMSE(PLS_Prediction1)

plotRMSE(PLS_Prediction2)

# par(mfrow = c(1, 2))

# Plot the PLS prediction for 7 and 1 components respectively

plotPredictions(PLS_Prediction1)
plotPredictions(PLS_Prediction1, ncomp = 1)

# par(mfrow = c(2, 2))

# Plot the PLS prediction outcomes

plotPredictions(PLS_Prediction1$res$cal)
plotPredictions(PLS_Prediction1$res$cal, ncomp = 2)
plotPredictions(PLS_Prediction1$res$cal, show.stat = TRUE)
plotPredictions(PLS_Prediction1$res$cal, ncomp = 2, show.stat = TRUE)

# Plot the PLS prediction outcomes based on the component selections criteria

plot(PLS_Prediction1)

plot(PLS_Prediction2)


########################################################################

#SIMCA - CLASSIFICATION

ispectraSIMCA = seq(4, 1200, 4)


Calibpca_modelSimcax =SPECTRAsg2[ispectraSIMCA, 3:230]
SPECTRAM201<-AllmSampleData$SpeciesID

Calibpca_modelSimcay = SPECTRAsg2[ispectraSIMCA, 1]

testset_modelSimcax = SPECTRAsg2[-ispectraSIMCA, 3:230]
testset_modelSimcay = SPECTRAsg2[-ispectraSIMCA, 1]


s.1090ACAA = SPECTRAsg2[1:100,3:230 ]
s.1090ACLA = SPECTRAsg2[101:200,3:230 ]
s.1090AALA = SPECTRAsg2[201:300,3:230 ]
s.5050ACAA = SPECTRAsg2[301:400,3:230 ]
s.5050ACLA = SPECTRAsg2[401:500,3:230 ]
s.5050AALA = SPECTRAsg2[501:600,3:230 ]
s.9010ACAA = SPECTRAsg2[601:700,3:230 ]
s.9010ACLA = SPECTRAsg2[701:800,3:230 ]
s.9010AALA = SPECTRAsg2[801:900,3:230 ]
s.100AC = SPECTRAsg2[901:1000,3:230 ]
s.100AA = SPECTRAsg2[1001:1100,3:230 ]
s.100LA = SPECTRAsg2[1101:1200,3:230 ]


Simca_pca_s.1090ACAA = simca(s.1090ACAA, "1090ACAA",ncomp = 3)
summary(Simca_pca_s.1090ACAA)

plot(Simca_pca_s.1090ACAA)

Simca_pca_s.1090ACAA= simca(s.1090ACAA, "1090ACAA", ncomp = 3, cv = 1)

#par(mfrow = c(2, 2))

plotSensitivity(Simca_pca_s.1090ACAA)
plotMisclassified(Simca_pca_s.1090ACAA)
plotPredictions(Simca_pca_s.1090ACAA$res$cal, main = "Predictions (cal)")
plotPredictions(Simca_pca_s.1090ACAA$res$cv, main = "Predictions (cv)")

summary(Simca_pca_s.1090ACAA)

Predict_testsetSimca = predict(Simca_pca_s.1090ACAA, testset_modelSimcax, testset_modelSimcay)
summary(Predict_testsetSimca)



X.1090ACAA = SPECTRAsg2[1:100,3:230]
m.1090ACAA = simca(s.1090ACAA, "1090ACAA", 12, alpha = 0.01)
m.1090ACAA = selectCompNum(m.1090ACAA, 1)

X.1090ACLA = SPECTRAsg2[101:200,3:230 ]
m.1090ACLA = simca(s.1090ACLA, "1090ACLA", 12, alpha = 0.01)
m.1090ACLA = selectCompNum(m.1090ACLA, 2)

X.1090AALA = SPECTRAsg2[201:300,3:230 ]
m.1090AALA = simca(s.1090AALA, "1090AALA", 12)
m.1090AALA = selectCompNum(m.1090AALA, 3)

X.5050ACAA = SPECTRAsg2[301:400,3:230 ]
m.5050ACAA = simca(s.5050ACAA, "5050ACAA", 12)
m.5050ACAA = selectCompNum(m.5050ACAA, 4)

X.5050ACLA = SPECTRAsg2[401:500,3:230 ]
m.5050ACLA = simca(s.5050ACLA, "5050ACLA", 12)
m.5050ACLA = selectCompNum(m.5050ACLA, 5)

X.5050AALA = SPECTRAsg2[501:600,3:230 ]
m.5050AALA = simca(s.5050AALA, "5050AALA", 12)
m.5050AALA = selectCompNum(m.5050AALA, 6)

X.9010ACAA = SPECTRAsg2[601:700,3:230 ]
m.9010ACAA = simca(s.9010ACAA, "9010ACAA", 12)
m.9010ACAA = selectCompNum(m.9010ACAA, 7)

X.9010ACLA = SPECTRAsg2[701:800,3:230 ]
m.9010ACLA = simca(s.9010ACLA, "9010ACLA", 12)
m.9010ACLA = selectCompNum(m.9010ACLA, 8)

X.9010AALA = SPECTRAsg2[801:900,3:230 ]
m.9010AALA = simca(s.9010AALA, "9010AALA", 12)
m.9010AALA = selectCompNum(m.9010AALA, 9)

X.100AC = SPECTRAsg2[901:1000,3:230 ]
m.100AC = simca(s.100AC, "100AC", 12)
m.100AC = selectCompNum(m.100AC, 10)

X.100AA = SPECTRAsg2[1001:1100,3:230 ]
m.100AA = simca(s.100AA, "100AA", 12)
m.100AA = selectCompNum(m.100AA, 11)

X.100LA = SPECTRAsg2[1101:1200,3:230 ]
m.100LA = simca(s.100LA, "100LA", 12)
m.100LA = selectCompNum(m.100LA, 12)

Simca_m.All = simcam(list(m.1090ACAA, m.1090ACLA, m.1090AALA,m.5050ACAA,m.5050ACLA,
                          m.5050AALA,m.9010ACAA,m.9010ACLA,m.9010AALA,m.100AC,m.100AA,
                          m.100LA))
summary(Simca_m.All)

#par(mfrow = c(1, 1))
Simca_m.All_test = predict(Simca_m.All, testset_modelSimcax, testset_modelSimcay)
plotPredictions(Simca_m.All_test)

show(Simca_m.All_test$c.pred[20:30, 1, ])

show(getConfusionMatrix(Simca_m.All_test))

#Other Plots of interest

plotModelDistance(Simca_m.All, 1)
plotModelDistance(Simca_m.All, 2)

plotDiscriminationPower(Simca_m.All, c(1, 3), show.labels = FALSE)
plotDiscriminationPower(Simca_m.All, c(2, 3), show.labels = FALSE)


#par(mfrow = c(1, 2))

plotCooman(Simca_m.All, c(1, 3), show.labels = FALSE)
plotCooman(Simca_m.All, c(7, 3), show.labels = FALSE)

########################################################################

#SVM - REGRESSION

library(e1071)


ispectraSVM  <- sample(1:nrow(SPECTRAsg2),as.integer(0.7*nrow(SPECTRAsg2))) ##meaning of 0.7
Calibpca_modelsvmy = SPECTRAsg2[ispectraSVM, 2]
testset_modelsvmy= SPECTRAsg2[-ispectraSVM, 2]

Calibpca_modelsvmx<- SPECTRAsg2[ispectraSVM,3:230]
testset_modelsvmx <- SPECTRAsg2[-ispectraSVM,3:230 ]
testset_modelsvm2x <- SPECTRAsg2[-ispectraSVM,2:230 ]



SVM_R_AC <- svm(Calibpca_modelsvmy~.,Calibpca_modelsvmx)


predict_Molarratio <- predict(SVM_R_AC, testset_modelsvmx)

summary(predict_Molarratio)

########################################################################

#SVM - CLASSIFICATION


Calibpca_modelsvmcy = SPECTRAsg2[ispectraSVM, 1]
testset_modelsvmcy= SPECTRAsg2[-ispectraSVM, 1]

SVM_C_AC <- svm(as.factor(Calibpca_modelsvmcy)~.,data = Calibpca_modelsvmx, type="C-classification", kernal="radial",gamma=0.1, cost=10)

predict_Class <- predict(SVM_C_AC, testset_modelsvmx)


summary(predict_Class)



########################################################################


##** colnames(SPECTRAMs) <- unlist(SPECTRAMs[1,])
##** SPECTRAMs <- SPECTRAMs[-1,]

##** SPECTRAM2<-cbind.data.frame(ClassRef,SPECTRAMs)


########################################################################

library(e1071)


ispectraSVM  <- sample(1:nrow(SGspectra),as.integer(0.7*nrow(SGspectra))) ##meaning of 0.7
Calibpca_modelsvmy = ClassRef[ispectraSVM, 2]
testset_modelsvmy= ClassRef[-ispectraSVM, 2]

Calibpca_modelsvmx<- SGspectra[ispectraSVM, ]
testset_modelsvmx <- SGspectra[-ispectraSVM, ]

