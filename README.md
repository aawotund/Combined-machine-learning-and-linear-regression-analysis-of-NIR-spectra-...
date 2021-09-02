# NIR-DATA-ANALYSIS-FOR-DETECTION-OF-SUBSTANDED-AND-FALSIFIED-PHARMACEUTICAL-AND-ILLICIT-DRUGS

*Author: Olatunde Awotunde, MS (PHD in view @ University of Notre Dame) . Email: aawotund@nd.edu;olatundeawotunde1@gmail.com*

This package uses functions developed from the following packages: 'pls, matplot, dplyr, csv, mdatools,stats,graphics,grDevices,methods,utils, plyr, caret,e1071'. 

We thank the creators of these useful packages.

## Goal

+ Develop a database to identify substandard pharmaceutical drugs as well as illicit drugs

+ Develop a user friendly app for every day use of endusers, forensic scientist and law enforcement

## Warning:

The data structure must be in Dataframe format. Use the following command to transform it into a dataframe: as.data.frame().

The column must containing the response variable in `factor` or `character` format for classification.

This package is under development and was made for the specific needs of our laboratory, further efforts towards broader applcation is being developed.

## Main Functions

read.csv() : Import the data

prep.snv() : Applies Standard Normal Variate (SNV) transformation to the rows of data matrix

prep.savgol() : Applies Savytzky-Golay filter to the rows of data matrix

as.list() : converts objects to list

data.frame() : Creates data frames, tightly coupled collections of variables which share many of the properties of matrices and of lists

matplot() : Plot the columns of one matrix against the columns of another

## Upload the parameters and raw spectra to R software

```R
setwd("~/**Desktop/R-PLAYING**")    #Replace this by the directory where you stored the files
SampleInfo<-read.csv("SampleInfo.csv", sep=",", dec=".", header=TRUE)    #Load CSV file containing SampleInfo data
RawNIRData<-read.csv("RawNIRData.csv",sep=",",dec=".",header=TRUE)   #Load CSV file containing RawNIRData
ClassRef<-read.csv("ClassRef.csv",sep=",",dec=".",header=TRUE)  #Load CSV file containing Class Reference

```
+ Convert the spectra to data frane and split them to each set of 12 categories
+ Group the spectra to each categories

```R
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
```

Below are the sample formulated sample matrixes constainig Acetaminopen (*AC*), Lactose (*LA*), and Ascorbic acid (*AA*) and there mixtures.

## Sample Keys 

S1090ACAA *(Group 1)* : Sample Matrix Formulation 10 AC : 90 AA

S1090ACLA *(Group 2)* : Sample Matrix Formulation 10 AC : 90 LA

S1090AALA *(Group 3)* : Sample Matrix Formulation 10 AA : 90 LA

S5050ACAA *(Group 4)*: Sample Matrix Formulation 50 AC : 50 AA

S5050ACLA *(Group 5)* : Sample Matrix Formulation 50 AC : 50 LA

S5050AALA *(Group 6)* : Sample Matrix Formulation 50 AA : 50 LA

S9010ACAA *(Group 7)* : Sample Matrix Formulation 90 AC : 10 AA

S9010ACLA *(Group 8)* : Sample Matrix Formulation 90 AC : 10 AA

S9010AALA *(Group 9)* : Sample Matrix Formulation 90 AC : 10 AA

S100AC *(Group 10)* : Sample Matrix Formulation 100 AC 

S100AA *(Group 11)* : Sample Matrix Formulation 1O0 AA

S100LA *(Group 12)* : Sample Matrix Formulation 100 LA



Plot the raw spectra of each 12 categories of 100 spectra and # Plot all spectra together

```R
par(mfrow=c(1,1)
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

SPECTRAraws<-rbind.data.frame(Wavelength,RawSpectra)

SPECTRAraw<-data.frame(t(SPECTRAraws))

SPECTRAraw1<-SPECTRAraw[ ,2:1201]

matplot(SPECTRAraw$X1,SPECTRAraw1,type="l",col = rep(1:12, each = 100), xlab = "Wavelength (nm)" , ylab = "Absorbance (au)")

legend("topleft",legend = paste("Group",1:12),col=1:12, cex=0.5,pch=19,pt.cex = 1)
```

![Rplot3001](https://user-images.githubusercontent.com/68889345/131867920-6e7ef98e-0ca4-4c32-b3a3-3a3c6dd095d4.png)
![Rplot3002](https://user-images.githubusercontent.com/68889345/131867951-075b8f38-b278-43f0-9059-6836b2586c6c.png)
![Rplot3003](https://user-images.githubusercontent.com/68889345/131867950-c7fc28c4-0036-4d88-b70c-4c08ac6a5c95.png)
![Rplot3004](https://user-images.githubusercontent.com/68889345/131867947-4e61476c-8996-4692-9826-b69c7d546105.png)
![Rplot3005](https://user-images.githubusercontent.com/68889345/131867943-dbb98f38-ab88-4c2a-99aa-6f39da7621eb.png)
![Rplot3006](https://user-images.githubusercontent.com/68889345/131867942-b0131252-5710-4ec8-bc48-ac9fb5c4e66e.png)
![Rplot3007](https://user-images.githubusercontent.com/68889345/131867941-cf8adbe2-8d2e-4305-b2c6-69a40b574d35.png)
![Rplot3008](https://user-images.githubusercontent.com/68889345/131867939-f6b5a7db-8fee-4f3c-b637-9ee61f376902.png)
![Rplot3009](https://user-images.githubusercontent.com/68889345/131867936-51d719ad-cdb3-4557-9f58-e8feca9f3c55.png)
![Rplot3010](https://user-images.githubusercontent.com/68889345/131867933-8836e028-69de-4cca-8f24-ea7d68e93440.png)
![Rplot3011](https://user-images.githubusercontent.com/68889345/131867930-b59789cc-6a4b-487b-9af3-3ab8ac744cf8.png)
![Rplot3012](https://user-images.githubusercontent.com/68889345/131867928-27fa0874-b789-4717-9d23-ec595518e70a.png)
![Rplot30rawall](https://user-images.githubusercontent.com/68889345/131867925-8a6bd9e4-6ce1-44f6-baf2-491d263ad43d.png)





## Data Pretreatment Key I

The raw spectra was subjected to SNV data pretreatment to remove the scatter effects

Below are the outcome of the treatment and what each denote:



- Apply SNV data pretreatment the spectra

```R
snvspectra <- prep.snv(RawSpectra)
```
- Split the snv treated spectra to the 12 different categories


snvS1090ACA : SNV transformed S1090ACAA

snvS1090ACLA : SNV transformed S1090ACLA

snvS1090AALA : SNV transformed S1090AALA

snvS5050ACAA : SNV transformed S5050ACAA

snvS5050ACLA : SNV transformed S5050ACLA

snvS5050AALA : SNV transformed S5050AALA

snvS9010ACAA : SNV transformed S9010ACAA

snvS9010ACLA : SNV transformed S9010ACLA

snvS9010AALA : SNV transformed S9010AALA

snvS100AC : SNV transformed S100AC

snvS100AA : SNV transformed S100AA

snvS100LA : SNV transformed S100LA



```R
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
```
*Plot the SNV tranformed data*

```R
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

```

![Rplot3013](https://user-images.githubusercontent.com/68889345/131875838-dd46fd2d-74f9-4f21-bdf7-0a9bb725a08f.png)
![Rplot3014](https://user-images.githubusercontent.com/68889345/131875839-e1b51a13-fb89-4f98-8eca-1659adb61fee.png)
![Rplot3015](https://user-images.githubusercontent.com/68889345/131875841-dcb4eb32-98ce-4d2d-9831-d926c2f1da2c.png)
![Rplot3016](https://user-images.githubusercontent.com/68889345/131875845-caac7ce2-4d04-4ba9-8ddf-45177f24528d.png)
![Rplot3017](https://user-images.githubusercontent.com/68889345/131875848-11e1c4d3-8a16-47fe-82f7-2cac104ee8ef.png)
![Rplot3018](https://user-images.githubusercontent.com/68889345/131875850-c54d8afb-419f-49a4-9237-e17f0cbfc1d9.png)
![Rplot3019](https://user-images.githubusercontent.com/68889345/131875851-de872277-bb9e-4a53-9cf1-32eec1adb3c0.png)
![Rplot3020](https://user-images.githubusercontent.com/68889345/131875854-7d51aa31-c64d-45ac-94f8-e1aa7a0c106d.png)
![Rplot3021](https://user-images.githubusercontent.com/68889345/131875855-df1ff3b3-5edc-4857-a912-c1600f5d4398.png)
![Rplot3022](https://user-images.githubusercontent.com/68889345/131875856-00c6b233-ad0c-41fc-8f5b-a828e1ccd025.png)
![Rplot3023](https://user-images.githubusercontent.com/68889345/131875858-b989f7b4-64c7-4b85-b4ee-9e54c73fc2de.png)
![Rplot3024a](https://user-images.githubusercontent.com/68889345/131875860-3819d9e0-668a-4f77-82ab-3e87d2da6993.png)


*Transform the data for a combined plot*

```
SPECTRAsnvs<-rbind.data.frame(Wavelength,snvspectra)

SPECTRAsnv<-data.frame(t(SPECTRAsnvs))

SPECTRAsnv1<-SPECTRAsnv[ ,2:1201]

matplot(SPECTRAsnv$X1,SPECTRAsnv1,type="l",col = rep(1:12, each = 100), xlab = "Wavelength (nm)" , ylab = "Transformed Absorbance")

legend("topleft",legend = paste("Group",1:12),col=1:12, cex=0.5,pch=19,pt.cex = 1)
```

![Rplot30snvall](https://user-images.githubusercontent.com/68889345/131875837-21282257-9939-4f3f-ba8d-33d7f19519ad.png)



## Data Pretreatment Key II

*Apply SG filter for smoothing and take a second derivative*

```R
SGspectra <- prep.savgol(snvspectra, width = 17, porder = 2, dorder = 2)
```

- Split the SG filter treated spectra to the 12 different categories


SGFsnvS1090ACAA : Savytzky-Golay transformed S1090ACAA

SGFsnvS1090ACLA : Savytzky-Golay transformed S1090ACLA

SGFsnvS1090AALA : Savytzky-Golay transformed S1090AALA

SGFsnvS5050ACAA : Savytzky-Golay transformed S5050ACAA 

SGFsnvS5050ACLA : Savytzky-Golay transformed S5050ACLA

SGFsnvS5050AALA : Savytzky-Golay transformed S5050AALA

SGFsnvS9010ACAA : Savytzky-Golay transformed S9010ACAA

SGFsnvS9010ACLA : Savytzky-Golay transformed S9010ACLA

SGFsnvS9010AALA : Savytzky-Golay transformed S9010AALA

SGFsnvS100AC : Savytzky-Golay transformed S100AC

SGFsnvS100AA : Savytzky-Golay transformed S100AA

SGFsnvS100LA : Savytzky-Golay transformed S100LA


*Group or classify the spectra*

```R
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
```

*Plot the SNV tranformed data*

```R
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
```

![Rplot3025](https://user-images.githubusercontent.com/68889345/131876510-29f240b7-eadf-42d6-a5b4-76433de11044.png)
![Rplot3026](https://user-images.githubusercontent.com/68889345/131876513-aa5a2838-2f3d-4c7e-82c5-054572aa8b2c.png)
![Rplot3027](https://user-images.githubusercontent.com/68889345/131876514-522cd24e-3269-4f25-9ab3-394bf71b95cc.png)
![Rplot3028](https://user-images.githubusercontent.com/68889345/131876516-0acc449f-6660-43dd-a1e8-56fb4b244004.png)
![Rplot3029](https://user-images.githubusercontent.com/68889345/131876519-378f5c62-49a3-4890-a007-bc2ea2329d13.png)
![Rplot3030](https://user-images.githubusercontent.com/68889345/131876520-8b771c99-6c2c-46d4-85a1-4e9278a8cfcd.png)
![Rplot3031](https://user-images.githubusercontent.com/68889345/131876522-2b2db61f-78c6-44db-9a96-cebab38ac5de.png)
![Rplot3032](https://user-images.githubusercontent.com/68889345/131876524-437c1306-e87a-4a58-bb2e-c0df32ada44a.png)
![Rplot3033](https://user-images.githubusercontent.com/68889345/131876526-7ba5458e-e5cb-4087-b7db-6b6bd5340037.png)
![Rplot3034](https://user-images.githubusercontent.com/68889345/131876530-81002923-0121-489d-86d1-98112e07ca3f.png)
![3535](https://user-images.githubusercontent.com/68889345/131876532-8ca66d56-9dc8-4a0a-9456-3616d82b427e.png)
![Rplot3036](https://user-images.githubusercontent.com/68889345/131876533-ad783a83-f867-4cad-b3ae-8d87ca1c256a.png)




## Transform the data for a combined plot

```
SPECTRAsgs<-rbind.data.frame(Wavelength,SGspectra)

SPECTRAsg<-data.frame(t(SPECTRAsgs))

SPECTRAsg1<-SPECTRAsg[ ,2:1201]
```

# Plot all spectra together

```
matplot(SPECTRAsg$X1,SPECTRAsg1,type="l",col = rep(1:12, each = 100), xlab = "Wavelength (nm)" , ylab = "Transformed Absorbance")

legend("bottomleft",legend = paste("Group",1:12),col=1:12, cex=0.5,pch=19,pt.cex = 1)
```

![Rplot30sgmerged](https://user-images.githubusercontent.com/68889345/131876535-a6821855-877d-4c7e-b1d0-983927c64bae.png)


## PCA Analysis

*Split the treated data to two : Calibration set = Calib set and validation set = testset, then build PCA model*

```R
ispect <- seq(1, 1200, 4)
calibset <- SGspectra[-ispect, ]
testset <- SGspectra[ispect, ]

Calibpca_model <- pca(calibset, 10, scale = TRUE, info = "ACAALA PCA model")
Calibpca_model<- selectCompNum(Calibpca_model, 5)
```
+ Access the loadings and the scores

```R
Calibpca_model$loadings[1:4, 1:4]
```

```
##############################
   Comp 1     Comp 2      Comp 3     Comp 4
1 0.01511032 0.09008960  0.09061374 -0.1433531
2 0.02491434 0.08134250  0.04010265 -0.2263023
3 0.02880470 0.06849692 -0.01527204 -0.2816507
4 0.02839777 0.05369044 -0.06064988 -0.3126289
##############################
```


```R
Calibpca_model$res$cal$scores[1:4, 1:4]
```

```
##############################
Comp 1    Comp 2    Comp 3     Comp 4
SamplesData.NIR.A2 7.752818 -11.89528 0.6831984 -0.5235035
SamplesData.NIR.A3 7.578034 -13.23961 1.8856384 -0.3665607
SamplesData.NIR.A4 7.488082 -12.38351 0.1403219  1.3298068
SamplesData.NIR.A6 7.366403 -10.72870 1.8437984 -1.5862289
##############################
```


```R
Predictnmodel <- predict(Calibpca_model, testset)
print(Predictnmodel) 
```

```
##############################
Results for PCA decomposition (class pcares)
Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
##############################
```


+ PCA model with test set validation (we will use testset to validate) 

```R
Calibpca_model <- pca(calibset,7,scale = TRUE, x.test=testset, info = "PCA model")
Calibpca_model <- selectCompNum(Calibpca_model, 5)
```

*Info for both result objects*

```R
print(Calibpca_model$res$cal)
```

```
##############################
Results for PCA decomposition (class pcares)
Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
##############################
```

```R
print(Calibpca_model$res$test)
```

```
##############################

Results for PCA decomposition (class pcares)

Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
##############################
```


*some statistics for evaluation of a model performance*


```
summary(Calibpca_model)
```

```
##############################

Summary for PCA model (class pca)
Type of limits: ddmoments
Alpha: 0.05
Gamma: 0.01

       Eigenvals Expvar Cumexpvar Nq Nh
Comp 1   111.087  48.72     48.72  8  2
Comp 2    72.090  31.62     80.34  3  8
Comp 3    11.371   4.99     85.33  7  2
Comp 4     5.691   2.50     87.82  9  3
Comp 5     3.580   1.57     89.39 11  3
Comp 6     2.196   0.96     90.36 12  3
Comp 7     1.852   0.81     91.17 12  4
##############################
```
*Performance*

```R
var <- data.frame(
  cal <- Calibpca_model$res$cal$expvar,
  test <- Calibpca_model$res$test$expvar)
show(round(var, 1))
```

```
##############################
 cal test
Comp 1 48.7 48.0
Comp 2 31.6 32.0
Comp 3  5.0  4.8
Comp 4  2.5  2.7
Comp 5  1.6  1.6
Comp 6  1.0  0.8
Comp 7  0.8  0.7
##############################
```

*scores and loadings plots for PC1 vs PC2*

```
par(mfrow = c(1, 1))
mdaplot(Calibpca_model$res$cal$scores, type = "p",show.labels = FALSE, show.lines = c(0, 0))
```

![Rplot13](https://user-images.githubusercontent.com/68889345/131245998-36ae9dfd-d171-4a65-b1af-85e652575a0d.png)
![Rplot30](https://user-images.githubusercontent.com/68889345/131885756-6007df8b-9ee1-4f3a-afd2-f7b61c96bcb3.png)




```
mdaplot(Calibpca_model$loadings, type = "p", show.labels = FALSE, show.lines = c(0, 0))
mdaplot(Calibpca_model$loadings, type = "p", show.labels = TRUE, show.lines = c(0, 0))
```


![Rplot31](https://user-images.githubusercontent.com/68889345/131885757-81ce8ba8-546b-4183-ac85-1723672f5d17.png)
![Rplot31B](https://user-images.githubusercontent.com/68889345/131885758-7278c16a-8682-4fe6-acdd-8517a893ec5a.png)


```
##############################
ispectra <- seq(4, 1200, 4)
Calibpca_modelx <- SGspectra[-ispectra, -(c(1,2))]
Calibpca_modely <- SGspectra[-ispectra, 2, drop = FALSE]
testset_modelx <- SGspectra[ispectra, -(c(1,2))]
testset_modely <- SGspectra[ispectra, 2, drop = FALSE]
##############################
```

```
PLS_Prediction <- pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, info = "Conc. prediction model")
PLS_Prediction <- selectCompNum(PLS_Prediction, 3)
```

```
print(PLS_Prediction)
```

```
##############################
PLS model (class pls)
Call:
selectCompNum.pls(obj = PLS_Prediction, ncomp = 3)
Major fields:
$ncomp - number of calculated components
$ncomp.selected - number of selected components
$coeffs - object (regcoeffs) with regression coefficients
$xloadings - vector with x loadings
$yloadings - vector with y loadings
$weights - vector with weights
$res - list with results (calibration, cv, etc)
Try summary(model) and plot(model) to see the model performance.
##############################
```

*Other summaries that may be of interest*

```
PLS_Prediction$coeffs$values
```


```
par(mfrow = c(1, 1))
plotRegcoeffs(PLS_Prediction)
```

![Rplot32](https://user-images.githubusercontent.com/68889345/131887243-7fbd5874-fdee-45af-9c0e-c59b7107288a.png)




```
plotRegcoeffs(PLS_Prediction, ncomp = 2)
```


![Rplot33](https://user-images.githubusercontent.com/68889345/131887246-345f7b83-0d62-4fd9-9038-ff799242817b.png)


*Other plots that may be of interest*

```
plot(PLS_Prediction$coeffs, ncomp = 3, type = "b", show.labels = FALSE)
plot(PLS_Prediction$coeffs, ncomp = 2)
```

*Other statistical information that may be of interest*

```
show(PLS_Prediction$coeffs$values[, 3, 1])
show(getRegcoeffs(PLS_Prediction, ncomp = 3))
```



```
summary(PLS_Prediction$coeffs)
```

```
##############################
Regression coefficients for 2 (ncomp = 1)
-----------------------------------------
          Coeffs    Std. err. t-value p-value         2.5%         97.5%
3   0.0127021715 0.0003741618   33.95   0.000  0.011967839  0.0134365037
4   0.0114796364 0.0003667514   31.30   0.000  0.010759848  0.0121994250
5   0.0099842869 0.0003725332   26.80   0.000  0.009253151  0.0107154230
6   0.0079432848 0.0003891030   20.41   0.000  0.007179629  0.0087069407
7   0.0045402607 0.0003958370   11.47   0.000  0.003763388  0.0053171330
8  -0.0014090281 0.0003972690   -3.55   0.000 -0.002188711 -0.0006293454
9  -0.0091592007 0.0003291813  -27.82   0.000 -0.009805254 -0.0085131475
10 -0.0092804071 0.0003564219  -26.04   0.000 -0.009979923 -0.0085808913
11 -0.0079995924 0.0004346258  -18.41   0.000 -0.008852592 -0.0071465932
12 -0.0059959182 0.0005236332  -11.45   0.000 -0.007023604 -0.0049682324
13 -0.0046673257 0.0005892436   -7.92   0.000 -0.005823779 -0.0035108725
14 -0.0039123014 0.0006149721   -6.36   0.000 -0.005119250 -0.0027053532
15 -0.0035530790 0.0006225812   -5.71   0.000 -0.004774961 -0.0023311972
16 -0.0033691506 0.0006166692   -5.46   0.000 -0.004579429 -0.0021588717
17 -0.0034593570 0.0006173053   -5.60   0.000 -0.004670884 -0.0022478298
18 -0.0036889645 0.0006073517   -6.07   0.000 -0.004880957 -0.0024969722
19 -0.0036733206 0.0005906700   -6.22   0.000 -0.004832573 -0.0025140680
20  0.0028713412 0.0004156213    6.91   0.000  0.002055640  0.0036870421
21  0.0047725033 0.0005091977    9.37   0.000  0.003773149  0.0057718578
22  0.0051009001 0.0005286539    9.65   0.000  0.004063361  0.0061384396
23  0.0052725917 0.0005262413   10.02   0.000  0.004239787  0.0063053962
24  0.0053782084 0.0005281373   10.18   0.000  0.004341683  0.0064147340
25  0.0054244750 0.0005276016   10.28   0.000  0.004389001  0.0064599493
26  0.0053394597 0.0005285489   10.10   0.000  0.004302126  0.0063767931
27  0.0049222603 0.0005350793    9.20   0.000  0.003872110  0.0059724102
28  0.0034021914 0.0005512492    6.17   0.000  0.002320306  0.0044840765
29 -0.0037899148 0.0003317006  -11.43   0.000 -0.004440912 -0.0031389171
30 -0.0087157681 0.0003505696  -24.86   0.000 -0.009403798 -0.0080277380
31 -0.0087542269 0.0003995997  -21.91   0.000 -0.009538484 -0.0079699700
32 -0.0087464112 0.0004101597  -21.32   0.000 -0.009551393 -0.0079414292
33 -0.0089894019 0.0004030514  -22.30   0.000 -0.009780433 -0.0081983706
34 -0.0091876490 0.0004001238  -22.96   0.000 -0.009972935 -0.0084023634
35 -0.0093455834 0.0003951597  -23.65   0.000 -0.010121126 -0.0085700406
36 -0.0092807371 0.0004001787  -23.19   0.000 -0.010066130 -0.0084953439
37 -0.0089993571 0.0004160852  -21.63   0.000 -0.009815968 -0.0081827456
38 -0.0083094006 0.0004461140  -18.63   0.000 -0.009184947 -0.0074338544
39 -0.0065230415 0.0004895419  -13.32   0.000 -0.007483820 -0.0055622635
40 -0.0031493746 0.0004979258   -6.32   0.000 -0.004126607 -0.0021721422
41 -0.0001578518 0.0004550806   -0.35   0.729 -0.001050996  0.0007352921
42  0.0022912842 0.0003788281    6.05   0.000  0.001547794  0.0030347745
43  0.0037168468 0.0003940549    9.43   0.000  0.002943472  0.0044902214
44  0.0020696271 0.0005100934    4.06   0.000  0.001068515  0.0030707395
45 -0.0006232272 0.0004983906   -1.25   0.211 -0.001601372  0.0003549173
46 -0.0026138800 0.0004088860   -6.39   0.000 -0.003416362 -0.0018113978
47 -0.0035175943 0.0003603810   -9.76   0.000 -0.004224880 -0.0028103083
48 -0.0039179870 0.0003347579  -11.70   0.000 -0.004574985 -0.0032609891
49 -0.0043171563 0.0003086455  -13.99   0.000 -0.004922906 -0.0037114066
50 -0.0046240967 0.0002857827  -16.18   0.000 -0.005184976 -0.0040632178
51 -0.0049283434 0.0002628036  -18.75   0.000 -0.005444123 -0.0044125633
52 -0.0049834882 0.0002560620  -19.46   0.000 -0.005486037 -0.0044809392

Degrees of freedom (Jack-Knifing): 899
##############################
```


```
print(PLS_Prediction$res$cal)
```

```
##############################
PLS results (class plsres)

Call:
plsres(y.pred = yp, y.ref = y.ref, ncomp.selected = object$ncomp.selected, 
    xdecomp = xdecomp, ydecomp = ydecomp)

Major fields:
$ncomp.selected - number of selected components
$y.pred - array with predicted y values
$y.ref - matrix with reference y values
$rmse - root mean squared error
$r2 - coefficient of determination
$slope - slope for predicted vs. measured values
$bias - bias for prediction vs. measured values
$ydecomp - decomposition of y values (ldecomp object)
$xdecomp - decomposition of x values (ldecomp object)
##############################
```

```
print(PLS_Prediction$res$cal$xdecomp)
```

```
##############################
Results of data decomposition (class ldecomp).

Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
##############################
```


```
Predict_testset <- predict(PLS_Prediction, testset_modelx, testset_modely)
print(Predict_testset)
```

```
##############################
PLS results (class plsres)

Call:
plsres(y.pred = yp, y.ref = y.ref, ncomp.selected = object$ncomp.selected, 
    xdecomp = xdecomp, ydecomp = ydecomp)

Major fields:
$ncomp.selected - number of selected components
$y.pred - array with predicted y values
$y.ref - matrix with reference y values
$rmse - root mean squared error
$r2 - coefficient of determination
$slope - slope for predicted vs. measured values
$bias - bias for prediction vs. measured values
$ydecomp - decomposition of y values (ldecomp object)
$xdecomp - decomposition of x values (ldecomp object)
##############################
```


```
print(Predict_testset$rmse)
```

```
##############################
        Comp 1       Comp 2       Comp 3       Comp 4       Comp 5       Comp 6
2 0.0002910112 0.0002701696 0.0001421775 0.0001199389 8.691097e-05 6.184089e-05
        Comp 7
2 5.586857e-05
attr(,"name")
[1] "RMSE"
attr(,"xaxis.name")
[1] "Components"
attr(,"yaxis.name")
[1] "Predictors"
##############################
```

```
PLS_Prediction1 <- pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, ncomp.selcrit = "min")
show(PLS_Prediction1$ncomp.selected)
```
```
##############################
[1] 7
##############################
```

```
PLS_Prediction2 <- pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, ncomp.selcrit = "wold")
show(PLS_Prediction2$ncomp.selected)
```

```
##############################
[1] 7
##############################
```



```
plotRMSE(PLS_Prediction1)
```
![Rplot36](https://user-images.githubusercontent.com/68889345/131889053-93f0ec85-9261-4fe3-ab8d-f60bfe12dcb1.png)




```
plotRMSE(PLS_Prediction2)
```

![Rplot37](https://user-images.githubusercontent.com/68889345/131889056-c7589779-b75b-46e9-8213-a42f29526f58.png)




```
plotPredictions(PLS_Prediction1)
```

![Rplot38](https://user-images.githubusercontent.com/68889345/131889290-28280721-801c-4040-ac69-d59a1253d7aa.png)



```
plotPredictions(PLS_Prediction1, ncomp = 1)
```

![Rplot39](https://user-images.githubusercontent.com/68889345/131889292-38fd6765-7e56-4ad7-b8bf-8d8c05a8bb60.png)


```
plotPredictions(PLS_Prediction1$res$cal)
```

![Rplot40](https://user-images.githubusercontent.com/68889345/131889293-cb494d60-dfd1-4b56-ad29-44e0696219c0.png)

```
plotPredictions(PLS_Prediction1$res$cal, ncomp = 2)
```

![Rplot41](https://user-images.githubusercontent.com/68889345/131889295-7c00ef7c-e396-4449-83f5-c2d080d80b1a.png)

```
plotPredictions(PLS_Prediction1$res$cal, show.stat = TRUE)
```

![Rplot42](https://user-images.githubusercontent.com/68889345/131889296-ac39438d-82a8-4194-94e7-746aa14182ed.png)

```
plotPredictions(PLS_Prediction1$res$cal, ncomp = 2, show.stat = TRUE)
```

![Rplot43](https://user-images.githubusercontent.com/68889345/131889297-cab5a08f-4729-4d9d-9917-cfd9cda72ac1.png)


```
plot(PLS_Prediction1)
```

![Rplot44](https://user-images.githubusercontent.com/68889345/131889299-036ff235-98ed-4640-a0b4-f1e572ddb2d9.png)

```
plot(PLS_Prediction2)
```

![Rplot45](https://user-images.githubusercontent.com/68889345/131889300-99d611e0-a0fc-446d-96a1-5ded04ecc3d4.png)

```
ispectraSIMCA = seq(4, 1200, 4)
```

```
Calibpca_modelSimcax <- SGspectra[ispectraSIMCA, 1:228]
SGspectra01<-AllmSampleData$SpeciesID
Calibpca_modelSimcay <- ClassRef[ispectraSIMCA, 1]
testset_modelSimcax <- SGspectra[-ispectraSIMCA, 1:228]
testset_modelSimcay <- ClassRef[-ispectraSIMCA, 1]
```

```
s.1090ACAA <- SGspectra[1:100,1:228 ]
s.1090ACLA <- SGspectra[101:200,1:228 ]
s.1090AALA <- SGspectra[201:300,1:228 ]
s.5050ACAA <- SGspectra[301:400,1:228 ]
s.5050ACLA <- SGspectra[401:500,1:228 ]
s.5050AALA <- SGspectra[501:600,1:228 ]
s.9010ACAA <- SGspectra[601:700,1:228 ]
s.9010ACLA <- SGspectra[701:800,1:228 ]
s.9010AALA <- SGspectra[801:900,1:228 ]
s.100AC <- SGspectra[901:1000,1:228 ]
s.100AA <- SGspectra[1001:1100,1:228 ]
s.100LA <- SGspectra[1101:1200,1:228 ]
```

```
Simca_pca_s.1090ACAA <- simca(s.1090ACAA, "1090ACAA",ncomp = 3)
summary(Simca_pca_s.1090ACAA)
```

```
IMCA model for class '1090ACAA' summary
Number of components: 3
Type of limits: ddmoments
Alpha: 0.05
Gamma: 0.01
    Expvar Cumexpvar TP FP TN FN Spec. Sens. Accuracy
Cal   8.43     71.73 95  0  0  5    NA  0.95     0.95
```

```
plot(Simca_pca_s.1090ACAA)
```

![Rplot46](https://user-images.githubusercontent.com/68889345/131889302-1da99cde-8784-44bb-ae41-3dd07e2ac8e9.png)


```
plotSensitivity(Simca_pca_s.1090ACAA)
plotMisclassified(Simca_pca_s.1090ACAA)
plotPredictions(Simca_pca_s.1090ACAA$res$cal, main = "Predictions (cal)")
plotPredictions(Simca_pca_s.1090ACAA$res$cv, main = "Predictions (cv)")
```

![Rplot48](https://user-images.githubusercontent.com/68889345/131892544-c595c4db-a64a-4da7-bbf2-8cafcf3317f0.png)
![Rplot49](https://user-images.githubusercontent.com/68889345/131892546-7bab4f35-5bab-40c4-a83c-55c0b156de95.png)
![Rplot50](https://user-images.githubusercontent.com/68889345/131892548-02305b3b-9deb-4ad2-b438-9ea519657e70.png)
![Rplot51](https://user-images.githubusercontent.com/68889345/131892549-3cd68c58-8764-4561-a9b1-89140c03f9df.png)


```
summary(Simca_pca_s.1090ACAA)
```

```
##############################
SIMCA model for class '1090ACAA' summary


Number of components: 3
Type of limits: ddmoments
Alpha: 0.05
Gamma: 0.01

    Expvar Cumexpvar TP FP TN FN Spec. Sens. Accuracy
Cal   8.43     71.73 95  0  0  5    NA  0.95     0.95
Cv      NA        NA 94  0  0  6    NA  0.94     0.94
##############################
```

*Predict the testset using the SIMCA model*

```
Predict_testsetSimca = predict(Simca_pca_s.1090ACAA, testset_modelSimcax, testset_modelSimcay)
summary(Predict_testsetSimca)
```


```
##############################
Summary for SIMCA one-class classification result

Class name: 1090ACAA
Number of selected components: 3

       Expvar Cumexpvar TP FP  TN FN Spec. Sens. Accuracy
Comp 1  18.71     18.71 72 14 811  3 0.983  0.96    0.981
Comp 2  12.31     31.01 72  0 825  3 1.000  0.96    0.997
Comp 3  15.50     46.51 72  0 825  3 1.000  0.96    0.997
##############################
```

*Multi-class SIMCA of 1200 spectra containing 12 groups/categories listed above*

```
X.1090ACAA <- SPECTRAM2[1:100,3:230]
m.1090ACAA <- simca(s.1090ACAA, "1090ACAA", 12, alpha = 0.01)
m.1090ACAA <- selectCompNum(m.1090ACAA, 1)

X.1090ACLA <- SPECTRAM2[101:200,3:230 ]
m.1090ACLA <- simca(s.1090ACLA, "1090ACLA", 12, alpha = 0.01)
m.1090ACLA <- selectCompNum(m.1090ACLA, 2)

X.1090AALA <- SPECTRAM2[201:300,3:230 ]
m.1090AALA <- simca(s.1090AALA, "1090AALA", 12)
m.1090AALA <- selectCompNum(m.1090AALA, 3)

X.5050ACAA <- SPECTRAM2[301:400,3:230 ]
m.5050ACAA <- simca(s.5050ACAA, "5050ACAA", 12)
m.5050ACAA <- selectCompNum(m.5050ACAA, 4)

X.5050ACLA <- SPECTRAM2[401:500,3:230 ]
m.5050ACLA <- simca(s.5050ACLA, "5050ACLA", 12)
m.5050ACLA <- selectCompNum(m.5050ACLA, 5)

X.5050AALA <- SPECTRAM2[501:600,3:230 ]
m.5050AALA <- simca(s.5050AALA, "5050AALA", 12)
m.5050AALA <- selectCompNum(m.5050AALA, 6)

X.9010ACAA <- SPECTRAM2[601:700,3:230 ]
m.9010ACAA <- simca(s.9010ACAA, "9010ACAA", 12)
m.9010ACAA <- selectCompNum(m.9010ACAA, 7)

X.9010ACLA <- SPECTRAM2[701:800,3:230 ]
m.9010ACLA <- simca(s.9010ACLA, "9010ACLA", 12)
m.9010ACLA <- selectCompNum(m.9010ACLA, 8)

X.9010AALA <- SPECTRAM2[801:900,3:230 ]
m.9010AALA <- simca(s.9010AALA, "9010AALA", 12)
m.9010AALA <- selectCompNum(m.9010AALA, 9)

X.100AC <- SPECTRAM2[901:1000,3:230 ]
m.100AC <- simca(s.100AC, "100AC", 12)
m.100AC <- selectCompNum(m.100AC, 10)

X.100AA <- SPECTRAM2[1001:1100,3:230 ]
m.100AA <- simca(s.100AA, "100AA", 12)
m.100AA <- selectCompNum(m.100AA, 11)

X.100LA <- SPECTRAM2[1101:1200,3:230 ]
m.100LA <- simca(s.100LA, "100LA", 12)
m.100LA <- selectCompNum(m.100LA, 12)
```

*Apply SIMCAM*

```
Simca_m.All <- simcam(list(m.1090ACAA, m.1090ACLA, m.1090AALA,m.5050ACAA,m.5050ACLA,
                          m.5050AALA,m.9010ACAA,m.9010ACLA,m.9010AALA,m.100AC,m.100AA,
                          m.100LA))
summary(Simca_m.All)
```

```
##############################
SIMCA multiple classes classification (class simcam)

Number of classes: 12
Info: 

Summary for calibration results
         Ncomp TP  FP   TN FN Spec. Sens. Accuracy
1090ACAA     1 97  49 1051  3 0.955  0.97    0.957
1090ACLA     2 97 124  976  3 0.887  0.97    0.894
1090AALA     3 94  85 1015  6 0.923  0.94    0.924
5050ACAA     4 93   0 1100  7 1.000  0.93    0.994
5050ACLA     5 96   0 1100  4 1.000  0.96    0.997
5050AALA     6 95  45 1055  5 0.959  0.95    0.958
9010ACAA     7 96   0 1100  4 1.000  0.96    0.997
9010ACLA     8 96   0 1100  4 1.000  0.96    0.997
9010AALA     9 98   1 1099  2 0.999  0.98    0.998
100AC       10 96   0 1100  4 1.000  0.96    0.997
100AA       11 95   0 1100  5 1.000  0.95    0.996
100LA       12 93 102  998  7 0.907  0.93    0.909
##############################
```


*Use the SIMCA model developed to predict testset*

```
Simca_m.All_test <- predict(Simca_m.All, testset_modelSimcax, testset_modelSimcay)
plotPredictions(Simca_m.All_test)
```
![Rplot52](https://user-images.githubusercontent.com/68889345/131900739-c6c1ccc8-3d13-4fb0-9ef2-0bd74bff2481.png)


```
show(Simca_m.All_test$c.pred[20:30, 1, ])

```

```
##############################
                  1090ACAA 1090ACLA 1090AALA 5050ACAA 5050ACLA 5050AALA
SamplesData.NIR.A26        1       -1       -1       -1       -1       -1
SamplesData.NIR.A27        1       -1       -1       -1       -1       -1
SamplesData.NIR.A29        1       -1       -1       -1       -1       -1
SamplesData.NIR.A30        1       -1       -1       -1       -1       -1
SamplesData.NIR.A31        1       -1       -1       -1       -1       -1
SamplesData.NIR.A33        1       -1       -1       -1       -1       -1
SamplesData.NIR.A34        1       -1       -1       -1       -1       -1
SamplesData.NIR.A35        1       -1       -1       -1       -1       -1
SamplesData.NIR.A37        1       -1       -1       -1       -1       -1
SamplesData.NIR.A38        1       -1       -1       -1       -1       -1
SamplesData.NIR.A39        1       -1       -1       -1       -1       -1
                    9010ACAA 9010ACLA 9010AALA 100AC 100AA 100LA
SamplesData.NIR.A26       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A27       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A29       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A30       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A31       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A33       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A34       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A35       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A37       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A38       -1       -1       -1    -1    -1    -1
SamplesData.NIR.A39       -1       -1       -1    -1    -1    -1
##############################
```

```
show(getConfusionMatrix(Simca_m.All_test))
```

```
##############################
      1090ACAA 1090ACLA 1090AALA 5050ACAA 5050ACLA 5050AALA 9010ACAA 9010ACLA
1090ACAA       73        0        0        0        0        0        0        0
1090ACLA        0       74       49        0        0        5        0        0
1090AALA        0       53       70        0        0       30        0        0
5050ACAA        0        0        0       70        0        0        0        0
5050ACLA        0        0        0        0       72        0        0        0
5050AALA        0        4        1        0        0       70        0        0
9010ACAA        0        0        0        0        0        0       72        0
9010ACLA        0        0        0        0        0        0        0       72
9010AALA       15        0        0        0        0        0        0        0
100AC           0        0        0        0        0        0        0        0
100AA          21        0        0        0        0        0        0        0
100LA           0       40       17        0        0        0        0        0
         9010AALA 100AC 100AA 100LA None
1090ACAA        0     0     0     0    2
1090ACLA        0     0     0    42    1
1090AALA        0     0     0    32    0
5050ACAA        0     0     0     0    5
5050ACLA        0     0     0     0    3
5050AALA        0     0     0     0    5
9010ACAA        0     0     0     0    3
9010ACLA        0     0     0     0    3
9010AALA       73     0     0     0    2
100AC           0    72     0     0    3
100AA           1     0    71     0    3
100LA           0     0     0    74    1
##############################
```


```
plotCooman(Simca_m.All, c(1, 3), show.labels = FALSE)
plotCooman(Simca_m.All, c(7, 3), show.labels = FALSE)
```
![Rplot53](https://user-images.githubusercontent.com/68889345/131901962-b4696ddf-62ab-4e11-9543-2be357d7838f.png)
![Rplot54](https://user-images.githubusercontent.com/68889345/131901963-2f9354d3-662b-4147-9ed6-1c3476e7559a.png)



## SVM - REGRESSION

*Split data to test and calibration set*

```
ispectraSVM  <- sample(1:nrow(SPECTRAsg2),as.integer(0.7*nrow(SPECTRAsg2))) 
Calibpca_modelsvmy <- SPECTRAsg2[ispectraSVM, 2]
testset_modelsvmy <- SPECTRAsg2[-ispectraSVM, 2]
Calibpca_modelsvmx <- SPECTRAsg2[ispectraSVM,3:230]
testset_modelsvmx <- SPECTRAsg2[-ispectraSVM,3:230 ]
testset_modelsvm2x <- SPECTRAsg2[-ispectraSVM,2:230 ]
```
*Perform supprt vector analysis for model building*

```
SVM_R_AC <- svm(Calibpca_modelsvmy~.,Calibpca_modelsvmx)
```

*Perform supprt vector analysis for model building*

```
predict_Molarratio <- predict(SVM_R_AC, testset_modelsvmx)
```



## SVM - CLASSIFICATION

*Identify the classification criteria/column, split to calibration and validation set*

```
Calibpca_modelsvmcy <- SPECTRAsg2[ispectraSVM, 1]
testset_modelsvmcy <- SPECTRAsg2[-ispectraSVM, 1]
```
*Perform supprt vector analysis for model building*

```
SVM_C_AC <- svm(as.factor(Calibpca_modelsvmcy)~.,data = Calibpca_modelsvmx, type="C-classification", kernal="radial",gamma=0.1, cost=10)
```

*Perform supprt vector analysis for model building*

```
predict_Class <- predict(SVM_C_AC, testset_modelsvmx)
```

```
summary(predict_Class)
```

```
##############################
 100AA    100AC    100LA 1090AALA 1090ACAA 1090ACLA 5050AALA 5050ACAA 5050ACLA 
      22       93       29       28       28       22       19       24       26 
9010AALA 9010ACAA 9010ACLA 
      20       26       23 
##############################
```


