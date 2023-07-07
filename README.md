# argonaut

An R package about dealing with stratified feature tables.

Please note this package is under active development.

``` r
library(argonaut)
#make some dummy data
sdf <- dummy_strat(2, 3, 4, type = "seq")
 
head(sdf)
```

    ##                       X1 X2 X3 X4
    ## subtype_01|feature_02  2  8 14 20
    ## subtype_01|feature_03  3  9 15 21
    ## subtype_02|feature_02  5 11 17 23
    ## subtype_02|feature_03  6 12 18 24

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = subtype_01
    ## 
    ##        features
    ## samples feature_02 feature_03
    ##      X1          2          3
    ##      X2          5          6
    ##      X3          8          9
    ##      X4         11         12
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_02 feature_03
    ##      X1         14         15
    ##      X2         17         18
    ##      X3         20         21
    ##      X4         23         24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                         X1  X2 X3  X4  X5  X6
    ## subtype_001|feature_01 330 775 55 240 315 415
    ## subtype_001|feature_02 132 310 22  96 126 166
    ## subtype_001|feature_03 264 620 44 192 252 332
    ## subtype_001|feature_05 198 465 33 144 189 249
    ## subtype_002|feature_01 480 828 69 603 582 816
    ## subtype_002|feature_02 480 828 69 603 582 816

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        330        132        264         NA        198
    ##      X2        480        480        960         NA        800
    ##      X3       2565       1026        513         NA        694
    ##      X4       1542        694        347         NA        257
    ##      X5        860       1285        771         NA        696
    ##      X6       3188        348        870         NA       3188
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       7056        860       1075         NA       2395
    ##      X2        958        797       2352         NA        465
    ##      X3        775       1916        620         NA       1380
    ##      X4        828        310       1656         NA        584
    ##      X5       1205        828        241         NA        351
    ##      X6       2106        482        292         NA       2408
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        460        584       1053        513         NA
    ##      X2       2792       1755       3010       2082         NA
    ##      X3       1494       1204        575        257         NA
    ##      X4       1236        460        498        870         NA
    ##      X5         55        698         44        215         NA
    ##      X6         69       2472        138       3985         NA
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA         22        768       3528       2792
    ##      X2         NA         69         51       1916       3090
    ##      X3         NA       1536        264        241         33
    ##      X4         NA        102       1095       1752        115
    ##      X5         NA        440       4135        351        102
    ##      X6         NA        438        440       3010         88
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       3840       3308        192        115        876
    ##      X2        528        542       1206       3490       2168
    ##      X3       3308       3768        653        747       4710
    ##      X4       2168         96        210       2472        144
    ##      X5       1320        603        189        768       1005
    ##      X6       1884       1306        675        306        420
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA        420       2340         88         63
    ##      X2         NA        315       1426       1095        540
    ##      X3         NA        270        252        827       2836
    ##      X4         NA       1872       1164       2710       1215
    ##      X5         NA        709        751        660        189
    ##      X6         NA        972         26       3768        970
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        240        126       1803        653         NA
    ##      X2        603        582        445       1260         NA
    ##      X3       3265       1502       1665         63         NA
    ##      X4        378         52       1288        675         NA
    ##      X5       1872       3005        332        468         NA
    ##      X6       2836        178       1632       3545         NA
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       4278       1332         NA       2139         52
    ##      X2        486        248         NA        972        601
    ##      X3        315       3000         NA        751        356
    ##      X4        582        166         NA        156        992
    ##      X5       3755        816         NA        601       3750
    ##      X6       3606       1804         NA        445        249
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1332         NA        902        333         NA
    ##      X2        992         NA        450       1240         NA
    ##      X3       3864         NA       1800       1932         NA
    ##      X4       1500         NA        835       3000         NA
    ##      X5        415         NA       2020        902         NA
    ##      X6        816         NA       1114       2700         NA
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       4510        900         NA        600       1360
    ##      X2       3600       3000         NA        835        900
    ##      X3       1616        334         NA        404        600
    ##      X4       4208       1616         NA       5260        668
    ##      X5       3342       1052         NA       1671       4208
    ##      X6        292        584         NA        584        730

\#Apply_by()

``` r
#We can apply a function on the stratifiedFeatureTable with the apply_by() function. 

sft = as.stratifiedFeatureTable(sdf)

#MARGIN must be exactly 1, 2 or 3, corresponding to applying a function on all observations (1) per sample, (2) per feature or (3) per subtype.  

#for example, we can collapse to an unstratified feature table by summing all subtypes of the same feature. 
apply_by(X = sft, MARGIN = 3, FUN = sum)
```

    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1      22046       7684       8397       7969       7736
    ##      X2      10439       7788       9900      12890       8564
    ##      X3      17202      14556       6342       5222      10609
    ##      X4      12442       5368       7093      16895       3975
    ##      X5      12824       9436       8483       5636      10301
    ##      X6      14797       8584       5187      18343       8053

\#Preparing to run stratified models

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.4.0      ✔ purrr   1.0.1 
    ## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
    ## ✔ tidyr   1.2.1      ✔ stringr 1.5.0 
    ## ✔ readr   2.1.3      ✔ forcats 0.5.2 
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
x = dummy_strat(10, nfeatures = 10, nsamples = 100, type = "by_subtype", p_missing = .30)
x = as.sft(x)

m = matrix(runif(400), ncol = 4)
y = rnorm(100)

lm(y ~ m) %>% summary
```

    ## 
    ## Call:
    ## lm(formula = y ~ m)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -3.00943 -0.69062 -0.00372  0.64416  2.58311 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -0.04277    0.36132  -0.118    0.906
    ## m1          -0.40985    0.34128  -1.201    0.233
    ## m2          -0.03733    0.34819  -0.107    0.915
    ## m3           0.09034    0.33832   0.267    0.790
    ## m4           0.36299    0.33735   1.076    0.285
    ## 
    ## Residual standard error: 0.9938 on 95 degrees of freedom
    ## Multiple R-squared:  0.02485,    Adjusted R-squared:  -0.01621 
    ## F-statistic: 0.6052 on 4 and 95 DF,  p-value: 0.6598

``` r
lm(y ~ x[,1,][, !is.na(colSums(x[,1,]))]) %>% summary
```

    ## 
    ## Call:
    ## lm(formula = y ~ x[, 1, ][, !is.na(colSums(x[, 1, ]))])
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.7660 -0.6880  0.1362  0.6775  2.1618 
    ## 
    ## Coefficients:
    ##                                                    Estimate Std. Error t value
    ## (Intercept)                                       1.150e-01  3.044e-01   0.378
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_001 -1.858e-05  3.909e-05  -0.475
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_002 -1.837e-05  3.926e-05  -0.468
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_003 -4.028e-05  4.467e-05  -0.902
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_004 -3.299e-05  4.031e-05  -0.818
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_006  3.284e-05  4.294e-05   0.765
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_007  2.687e-05  4.414e-05   0.609
    ##                                                  Pr(>|t|)
    ## (Intercept)                                         0.706
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_001    0.636
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_002    0.641
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_003    0.369
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_004    0.415
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_006    0.446
    ## x[, 1, ][, !is.na(colSums(x[, 1, ]))]subtype_007    0.544
    ## 
    ## Residual standard error: 1.001 on 93 degrees of freedom
    ## Multiple R-squared:  0.03075,    Adjusted R-squared:  -0.03179 
    ## F-statistic: 0.4917 on 6 and 93 DF,  p-value: 0.8131
