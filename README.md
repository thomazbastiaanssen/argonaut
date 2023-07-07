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
    ## subtype_02|feature_01  4 10 16 22
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
    ## samples feature_01 feature_02 feature_03
    ##      X1         NA          2         NA
    ##      X2         NA          5         NA
    ##      X3         NA          8         NA
    ##      X4         NA         11         NA
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03
    ##      X1          4         14          6
    ##      X2         10         17         12
    ##      X3         16         20         18
    ##      X4         22         23         24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                          X1  X2   X3   X4  X5   X6
    ## subtype_001|feature_01 1450 405 4645 3885 140 4740
    ## subtype_001|feature_02 1740 486 5574 4662 168 5688
    ## subtype_001|feature_03 1160 324 3716 3108 112 3792
    ## subtype_001|feature_04 1160 324 3716 3108 112 3792
    ## subtype_001|feature_05  870 243 2787 2331  84 2844
    ## subtype_002|feature_01  336 213  697  950 755  170

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1450       1740       1160       1160        870
    ##      X2        336       1266       1680       1344        336
    ##      X3        633         80        633       1266        633
    ##      X4        400       1704        400       3230       2192
    ##      X5        548       2584       3288         10       2556
    ##      X6       1278        602       2556        324        920
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        736         NA        920        852       1292
    ##      X2       3230         NA       3230       1880        602
    ##      X3       1204         NA        301       6490         50
    ##      X4        405         NA         50          3        243
    ##      X5        213         NA        324       3716        213
    ##      X6        940         NA       1065       2788        940
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         35         50        940        478       5272
    ##      X2       1318        486         35       1210       1944
    ##      X3        972       1880       7908          8       4125
    ##      X4       3300          7       1944       3108       2596
    ##      X5       6490       1296       4125       3800        246
    ##      X6        492       5192       6490         52         15
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       4645        246        123         NA         NA
    ##      X2        697         15         15         NA         NA
    ##      X3        239       5574       3716         NA         NA
    ##      X4        215        478       3485         NA         NA
    ##      X5       1512         43        239         NA         NA
    ##      X6       2124       2832        215         NA         NA
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1640         NA       9072         NA       2787
    ##      X2       1210         NA       4248         NA        697
    ##      X3        648         NA       2050         NA        239
    ##      X4       3885         NA       1210         NA       6048
    ##      X5        950         NA        162         NA       4248
    ##      X6         26         NA         40         NA       2050
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        275        968       3108         NA        484
    ##      X2       1987        324       4750         NA        324
    ##      X3       3297         40         26         NA         40
    ##      X4       3464       4662        275         NA       2331
    ##      X5       2460         52      11922         NA        950
    ##      X6        412         55       6594         NA         26
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        140         NA       4330         NA       7948
    ##      X2        755         NA       2460         NA       6594
    ##      X3        538         NA        103         NA       4330
    ##      X4        255         NA         45         NA        984
    ##      X5        412         NA        112         NA        206
    ##      X6       2568         NA       3775         NA         45
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        584       4396        538       2460         84
    ##      X2       7720       1968        255          9        755
    ##      X3        968        206       2472        112        538
    ##      X4       4740         45       5136       3020       1648
    ##      X5        170        168        730       1076       5136
    ##      X6        671       1076       7720       7720        730
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        225         51        242         NA       3088
    ##      X2        199       3424         10         NA        484
    ##      X3       1230       6176       3792         NA         10
    ##      X4       5756        484        850         NA       2844
    ##      X5        525         10        671         NA        170
    ##      X6       1116       5688        225         NA        671
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA       1342       1194          2        796
    ##      X2         NA         45       2460       3792       2460
    ##      X3         NA       1640       7195        680       7195
    ##      X4         NA        420        525       1342        210
    ##      X5         NA        558        279        525        558
    ##      X6         NA          5          5          1          5

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
    ##      X1       9730       8793      21627       4952      22621
    ##      X2      17452       7528      19143       8235      14196
    ##      X3       9729      15596      28196       8556      17160
    ##      X4      22420       7800      13920      10703      19096
    ##      X5      13280       4711      21852       9127      14283
    ##      X6       9627      15450      28685      10885       5402

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
    ## -2.25583 -0.67317 -0.03282  0.62983  1.93290 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -0.269773   0.333091  -0.810    0.420
    ## m1           0.310311   0.332985   0.932    0.354
    ## m2          -0.194436   0.330313  -0.589    0.557
    ## m3           0.005769   0.363350   0.016    0.987
    ## m4           0.088322   0.321191   0.275    0.784
    ## 
    ## Residual standard error: 0.9475 on 95 degrees of freedom
    ## Multiple R-squared:  0.01282,    Adjusted R-squared:  -0.02874 
    ## F-statistic: 0.3085 on 4 and 95 DF,  p-value: 0.8717

``` r
lm(y ~ x[,1,][,apply( x[,1,],2,function(xx) !any(is.na(xx)))]) %>% summary
```

    ## 
    ## Call:
    ## lm(formula = y ~ x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))])
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.19590 -0.59812 -0.08575  0.57735  2.17682 
    ## 
    ## Coefficients:
    ##                                                                           Estimate
    ## (Intercept)                                                             -2.677e-01
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_001  5.368e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_003  1.039e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_004 -3.585e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_005 -4.279e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_006  1.640e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_008  6.241e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_010 -1.955e-05
    ##                                                                         Std. Error
    ## (Intercept)                                                              3.779e-01
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_001  5.095e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_003  4.131e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_004  5.115e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_005  5.009e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_006  5.290e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_008  5.098e-05
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_010  5.077e-05
    ##                                                                         t value
    ## (Intercept)                                                              -0.708
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_001   1.053
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_003   0.252
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_004  -0.701
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_005  -0.854
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_006   0.310
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_008   1.224
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_010  -0.385
    ##                                                                         Pr(>|t|)
    ## (Intercept)                                                                0.481
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_001    0.295
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_003    0.802
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_004    0.485
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_005    0.395
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_006    0.757
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_008    0.224
    ## x[, 1, ][, apply(x[, 1, ], 2, function(xx) !any(is.na(xx)))]subtype_010    0.701
    ## 
    ## Residual standard error: 0.9447 on 92 degrees of freedom
    ## Multiple R-squared:  0.0497, Adjusted R-squared:  -0.0226 
    ## F-statistic: 0.6874 on 7 and 92 DF,  p-value: 0.6824

``` r
lm(y ~ x[,1,][,apply(!is.na(x[,1,]),2,any)]) %>% summary
```

    ## 
    ## Call:
    ## lm(formula = y ~ x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)])
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.19590 -0.59812 -0.08575  0.57735  2.17682 
    ## 
    ## Coefficients:
    ##                                                          Estimate Std. Error
    ## (Intercept)                                            -2.677e-01  3.779e-01
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_001  5.368e-05  5.095e-05
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_003  1.039e-05  4.131e-05
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_004 -3.585e-05  5.115e-05
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_005 -4.279e-05  5.009e-05
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_006  1.640e-05  5.290e-05
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_008  6.241e-05  5.098e-05
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_010 -1.955e-05  5.077e-05
    ##                                                        t value Pr(>|t|)
    ## (Intercept)                                             -0.708    0.481
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_001   1.053    0.295
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_003   0.252    0.802
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_004  -0.701    0.485
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_005  -0.854    0.395
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_006   0.310    0.757
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_008   1.224    0.224
    ## x[, 1, ][, apply(!is.na(x[, 1, ]), 2, any)]subtype_010  -0.385    0.701
    ## 
    ## Residual standard error: 0.9447 on 92 degrees of freedom
    ## Multiple R-squared:  0.0497, Adjusted R-squared:  -0.0226 
    ## F-statistic: 0.6874 on 7 and 92 DF,  p-value: 0.6824
