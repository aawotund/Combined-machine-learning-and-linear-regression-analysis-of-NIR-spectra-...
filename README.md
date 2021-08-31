# NIR-DATA-ANALYSIS-FOR-DETECTION-OF-SUBSTANDED-AND-FALSIFIED-PHARMACEUTICAL-AND-ILLICIT-DRUGS

*Author: Olatunde Awotunde, MS (PHD in view @ University of Notre Dame) . Email: aawotund@nd.edu;olatundeawotunde1@gmail.com*

This package uses functions developed from the following packages: 'pls, prospectr, dplyr, reshape2, mdatools, ggpubr, factoextra, FactoMineR, readxl, plyr, caret,

e1071'. We thank the creators of these useful packages.

## Warning:

The data structure must be in Dataframe format. Use the following command to transform it into a dataframe: as.data.frame().

The last column must contain the response variable in `factor` or `character` format.

This package is under development and was made for the specific needs of our laboratory.

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

Below are the sample formulated matrixes consisting of Acetaminopen (*AC*), Lactose (*LA*), and Ascorbic acid (*AA*)

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



Plot the raw spectra of each 12 categories of 100 spectra

```R
layout(matrix(c(1,2,3), 3, 1))
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

```
![Rplot](https://user-images.githubusercontent.com/68889345/131232647-20904bc5-3002-459f-acb9-248b3aa6a2ef.png)
![Rplot01](https://user-images.githubusercontent.com/68889345/131232648-e1420397-2d45-4aab-ad26-45dd6738c327.png)
![Rplot02](https://user-images.githubusercontent.com/68889345/131232649-41993701-3f32-42c0-8389-820ed5a71eb9.png)
![Rplot03](https://user-images.githubusercontent.com/68889345/131232650-071a4a8f-620f-42b5-b566-e918b4f60153.png)



## Data Pretreatment Key I

The raw spectra was subjected to SNV data pretreatment to remove the 

Below are the outcome of the treatment and what each denote:



- Apply SNV data pretreatment the spectra

```R
snvspectra = prep.snv(RawSpectra)
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

![Rplot04](https://user-images.githubusercontent.com/68889345/131240001-19dc29ce-a7e0-4270-9a3a-5c191825fab9.png)
![Rplot05](https://user-images.githubusercontent.com/68889345/131240002-fdf0d8d0-7eee-462d-bd56-0e45de315edc.png)
![Rplot06](https://user-images.githubusercontent.com/68889345/131240003-873a930c-5e38-47dc-8e81-aacffcd9be93.png)
![Rplot07](https://user-images.githubusercontent.com/68889345/131240004-848e71dc-9041-453d-91c8-6b7ae1403203.png)
![Rplot08](https://user-images.githubusercontent.com/68889345/131240005-37ef857b-8ddf-42a2-8de1-fced5f625989.png)

## Data Pretreatment Key II

*Apply SG filter for smoothing and take a second derivative*

```R
SGspectra = prep.savgol(snvspectra, width = 17, porder = 2, dorder = 2)
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
![Rplot09](https://user-images.githubusercontent.com/68889345/131243043-6e027de5-3aaf-463e-8bd6-65bf8e982641.png)
![Rplot10](https://user-images.githubusercontent.com/68889345/131243044-55172da5-fd73-421a-8669-2d7ce1a18113.png)
![Rplot11](https://user-images.githubusercontent.com/68889345/131243047-72cc158e-a628-48b7-921a-c45e98ab2bf1.png)
![Rplot12](https://user-images.githubusercontent.com/68889345/131243048-8a2776e0-332d-44a3-88a9-b060d4633359.png)
![Rplot30MERGERD](https://user-images.githubusercontent.com/68889345/131542542-3dad2624-9762-4c50-b9b4-aa0075cd9db9.png)




## PCA Analysis

*Split the treated data to two : Calibration set = Calib set and validation set = testset, then build PCA model*

```R
ispect = seq(1, 1200, 4)
calibset = SGspectra[-ispect, ]
testset = SGspectra[ispect, ]

Calibpca_model = pca(calibset, 10, scale = TRUE, info = "ACAALA PCA model")
Calibpca_model= selectCompNum(Calibpca_model, 5)
```
+ Access the loadings and the scores

```R
Calibpca_model$loadings[1:4, 1:4]
```

```
   Comp 1     Comp 2      Comp 3     Comp 4
1 0.01511032 0.09008960  0.09061374 -0.1433531
2 0.02491434 0.08134250  0.04010265 -0.2263023
3 0.02880470 0.06849692 -0.01527204 -0.2816507
4 0.02839777 0.05369044 -0.06064988 -0.3126289
```


```R
Calibpca_model$res$cal$scores[1:4, 1:4]
```

```
 Comp 1    Comp 2    Comp 3     Comp 4
SamplesData.NIR.A2 7.752818 -11.89528 0.6831984 -0.5235035
SamplesData.NIR.A3 7.578034 -13.23961 1.8856384 -0.3665607
SamplesData.NIR.A4 7.488082 -12.38351 0.1403219  1.3298068
SamplesData.NIR.A6 7.366403 -10.72870 1.8437984 -1.5862289
```

```R
Predictnmodel = predict(Calibpca_model, testset)
print(Predictnmodel) 
```

```
Results for PCA decomposition (class pcares)
Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
```


+ PCA model with test set validation (we will use testset to validate) 

```R
Calibpca_model = pca(calibset,7,scale = TRUE, x.test=testset, info = "PCA model")
Calibpca_model = selectCompNum(Calibpca_model, 5)
```

*Info for both result objects*

```R
print(Calibpca_model$res$cal)
```

```
Results for PCA decomposition (class pcares)
Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
```

```R
print(Calibpca_model$res$test)
```

```
Results for PCA decomposition (class pcares)

Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
```


*some statistics for evaluation of a model performance*


```
summary(Calibpca_model)
```

```
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
```

```R
var = data.frame(
  cal = Calibpca_model$res$cal$expvar,
  test = Calibpca_model$res$test$expvar)
show(round(var, 1))
```

```
 cal test
Comp 1 48.7 48.0
Comp 2 31.6 32.0
Comp 3  5.0  4.8
Comp 4  2.5  2.7
Comp 5  1.6  1.6
Comp 6  1.0  0.8
Comp 7  0.8  0.7
```
*scores and loadings plots for PC1 vs PC2*

```
par(mfrow = c(1, 1))
mdaplot(Calibpca_model$res$cal$scores, type = "p",show.labels = FALSE, show.lines = c(0, 0))
```

![Rplot13](https://user-images.githubusercontent.com/68889345/131245998-36ae9dfd-d171-4a65-b1af-85e652575a0d.png)


```
mdaplot(Calibpca_model$loadings, type = "p", show.labels = TRUE, show.lines = c(0, 0))
```


![Rplot14](https://user-images.githubusercontent.com/68889345/131246156-1bd2d233-bd03-448b-b212-fc31882f6969.png)


```
ispectra = seq(4, 1200, 4)
Calibpca_modelx = SGspectra[-ispectra, -(c(1,2))]
Calibpca_modely= SGspectra[-ispectra, 2, drop = FALSE]
testset_modelx= SGspectra[ispectra, -(c(1,2))]
testset_modely = SGspectra[ispectra, 2, drop = FALSE]
```

```
PLS_Prediction = pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, info = "Conc. prediction model")
PLS_Prediction = selectCompNum(PLS_Prediction, 3)
```

```
print(PLS_Prediction)
```

```
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
```


```
PLS_Prediction$coeffs$values
```

```
, , 2
           Comp 1        Comp 2        Comp 3        Comp 4        Comp 5
3    0.0127021715  2.228392e-02  1.038451e-01  1.314928e-01  1.829564e-01
4    0.0114796364  2.067413e-02  1.007242e-01  1.261369e-01  1.592348e-01
5    0.0099842869  1.850881e-02  9.429490e-02  1.166764e-01  1.326282e-01
6    0.0079432848  1.548313e-02  8.424283e-02  1.029896e-01  1.014870e-01
7    0.0045402607  1.012265e-02  6.373930e-02  7.602562e-02  5.094549e-02
8   -0.0014090281  1.360429e-04  1.919944e-02  1.903692e-02 -3.968314e-02
9   -0.0091592007 -1.370742e-02 -5.031789e-02 -6.779834e-02 -1.513208e-01
10  -0.0092804071 -1.416348e-02 -4.869353e-02 -6.375498e-02 -1.321779e-01
11  -0.0079995924 -1.246766e-02 -3.495702e-02 -4.707039e-02 -9.299723e-02
12  -0.0059959182 -9.298284e-03 -1.792744e-02 -2.506970e-02 -4.494207e-02
13  -0.0046673257 -7.058577e-03 -6.639405e-03 -1.036305e-02 -1.398493e-02
14  -0.0039123014 -5.631943e-03  9.695134e-04  2.154404e-04  7.492135e-03
15  -0.0035530790 -4.971636e-03  4.383341e-03  4.904589e-03  1.718179e-02
16  -0.0033691506 -4.656188e-03  6.023346e-03  7.791445e-03  2.337747e-02
17  -0.0034593570 -4.940327e-03  4.040719e-03  5.621140e-03  2.122475e-02
18  -0.0036889645 -5.762753e-03 -2.365655e-03 -1.876738e-03  1.182285e-02
19  -0.0036733206 -7.571106e-03 -2.372867e-02 -3.343589e-02 -4.576329e-02
20   0.0028713412  2.546011e-04 -3.501176e-02 -4.837898e-02 -6.527750e-02
21   0.0047725033  4.685739e-03 -1.628226e-02 -2.336201e-02 -3.289687e-02
22   0.0051009001  5.656702e-03 -1.066089e-02 -1.564454e-02 -2.246888e-02
23   0.0052725917  6.086036e-03 -8.191113e-03 -1.242593e-02 -1.852613e-02
24   0.0053782084  6.368680e-03 -6.481656e-03 -1.030324e-02 -1.611728e-02
25   0.0054244750  6.530365e-03 -5.389580e-03 -9.105834e-03 -1.507582e-02
26   0.0053394597  6.464360e-03 -5.369024e-03 -9.346975e-03 -1.614494e-02
27   0.0049222603  5.971733e-03 -6.615839e-03 -1.063867e-02 -1.652677e-02
28   0.0034021914  4.311882e-03 -9.483899e-03 -1.395107e-02 -1.988150e-02
29  -0.0037899148 -3.671697e-03 -1.508380e-02 -2.002839e-02 -2.426162e-02
30  -0.0087157681 -9.609413e-03 -9.051314e-03 -1.002115e-02 -9.919893e-03
31  -0.0087542269 -1.003798e-02 -7.190085e-03 -7.310513e-03 -6.432529e-03
32  -0.0087464112 -1.016477e-02 -7.548391e-03 -7.463697e-03 -6.237433e-03
33  -0.0089894019 -1.062306e-02 -1.004087e-02 -1.049278e-02 -1.011639e-02
34  -0.0091876490 -1.099293e-02 -1.240737e-02 -1.330628e-02 -1.364058e-02
35  -0.0093455834 -1.135143e-02 -1.493594e-02 -1.684599e-02 -1.944744e-02
36  -0.0092807371 -1.144261e-02 -1.627125e-02 -1.741144e-02 -1.667739e-02
37  -0.0089993571 -1.143283e-02 -1.776785e-02 -1.839762e-02 -1.478854e-02
38  -0.0083094006 -1.126922e-02 -2.076411e-02 -2.051929e-02 -1.425124e-02
39  -0.0065230415 -1.005575e-02 -2.360159e-02 -2.198057e-02 -1.138476e-02
40  -0.0031493746 -6.871348e-03 -2.346976e-02 -2.061618e-02 -5.065829e-03
41  -0.0001578518 -3.555881e-03 -1.976766e-02 -1.693231e-02 -1.642287e-03
42   0.0022912842 -1.970373e-04 -1.489370e-02 -1.234564e-02  3.158229e-03
43   0.0037168468  3.174251e-03 -5.168510e-03 -1.984310e-03  1.521137e-02
44   0.0020696271  3.939605e-03  4.847315e-03  7.077908e-03  1.485071e-02
45  -0.0006232272  2.312647e-03  9.986764e-03  1.191648e-02  1.418384e-02
46  -0.0026138800  2.135797e-04  8.474860e-03  9.455972e-03  8.361870e-03
47  -0.0035175943 -8.381080e-04  7.442714e-03  8.054597e-03  6.077371e-03
48  -0.0039179870 -1.337528e-03  6.737304e-03  7.104517e-03  4.731182e-03
49  -0.0043171563 -1.871531e-03  5.764575e-03  5.730282e-03  1.976404e-03
50  -0.0046240967 -2.201959e-03  6.051677e-03  5.923302e-03  1.592661e-03
51  -0.0049283434 -2.569721e-03  5.885766e-03  5.578074e-03  9.241822e-04
52  -0.0049834882 -2.568111e-03  6.744355e-03  6.635334e-03  2.463959e-03
53  -0.0049719499 -2.523706e-03  7.219307e-03  7.216551e-03  2.687907e-03
54  -0.0049364650 -2.310413e-03  9.970310e-03  1.089449e-02  6.481363e-03
55   0.0009471541  7.155225e-04  1.239678e-02  1.869116e-02  2.238672e-02
56   0.0043050673  2.115483e-03 -2.832140e-03 -1.188383e-03  3.559079e-03
57   0.0044424072  2.113206e-03 -4.513018e-03 -3.576618e-03  5.170053e-04
58   0.0046465709  2.357708e-03 -4.358565e-03 -3.476232e-03  9.219508e-04
59   0.0048084688  2.555954e-03 -4.217048e-03 -3.388395e-03  1.033482e-03
60   0.0050082235  2.808009e-03 -3.992797e-03 -3.131049e-03  1.411872e-03
61   0.0053071698  3.223319e-03 -3.213952e-03 -2.243201e-03  2.627156e-03
62   0.0056011646  3.648759e-03 -2.288991e-03 -1.425735e-03  3.284142e-03
63   0.0058552050  4.037563e-03 -1.287255e-03 -5.957100e-04  3.582774e-03
64   0.0059763997  4.308182e-03  1.997318e-04  4.534752e-04  3.219912e-03
65   0.0053955606  3.992756e-03  4.327378e-03  3.488819e-03  2.023388e-03
66   0.0005493935  9.561569e-04  2.292988e-02  2.022847e-02  9.272436e-03
67  -0.0062177806 -4.118684e-03  2.165121e-02  1.908096e-02  6.056519e-03
68  -0.0065239753 -4.280664e-03  1.999338e-02  1.791066e-02  5.222954e-03
69  -0.0054821661 -3.462376e-03  2.395076e-02  2.107737e-02  5.465194e-03
70   0.0001138572  3.881778e-04  2.076006e-02  1.663960e-02  3.827587e-04
71   0.0037267122  2.795600e-03  1.032969e-02  7.077662e-03 -3.099689e-03
72   0.0044674577  3.186460e-03  6.168643e-03  2.957994e-03 -5.196875e-03
73   0.0053610161  4.165938e-03  5.140496e-03  1.106258e-03 -8.322162e-03
74   0.0077232533  7.882030e-03  8.562311e-03  3.139529e-03 -8.151155e-03
75   0.0039440435  6.234154e-03  5.246529e-03  8.223434e-04 -8.800775e-03
76  -0.0001012399  2.255386e-03  1.872275e-03  4.023800e-04 -2.643618e-03
77  -0.0019217477  2.791271e-04  4.148534e-04  3.139581e-04  2.607386e-04
78  -0.0032988501 -1.338473e-03 -1.321459e-03 -9.233272e-04  1.082059e-04
79  -0.0043812360 -2.667086e-03 -2.876167e-03 -2.098515e-03 -2.675243e-04
80  -0.0051226734 -3.562402e-03 -3.511554e-03 -2.451569e-03 -7.451398e-05
81  -0.0056013193 -4.141525e-03 -3.764919e-03 -2.349234e-03  5.678665e-04
82  -0.0058142728 -4.435955e-03 -4.208855e-03 -2.336203e-03  1.810483e-03
83  -0.0056361906 -4.264224e-03 -4.521794e-03 -2.480597e-03  2.081395e-03
84  -0.0049294321 -3.513059e-03 -5.034703e-03 -3.321002e-03  5.410491e-04
85  -0.0033392400 -1.713869e-03 -4.103858e-03 -3.750962e-03 -2.707729e-03
86  -0.0008077269  6.662800e-04 -4.689388e-03 -7.367316e-03 -1.276955e-02
87   0.0020250012  2.424620e-03 -6.401155e-04 -7.559363e-03 -2.228791e-02
88  -0.0006261687 -2.199652e-03 -9.816876e-04 -8.612703e-03 -2.504015e-02
89  -0.0007893987 -2.289244e-03  3.365288e-03 -1.085144e-03 -1.172988e-02
90  -0.0012216420 -2.853364e-03  2.490518e-03 -1.721214e-03 -1.283904e-02
91  -0.0023455811 -4.013493e-03  1.926495e-03 -1.012948e-03 -1.008296e-02
92  -0.0037985641 -5.258260e-03  2.858035e-03  3.569973e-03  4.072927e-03
93  -0.0053776178 -6.935801e-03 -3.516195e-04  2.127046e-03  6.709484e-03
94  -0.0067092765 -8.269908e-03 -3.734646e-03 -1.616483e-04  7.960055e-03
95  -0.0080099785 -9.569585e-03 -9.336914e-03 -6.584628e-03 -3.132878e-04
96  -0.0071589081 -7.241838e-03 -1.018298e-02 -7.529231e-03 -3.180333e-03
97  -0.0039139711 -2.828643e-03 -8.248015e-03 -6.438017e-03 -2.782716e-03
98  -0.0032429609 -1.900862e-03 -7.195904e-03 -6.328932e-03 -3.512496e-03
99  -0.0034727619 -2.129543e-03 -7.314355e-03 -6.756774e-03 -4.351990e-03
100 -0.0042841612 -3.052054e-03 -7.823986e-03 -7.233940e-03 -4.209319e-03
101 -0.0055811266 -4.609476e-03 -8.711294e-03 -8.064672e-03 -5.071968e-03
102 -0.0076992307 -7.580342e-03 -1.248216e-02 -1.108635e-02 -5.358961e-03
103 -0.0091235536 -1.070637e-02 -1.463845e-02 -1.275169e-02 -5.342948e-03
104 -0.0045959313 -7.196045e-03 -8.199438e-03 -7.225381e-03 -3.681400e-03
105 -0.0005640568 -3.017133e-03 -3.063933e-03 -2.384627e-03 -7.263913e-04
106  0.0015568638 -7.986428e-04 -2.085444e-03 -2.394304e-03 -3.403779e-03
107  0.0030148309  9.016912e-04 -2.655241e-04 -2.488405e-04 -1.245057e-04
108  0.0042313257  2.406674e-03  1.660425e-03  1.811824e-03  1.907013e-03
109  0.0052625817  3.735446e-03  3.422062e-03  3.650959e-03  3.895576e-03
110  0.0058069483  4.500141e-03  4.896905e-03  5.153318e-03  4.881967e-03
111  0.0053836181  4.131971e-03  6.182791e-03  6.396564e-03  5.553532e-03
112  0.0034872116  2.157347e-03  7.382226e-03  8.381139e-03  8.822963e-03
113  0.0001333202 -1.235682e-03  7.030734e-03  7.792582e-03  6.812842e-03
114  0.0005599663  8.818681e-04  1.848914e-02  1.808649e-02  1.083529e-02
115  0.0061286195  9.082344e-03  1.783005e-02  1.586635e-02  6.970888e-03
116  0.0067192397  9.435758e-03  1.251410e-02  1.053280e-02  4.448409e-03
117  0.0067474530  9.178490e-03  9.403847e-03  7.184980e-03  1.521018e-03
118  0.0065666340  8.851046e-03  7.552036e-03  5.437956e-03  8.089724e-04
119  0.0061406744  8.307563e-03  5.552146e-03  3.171148e-03 -1.787124e-03
120  0.0058026862  8.008319e-03  5.264567e-03  3.550720e-03  8.154850e-05
121  0.0055862249  7.778764e-03  4.801488e-03  3.510330e-03  1.273878e-03
122  0.0051352651  7.260420e-03  3.546208e-03  2.671806e-03  1.164298e-03
123  0.0042036457  6.354766e-03  2.744473e-03  2.514544e-03  1.558244e-03
124  0.0023591050  4.558087e-03  2.355054e-03  4.308672e-03  6.291531e-03
125 -0.0021700930 -6.161218e-04 -1.979786e-03  2.699383e-03  8.569268e-03
126 -0.0073164871 -7.541867e-03 -6.391221e-03 -8.921755e-05  8.106532e-03
127 -0.0076184110 -8.990377e-03 -6.054305e-03 -8.281465e-04  6.791666e-03
128 -0.0061897836 -8.156372e-03 -5.896334e-03 -1.804111e-03  3.593163e-03
129 -0.0032007776 -5.362544e-03 -3.226059e-03  7.739614e-05  3.283326e-03
130  0.0018394956  5.854745e-05  2.496327e-03  5.432123e-03  7.845628e-03
131  0.0046933686  3.315630e-03  5.341491e-03  7.097746e-03  8.790323e-03
132  0.0053112404  4.039894e-03  6.101090e-03  6.943830e-03  7.445137e-03
133  0.0051747572  3.820793e-03  5.609743e-03  5.720628e-03  5.387719e-03
134  0.0048353833  3.360229e-03  4.868419e-03  4.259729e-03  3.030071e-03
135  0.0044699148  2.896627e-03  4.284751e-03  3.064271e-03  1.188432e-03
136  0.0041656912  2.564147e-03  4.286372e-03  2.592142e-03  2.013383e-04
137  0.0036739272  1.957994e-03  3.392786e-03  9.267085e-04 -2.480734e-03
138  0.0031316163  1.300079e-03  2.404566e-03 -8.733146e-04 -5.743553e-03
139  0.0025869339  6.689959e-04  1.591377e-03 -2.463700e-03 -8.488659e-03
140  0.0019687804 -4.756890e-05  5.738542e-04 -4.025044e-03 -1.058812e-02
141  0.0009191303 -1.233382e-03 -8.636968e-04 -5.867910e-03 -1.243420e-02
142 -0.0010446434 -3.404690e-03 -3.432782e-03 -8.462794e-03 -1.398340e-02
143 -0.0036414461 -6.181164e-03 -7.203960e-03 -1.208078e-02 -1.651362e-02
144 -0.0069127293 -9.170328e-03 -1.111933e-02 -1.593323e-02 -1.907360e-02
           Comp 6        Comp 7
3    2.093089e-01  2.204560e-01
4    1.745198e-01  1.783624e-01
5    1.384415e-01  1.371551e-01
6    9.828163e-02  9.366769e-02
7    3.609916e-02  2.800228e-02
8   -7.108604e-02 -8.492933e-02
9   -1.946774e-01 -2.135910e-01
10  -1.610516e-01 -1.609999e-01
11  -1.119339e-01 -1.102837e-01
12  -5.426701e-02 -5.426195e-02
13  -1.695372e-02 -1.662282e-02
14   8.603609e-03  1.017079e-02
15   2.214678e-02  2.697894e-02
16   3.041481e-02  3.620613e-02
17   2.890508e-02  3.504238e-02
18   1.806180e-02  2.053115e-02
19  -5.990335e-02 -8.260643e-02
20  -7.332672e-02 -8.429678e-02
21  -3.462430e-02 -3.556897e-02
22  -2.206981e-02 -1.972251e-02
23  -1.780255e-02 -1.448852e-02
24  -1.554962e-02 -1.278741e-02
25  -1.519220e-02 -1.365710e-02
26  -1.776791e-02 -1.795360e-02
27  -1.849197e-02 -1.983701e-02
28  -2.382740e-02 -2.735553e-02
29  -3.147125e-02 -3.679013e-02
30  -1.445859e-02 -1.952910e-02
31  -7.242847e-03 -8.757252e-03
32  -6.549649e-03 -8.062328e-03
33  -8.967553e-03 -7.791875e-03
34  -1.215375e-02 -9.423644e-03
35  -1.827821e-02 -1.416116e-02
36  -1.349552e-02 -9.856589e-03
37  -9.734614e-03 -5.581142e-03
38  -9.450366e-03 -7.087009e-03
39  -8.779153e-03 -9.570704e-03
40  -4.114279e-03 -7.693377e-03
41  -4.585256e-03 -1.054880e-02
42  -3.065316e-03 -9.195997e-03
43   9.284359e-03  2.624485e-03
44   6.726396e-03 -6.572067e-04
45   9.915612e-03  5.714468e-03
46   6.395036e-03  3.773168e-03
47   5.745032e-03  4.763525e-03
48   4.506391e-03  3.963955e-03
49   1.563891e-03  1.567666e-03
50   1.171410e-03  1.306229e-03
51   7.280279e-04  1.307953e-03
52   2.273567e-03  2.787898e-03
53   1.941981e-03  2.126188e-03
54   4.123331e-03  3.907593e-03
55   1.318690e-02  1.173293e-02
56   1.836297e-03  1.737377e-03
57  -7.856033e-04 -1.186494e-03
58   3.347110e-05 -2.030393e-04
59   3.591403e-04  2.930807e-04
60   7.470755e-04  7.189671e-04
61   2.134619e-03  2.155093e-03
62   2.670349e-03  2.691758e-03
63   2.809213e-03  2.966309e-03
64   1.745860e-03  1.625237e-03
65  -6.948747e-04 -1.845700e-03
66   7.244360e-03  5.461276e-03
67   5.643362e-03  3.187557e-03
68   5.905023e-03  3.183815e-03
69   9.264870e-03  5.354450e-03
70   6.900592e-03  3.369895e-03
71   2.872111e-03  6.882733e-04
72   9.170464e-04  1.825095e-04
73  -1.325380e-03 -2.275963e-03
74   4.426302e-03  4.247252e-03
75  -6.671271e-05  1.784696e-04
76   7.992173e-04  8.228158e-04
77   2.304874e-03  2.619671e-03
78   1.043785e-03  1.366973e-03
79   4.918582e-05  4.953985e-04
80  -2.936144e-04  3.444600e-05
81  -1.482061e-04 -1.461391e-04
82   1.359634e-03  1.793110e-03
83   1.382287e-03  1.892491e-03
84  -1.187267e-04  1.512910e-03
85  -3.206786e-03  2.061479e-04
86  -1.055246e-02  6.069447e-04
87  -1.114908e-02  1.551327e-02
88  -2.012001e-02 -2.763738e-03
89  -1.041272e-02 -1.701875e-03
90  -1.609221e-02 -1.182160e-02
91  -1.558788e-02 -1.339496e-02
92  -1.856113e-04  2.430411e-04
93   1.483329e-03 -5.779908e-05
94   2.376333e-03 -6.347017e-04
95  -8.405630e-03 -1.100952e-02
96  -1.486785e-02 -2.160146e-02
97  -8.045197e-03 -1.305926e-02
98  -3.972353e-03 -5.121519e-03
99  -3.482145e-03 -4.267719e-03
100 -2.248726e-03 -2.176881e-03
101 -2.606076e-03 -1.938703e-03
102 -1.180553e-03  1.145221e-03
103 -1.067479e-03  5.829492e-04
104 -3.985990e-03 -3.753142e-03
105 -2.787324e-03 -3.733629e-03
106 -6.581327e-03 -7.933709e-03
107 -2.636649e-03 -3.301555e-03
108 -1.218771e-03 -2.453354e-03
109  3.710902e-04 -7.580103e-04
110  9.714460e-04  2.850275e-05
111  6.657386e-04 -1.745681e-04
112  3.165480e-03  1.711811e-03
113 -1.227244e-03 -4.227705e-03
114 -1.680369e-03 -4.259642e-03
115 -8.312930e-04 -1.186078e-03
116  1.572640e-03  1.722600e-03
117  1.618397e-04  1.184184e-03
118  5.012903e-04  1.761765e-03
119 -2.080002e-03 -1.565844e-03
120 -4.326629e-05  3.591071e-04
121  1.470519e-03  1.790756e-03
122  1.081550e-03  1.620356e-03
123 -7.434619e-04  4.311241e-04
124  1.974343e-04  2.179732e-03
125 -4.344207e-03 -9.796231e-04
126 -7.432474e-03 -1.863952e-03
127 -4.768830e-03 -2.767654e-05
128 -7.187896e-03 -3.221118e-03
129 -9.490447e-03 -6.810612e-03
130 -3.640903e-03 -5.568798e-04
131  1.107993e-03  3.791419e-03
132  1.704959e-03  3.554547e-03
133  9.738921e-04  1.999355e-03
134 -2.552193e-05  4.726085e-04
135 -2.776863e-04 -4.908171e-05
136  2.687341e-04  1.214203e-04
137 -1.020405e-03 -1.420252e-03
138 -3.441291e-03 -4.027769e-03
139 -5.191241e-03 -6.014626e-03
140 -6.052044e-03 -7.111701e-03
141 -6.319010e-03 -7.317431e-03
142 -6.022588e-03 -6.556530e-03
143 -7.609299e-03 -8.727902e-03
144 -6.627452e-03 -7.735110e-03
attr(,"yaxis.name")
[1] "Predictors"
```

```
par(mfrow = c(1, 1))
plotRegcoeffs(PLS_Prediction)
```

![Rplot15](https://user-images.githubusercontent.com/68889345/131247487-3d5ad63a-9dc1-456a-9611-0c04ea2b1be3.png)


```
plotRegcoeffs(PLS_Prediction, ncomp = 2)
```


![Rplot16](https://user-images.githubusercontent.com/68889345/131247653-2e258294-bcb5-4f8d-a8b9-9dc58d3b7794.png)



```
plot(PLS_Prediction$coeffs, ncomp = 3, type = "b", show.labels = FALSE)
```

![Rplot17](https://user-images.githubusercontent.com/68889345/131247710-f1c3d27f-e427-400b-82d4-8c853800b39f.png)


```
plot(PLS_Prediction$coeffs, ncomp = 2)
```


![Rplot18](https://user-images.githubusercontent.com/68889345/131247958-ea884e81-9f72-47fa-873b-217e99a98b4f.png)


```
show(PLS_Prediction$coeffs$values[, 3, 1])
```

```
            3             4             5             6             7 
 1.038451e-01  1.007242e-01  9.429490e-02  8.424283e-02  6.373930e-02 
            8             9            10            11            12 
 1.919944e-02 -5.031789e-02 -4.869353e-02 -3.495702e-02 -1.792744e-02 
           13            14            15            16            17 
-6.639405e-03  9.695134e-04  4.383341e-03  6.023346e-03  4.040719e-03 
           18            19            20            21            22 
-2.365655e-03 -2.372867e-02 -3.501176e-02 -1.628226e-02 -1.066089e-02 
           23            24            25            26            27 
-8.191113e-03 -6.481656e-03 -5.389580e-03 -5.369024e-03 -6.615839e-03 
           28            29            30            31            32 
-9.483899e-03 -1.508380e-02 -9.051314e-03 -7.190085e-03 -7.548391e-03 
           33            34            35            36            37 
-1.004087e-02 -1.240737e-02 -1.493594e-02 -1.627125e-02 -1.776785e-02 
           38            39            40            41            42 
-2.076411e-02 -2.360159e-02 -2.346976e-02 -1.976766e-02 -1.489370e-02 
           43            44            45            46            47 
-5.168510e-03  4.847315e-03  9.986764e-03  8.474860e-03  7.442714e-03 
           48            49            50            51            52 
 6.737304e-03  5.764575e-03  6.051677e-03  5.885766e-03  6.744355e-03 
           53            54            55            56            57 
 7.219307e-03  9.970310e-03  1.239678e-02 -2.832140e-03 -4.513018e-03 
           58            59            60            61            62 
-4.358565e-03 -4.217048e-03 -3.992797e-03 -3.213952e-03 -2.288991e-03 
           63            64            65            66            67 
-1.287255e-03  1.997318e-04  4.327378e-03  2.292988e-02  2.165121e-02 
           68            69            70            71            72 
 1.999338e-02  2.395076e-02  2.076006e-02  1.032969e-02  6.168643e-03 
           73            74            75            76            77 
 5.140496e-03  8.562311e-03  5.246529e-03  1.872275e-03  4.148534e-04 
           78            79            80            81            82 
-1.321459e-03 -2.876167e-03 -3.511554e-03 -3.764919e-03 -4.208855e-03 
           83            84            85            86            87 
-4.521794e-03 -5.034703e-03 -4.103858e-03 -4.689388e-03 -6.401155e-04 
           88            89            90            91            92 
-9.816876e-04  3.365288e-03  2.490518e-03  1.926495e-03  2.858035e-03 
           93            94            95            96            97 
-3.516195e-04 -3.734646e-03 -9.336914e-03 -1.018298e-02 -8.248015e-03 
           98            99           100           101           102 
-7.195904e-03 -7.314355e-03 -7.823986e-03 -8.711294e-03 -1.248216e-02 
          103           104           105           106           107 
-1.463845e-02 -8.199438e-03 -3.063933e-03 -2.085444e-03 -2.655241e-04 
          108           109           110           111           112 
 1.660425e-03  3.422062e-03  4.896905e-03  6.182791e-03  7.382226e-03 
          113           114           115           116           117 
 7.030734e-03  1.848914e-02  1.783005e-02  1.251410e-02  9.403847e-03 
          118           119           120           121           122 
 7.552036e-03  5.552146e-03  5.264567e-03  4.801488e-03  3.546208e-03 
          123           124           125           126           127 
 2.744473e-03  2.355054e-03 -1.979786e-03 -6.391221e-03 -6.054305e-03 
          128           129           130           131           132 
-5.896334e-03 -3.226059e-03  2.496327e-03  5.341491e-03  6.101090e-03 
          133           134           135           136           137 
 5.609743e-03  4.868419e-03  4.284751e-03  4.286372e-03  3.392786e-03 
          138           139           140           141           142 
 2.404566e-03  1.591377e-03  5.738542e-04 -8.636968e-04 -3.432782e-03 
          143           144           145           146           147 
-7.203960e-03 -1.111933e-02 -5.194129e-03  2.884498e-03  4.465639e-03 
          148           149           150           151           152 
 5.168277e-03  5.526874e-03  5.724851e-03  5.816684e-03  5.700099e-03 
          153           154           155           156           157 
 4.910809e-03  3.101341e-03 -3.030066e-03 -2.161194e-02 -1.786766e-02 
          158           159           160           161           162 
-1.647797e-02 -1.586970e-02 -1.533729e-02 -1.489578e-02 -1.360795e-02 
          163           164           165           166           167 
-1.363000e-02 -1.307447e-02 -1.042802e-02 -6.681764e-03 -1.479746e-03 
          168           169           170           171           172 
 3.785519e-03  8.300326e-03  1.123931e-02  1.175637e-02  7.844235e-03 
          173           174           175           176           177 
-8.356582e-05 -3.984628e-03 -5.646107e-03 -5.798306e-03 -6.940768e-03 
          178           179           180           181           182 
-6.756314e-03 -1.061383e-02 -1.454765e-02 -1.664564e-03  2.528279e-03 
          183           184           185           186           187 
 5.143892e-03  7.015986e-03  8.069010e-03  9.045194e-03  1.013282e-02 
          188           189           190           191           192 
 1.233669e-02  9.114096e-03  1.604641e-03 -2.034023e-03 -3.016668e-03 
          193           194           195           196           197 
-4.266447e-03 -5.415806e-03 -6.663834e-03 -8.671255e-03 -7.424752e-03 
          198           199           200           201           202 
-4.157889e-03 -3.761031e-04  2.353691e-03  3.491625e-03  3.964387e-03 
          203           204           205           206           207 
 3.447322e-03 -3.276884e-03 -9.131303e-04 -8.346724e-04 -6.895652e-04 
          208           209           210           211           212 
 1.847863e-04  2.559392e-04 -7.010829e-03 -1.539202e-02 -2.447409e-02 
          213           214           215           216           217 
-2.464913e-02 -2.987189e-02 -3.229070e-02 -2.987671e-02 -2.600436e-02 
          218           219           220           221           222 
-2.117507e-02 -1.306207e-02 -6.001768e-03  1.394232e-02  2.097387e-02 
          223           224           225           226           227 
 2.481174e-02  2.732536e-02  2.874069e-02  2.915179e-02  2.961950e-02 
          228 
 2.663850e-02 
```


```
summary(PLS_Prediction$coeffs)
```

```
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
```

```
show(getRegcoeffs(PLS_Prediction, ncomp = 3))
```

```
              Estimated
Intercept  1.284445e-03
3          9.421868e-02
4          8.551950e-02
5          7.887888e-02
6          7.463231e-02
7          6.433801e-02
8          2.261767e-02
9         -5.441640e-02
10        -6.057692e-02
11        -3.950666e-02
12        -1.633312e-02
13        -4.996138e-03
14         6.447132e-04
15         2.775189e-03
16         4.073474e-03
17         3.192663e-03
18        -2.591651e-03
19        -5.048613e-02
20        -9.284102e-02
21        -1.977957e-02
22        -8.615754e-03
23        -5.374406e-03
24        -3.840275e-03
25        -3.292272e-03
26        -3.794513e-03
27        -6.356882e-03
28        -1.593428e-02
29        -5.147183e-02
30        -2.108441e-02
31        -1.054891e-02
32        -9.075288e-03
33        -1.146635e-02
34        -1.497502e-02
35        -2.031501e-02
36        -2.643518e-02
37        -3.456479e-02
38        -5.273354e-02
39        -7.505003e-02
40        -8.694608e-02
41        -7.239719e-02
42        -6.110831e-02
43        -2.362401e-02
44         1.843856e-02
45         2.098952e-02
46         9.682648e-03
47         5.894283e-03
48         4.430786e-03
49         3.586660e-03
50         3.679548e-03
51         3.434719e-03
52         3.799449e-03
53         4.469379e-03
54         1.049074e-02
55         4.848434e-02
56        -2.069018e-03
57        -1.799345e-03
58        -1.292936e-03
59        -1.093293e-03
60        -1.024441e-03
61        -9.048051e-04
62        -7.742414e-04
63        -5.454963e-04
64         1.172377e-04
65         4.374509e-03
66         5.283119e-02
67         3.503459e-02
68         2.480641e-02
69         3.592116e-02
70         3.314733e-02
71         1.097832e-02
72         5.555308e-03
73         5.370291e-03
74         1.479736e-02
75         7.712457e-03
76         1.448295e-03
77         2.208133e-04
78        -5.787587e-04
79        -1.155150e-03
80        -1.388320e-03
81        -1.596935e-03
82        -2.102553e-03
83        -2.920888e-03
84        -4.712826e-03
85        -6.229154e-03
86        -1.359825e-02
87        -3.610479e-03
88        -3.931069e-03
89         1.020162e-02
90         6.914751e-03
91         5.008741e-03
92         7.034272e-03
93        -8.676110e-04
94        -1.007912e-02
95        -3.126636e-02
96        -4.168786e-02
97        -2.281178e-02
98        -1.476904e-02
99        -1.268110e-02
100       -1.309509e-02
101       -1.579429e-02
102       -2.907231e-02
103       -4.488491e-02
104       -1.913459e-02
105       -4.661358e-03
106       -2.459198e-03
107       -2.818276e-04
108        1.704216e-03
109        3.639795e-03
110        5.661094e-03
111        8.340101e-03
112        1.263333e-02
113        1.642684e-02
114        8.183726e-02
115        6.420117e-02
116        2.140995e-02
117        1.127866e-02
118        7.535287e-03
119        5.049744e-03
120        4.563649e-03
121        4.347086e-03
122        3.644395e-03
123        3.470032e-03
124        3.962810e-03
125       -4.588956e-03
126       -1.395070e-02
127       -8.810103e-03
128       -6.654748e-03
129       -3.468658e-03
130        2.425124e-03
131        3.663506e-03
132        3.218076e-03
133        2.536605e-03
134        2.021060e-03
135        1.664403e-03
136        1.558063e-03
137        1.152933e-03
138        7.894346e-04
139        5.285169e-04
140        1.949004e-04
141       -3.149531e-04
142       -1.370996e-03
143       -3.373044e-03
144       -8.370007e-03
145       -4.667899e-03
146        1.015400e-03
147        9.669320e-04
148        8.562666e-04
149        8.113154e-04
150        8.256297e-04
151        9.050169e-04
152        1.050217e-03
153        1.186248e-03
154        1.122281e-03
155       -2.188046e-03
156       -2.443566e-02
157       -8.365405e-03
158       -4.944404e-03
159       -4.040928e-03
160       -3.940194e-03
161       -4.159548e-03
162       -4.211800e-03
163       -4.850324e-03
164       -5.728228e-03
165       -5.336260e-03
166       -3.700279e-03
167       -7.935958e-04
168        2.005542e-03
169        4.577878e-03
170        6.704520e-03
171        8.020384e-03
172        6.262713e-03
173       -7.287955e-05
174       -2.894595e-03
175       -3.249388e-03
176       -2.898138e-03
177       -3.427495e-03
178       -3.915744e-03
179       -9.351694e-03
180       -2.572291e-02
181       -1.888179e-03
182        1.725004e-03
183        2.633953e-03
184        3.182238e-03
185        3.652349e-03
186        4.664902e-03
187        7.192926e-03
188        1.667742e-02
189        1.786295e-02
190        1.452201e-03
191       -1.239047e-03
192       -1.556603e-03
193       -2.090964e-03
194       -2.734910e-03
195       -3.593373e-03
196       -4.999314e-03
197       -4.313924e-03
198       -2.263153e-03
199       -1.656497e-04
200        9.373754e-04
201        1.540257e-03
202        2.551214e-03
203        4.541796e-03
204       -3.113285e-03
205       -4.683745e-04
206       -3.256042e-04
207       -2.493443e-04
208        7.279098e-05
209        1.228999e-04
210       -4.060112e-03
211       -9.640169e-03
212       -1.338294e-02
213       -1.086450e-02
214       -1.070703e-02
215       -9.451540e-03
216       -7.339089e-03
217       -5.563297e-03
218       -4.093922e-03
219       -2.350536e-03
220       -1.045697e-03
221        1.756919e-03
222        2.064432e-03
223        2.193939e-03
224        2.398578e-03
225        2.700640e-03
226        3.193350e-03
227        4.225665e-03
228        5.494479e-03
attr(,"name")
[1] "Regression coefficients for  2"
```



```
print(PLS_Prediction$res$cal)
```

```
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
```

```
print(PLS_Prediction$res$cal$xdecomp)
```

```
Results of data decomposition (class ldecomp).

Major fields:
$scores - matrix with score values
$T2 - matrix with T2 distances
$Q - matrix with Q residuals
$ncomp.selected - selected number of components
$expvar - explained variance for each component
$cumexpvar - cumulative explained variance
```


```
Predict_testset = predict(PLS_Prediction, testset_modelx, testset_modely)
print(Predict_testset)
```

```
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
```



```
print(Predict_testset$rmse)
```

```
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
```

```
PLS_Prediction1 = pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, ncomp.selcrit = "min")
show(PLS_Prediction1$ncomp.selected)
```
```
[1] 7
```

```
PLS_Prediction2 = pls(Calibpca_modelx, Calibpca_modely, 7, scale = TRUE, cv = 1, ncomp.selcrit = "wold")
show(PLS_Prediction2$ncomp.selected)
```

```
[1] 7
```

#par(mfrow = c(1, 2))

```
plotRMSE(PLS_Prediction1)
```
![Rplot19](https://user-images.githubusercontent.com/68889345/131265583-cb7d2285-54d7-460f-a0ab-d9112b1a1b7b.png)


```
plotRMSE(PLS_Prediction2)
```

![Rplot20](https://user-images.githubusercontent.com/68889345/131265603-eb6bbe9b-1255-43d1-bcd9-6229f40419b3.png)


#par(mfrow = c(1, 2))

```
plotPredictions(PLS_Prediction1)
```

![Rplot21](https://user-images.githubusercontent.com/68889345/131265694-5a3fd950-13c2-4075-a531-c98359ca855d.png)


```
plotPredictions(PLS_Prediction1, ncomp = 1)
```

![Rplot22](https://user-images.githubusercontent.com/68889345/131266274-54ba14ec-6491-4db8-9da0-2b01bbda73f5.png)


```
#par(mfrow = c(2, 2))
plotPredictions(PLS_Prediction1$res$cal)
```

![Rplot23](https://user-images.githubusercontent.com/68889345/131265951-e013ebe4-b317-4077-b18c-ca90bedd38c4.png)

```
plotPredictions(PLS_Prediction1$res$cal, ncomp = 2)
```

![Rplot24](https://user-images.githubusercontent.com/68889345/131265980-e47495a9-4b4f-4af2-8ec0-068a9abd5429.png)

```
plotPredictions(PLS_Prediction1$res$cal, show.stat = TRUE)
```

![Rplot25](https://user-images.githubusercontent.com/68889345/131266001-e5624091-769b-4ede-8166-69eca5288b65.png)

```
plotPredictions(PLS_Prediction1$res$cal, ncomp = 2, show.stat = TRUE)
```

![Rplot28](https://user-images.githubusercontent.com/68889345/131266504-730d78cc-c993-4b94-a9fe-ea7bc6678759.png)


```
plot(PLS_Prediction1)
```

![Rplot26](https://user-images.githubusercontent.com/68889345/131266012-986801be-d808-4073-ad1b-65903359f333.png)

```
plot(PLS_Prediction2)
```

![Rplot27](https://user-images.githubusercontent.com/68889345/131266024-cbfafc73-471a-4102-8829-55100a2a893a.png)

```
ispectraSIMCA = seq(4, 1200, 4)
```

```
Calibpca_modelSimcax = SGspectra[ispectraSIMCA, 1:228]
SGspectra01<-AllmSampleData$SpeciesID
Calibpca_modelSimcay = ClassRef[ispectraSIMCA, 1]
testset_modelSimcax = SGspectra[-ispectraSIMCA, 1:228]
testset_modelSimcay = ClassRef[-ispectraSIMCA, 1]
```

```
s.1090ACAA = SGspectra[1:100,1:228 ]
s.1090ACLA = SGspectra[101:200,1:228 ]
s.1090AALA = SGspectra[201:300,1:228 ]
s.5050ACAA = SGspectra[301:400,1:228 ]
s.5050ACLA = SGspectra[401:500,1:228 ]
s.5050AALA = SGspectra[501:600,1:228 ]
s.9010ACAA = SGspectra[601:700,1:228 ]
s.9010ACLA = SGspectra[701:800,1:228 ]
s.9010AALA = SGspectra[801:900,1:228 ]
s.100AC = SGspectra[901:1000,1:228 ]
s.100AA = SGspectra[1001:1100,1:228 ]
s.100LA = SGspectra[1101:1200,1:228 ]
```

```
Simca_pca_s.1090ACAA = simca(s.1090ACAA, "1090ACAA",ncomp = 3)
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

![Rplot29](https://user-images.githubusercontent.com/68889345/131266840-62d7124e-ea88-45d4-8dd7-57472210ac69.png)




