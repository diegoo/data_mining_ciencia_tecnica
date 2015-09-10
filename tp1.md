---
title: Data Mining en Ciencia y Técnica - TP1
author: grupo _
output: pdf_document
---

TP1
===

Cargamos el dataset:


```r
glx <- read.csv("COMBO17.csv", header = T, stringsAsFactors = F)
```

# Tarea 1

str(glx) -> problema: la variable e.W420FE es de tipo 'chr'. La convertimos a numérica:


```r
glx$e.W420FE <- as.numeric(glx$e.W420FE)
```

```
## Warning: NAs introduced by coercion
```

# Tarea 2

(Esta no sé; mirando gráficos no veo outliers tan evidentes como en la variable de ejemplo)


```r
library(ggplot2)
library(gridExtra)

p1 <- qplot(BjMAG, S280MAG-BjMAG, data = glx)
p2 <- qplot(BbMAG, S280MAG-BbMAG, data = glx)
p3 <- qplot(UjMAG, S280MAG-UjMAG, data = glx)
p4 <- qplot(UbMAG, S280MAG-UbMAG, data = glx)
p5 <- qplot(VjMAG, S280MAG-VjMAG, data = glx)
p6 <- qplot(VnMAG, S280MAG-VnMAG, data = glx)
p7 <- qplot(usMAG, S280MAG-usMAG, data = glx)
p8 <- qplot(gsMAG, S280MAG-gsMAG, data = glx)
p9 <- qplot(rsMAG, S280MAG-rsMAG, data = glx)
grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, ncol=2, nrow=5)
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

```
## Warning: Removed 24 rows containing missing values (geom_point).
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 


```r
h1 <- qplot(BjMAG, data = glx)
h2 <- qplot(BbMAG, data = glx)
h3 <- qplot(UjMAG, data = glx)
h4 <- qplot(UbMAG, data = glx)
h5 <- qplot(VjMAG, data = glx)
h6 <- qplot(VnMAG, data = glx)
h7 <- qplot(usMAG, data = glx)
h8 <- qplot(gsMAG, data = glx)
h9 <- qplot(rsMAG, data = glx)
grid.arrange(h1, h2, h3, h4, h5, h6, h7, h8, h9, ncol=3, nrow=3)
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png) 


```r
b1 <- qplot(factor(0), BjMAG, geom = "boxplot", xlab="", data=glx)
b2 <- qplot(factor(0), BbMAG, geom = "boxplot", xlab="", data=glx)
b3 <- qplot(factor(0), UjMAG, geom = "boxplot", xlab="", data=glx)
b4 <- qplot(factor(0), UbMAG, geom = "boxplot", xlab="", data=glx)
b5 <- qplot(factor(0), VjMAG, geom = "boxplot", xlab="", data=glx)
b6 <- qplot(factor(0), VnMAG, geom = "boxplot", xlab="", data=glx)
b7 <- qplot(factor(0), usMAG, geom = "boxplot", xlab="", data=glx)
b8 <- qplot(factor(0), gsMAG, geom = "boxplot", xlab="", data=glx)
b9 <- qplot(factor(0), rsMAG, geom = "boxplot", xlab="", data=glx)
b10 <- qplot(factor(0), ApDRmag, geom = "boxplot", xlab="", data=glx)
grid.arrange(b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, ncol=4, nrow=3)
```

```
## Warning: Removed 1 rows containing non-finite values (stat_boxplot).
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) 

# Tarea 3

Miramos si alguna variable (i.e., columna) tiene valores faltante:


```r
apply(glx, 2, function(x) anyNA(x))
```

```
##       Nr     Rmag   e.Rmag  ApDRmag    mumax      Mcz    e.Mcz    MCzml 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##  chi2red    UjMAG  e.UjMAG    BjMAG  e.BjMAG    VjMAG  e.VjMAG    usMAG 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##  e.usMAG    gsMAG  e.gsMAG    rsMAG  e.rsMAG    UbMAG  e.UbMAG    BbMAG 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##  e.BbMAG    VnMAG  e.VbMAG  S280MAG e.S280MA   W420FE e.W420FE   W462FE 
##    FALSE     TRUE     TRUE     TRUE     TRUE    FALSE     TRUE    FALSE 
## e.W462FE   W485FD e.W485FD   W518FE e.W518FE   W571FS e.W571FS   W604FE 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
## e.W604FE   W646FD e.W646FD   W696FE e.W696FE   W753FE e.W753FE   W815FS 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
## e.W815FS   W856FD e.W856FD   W914FD e.W914FD   W914FE e.W914FE      UFS 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##    e.UFS      BFS    e.BFS      VFD    e.VFD      RFS    e.RFS      IFD 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##    e.IFD 
##    FALSE
```

De las variables de interés, hay 2 con datos faltantes: *VnMAG*, *S280MAG*


```r
faltantes_VnMAG <- which(is.na(glx$VnMAG))
faltantes_S280MAG <- which(is.na(glx$S280MAG))
faltantes_VnMAG
```

```
## [1] 3446
```

```r
faltantes_S280MAG
```

```
##  [1]   23   41   90  160  364  386  416  493  577  970 1024 1428 1457 1531
## [15] 1532 1558 2266 2512 2817 2887 2891 2937 3424 3446
```

Son 24 registros en total. Los borramos:


```r
glx_sin_faltantes <- glx[complete.cases(glx[,c(26, 28)]),]
dim(glx)[1] - 24 == dim(glx_sin_faltantes)[1]
```

```
## [1] TRUE
```

# Tarea 4

(no empecé)
