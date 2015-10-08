---
title: Data Mining en Ciencia y Técnica - TP1
author: Ariel Aguirre, Miguel Barros, José Badillo, Diego Dell'Era
output: pdf_document
---

TP1 - parte 2
=============




Quitamos outliers:


```r
glx_sin_outliers <- subset(glx, apd_rmag > -3.2)
glx_sin_outliers <- subset(glx_sin_outliers, bjmag < -7.0)
glx_sin_outliers <- subset(glx_sin_outliers, ujmag < -10.0)
glx_sin_outliers <- subset(glx_sin_outliers, vjmag < -10.0)
glx_sin_outliers <- subset(glx_sin_outliers, usmag < -10.0)
glx_sin_outliers <- subset(glx_sin_outliers, gsmag < -9.0)
glx_sin_outliers <- subset(glx_sin_outliers, rsmag < -9.0)
# glx_sin_outliers <- subset(glx_sin_outliers, bbmag < -9.0) # todos los valores en 0?
# glx_sin_outliers <- subset(glx_sin_outliers, ubmag < -10.0) # todos los valores en 0?
# glx_sin_outliers <- subset(glx_sin_outliers, vbmag < -10.0) # todos los valores en 0? (antes era vnmag)

nrow(glx) - nrow(glx_sin_outliers)
```

```
## [1] 8181
```

Buscamos datos faltantes:


```r
apply(glx_sin_outliers, 2, function(x) anyNA(x))
```

```
##      seq      rah      ram      ras      de_      ded      dem      des 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##        x        y     rmag   e_rmag  ap_rmag apd_rmag mc_class     mc_z 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##    ujmag    bjmag    vjmag    usmag    gsmag    rsmag    ubmag    bbmag 
##    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE    FALSE 
##    vbmag  s280mag 
##    FALSE     TRUE
```

```r
glx_sin_faltantes <- glx_sin_outliers[complete.cases(glx_sin_outliers),]
nrow(glx_sin_outliers) - nrow(glx_sin_faltantes)
```

```
## [1] 720
```



