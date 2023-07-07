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
    ## subtype_01|feature_01  1  7 13 19
    ## subtype_01|feature_02  2  8 14 20
    ## subtype_02|feature_01  4 10 16 22
    ## subtype_02|feature_02  5 11 17 23

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = subtype_01
    ## 
    ##        features
    ## samples feature_01 feature_02
    ##      X1          1          2
    ##      X2          4          5
    ##      X3          7          8
    ##      X4         10         11
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_01 feature_02
    ##      X1         13         14
    ##      X2         16         17
    ##      X3         19         20
    ##      X4         22         23

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                          X1   X2   X3   X4    X5   X6
    ## subtype_001|feature_01 4188 6496  188 3888 11596 4580
    ## subtype_001|feature_02 1047 1624   47  972  2899 1145
    ## subtype_001|feature_03 2094 3248   94 1944  5798 2290
    ## subtype_001|feature_04 5235 8120  235 4860 14495 5725
    ## subtype_002|feature_01   34  720 1431  442    42 1520
    ## subtype_002|feature_02  102 2160 4293 1326   126 4560

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       4188       1047       2094       5235         NA
    ##      X2         34        102         34          6         NA
    ##      X3       6606         12         15       1101         NA
    ##      X4        312       3303         78        468         NA
    ##      X5       7736        156       1266      11604         NA
    ##      X6        196       5802       2324        588         NA
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2532        980       5784         NA         NA
    ##      X2       2324       2532       3248         NA         NA
    ##      X3       6496       1743        720         NA         NA
    ##      X4        720       5784         10         NA         NA
    ##      X5       2892       1624        610         NA         NA
    ##      X6       2440       2160       1256         NA         NA
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA          8       4404       2532         12
    ##      X2         NA       1446       9644       8120       6606
    ##      X3         NA       1220         94          4        234
    ##      X4         NA       2202       1431        482       3868
    ##      X5         NA       6215         15       3660        980
    ##      X6         NA       2512       1070       4404       3798
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2936       3303         NA       3729       2905
    ##      X2       1243       9644         NA       2512       4338
    ##      X3       2512         47         NA        235          8
    ##      X4       4404       4293         NA          6       2892
    ##      X5        188         12         NA       1120       1830
    ##      X6       1431       3360         NA       6420       1468
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       6720       2140        172      22278       6215
    ##      X2       4280      11139       5500        144       3768
    ##      X3      14852        240       2860        344       5505
    ##      X4         48        344       1944       4860       7233
    ##      X5        344       4125        442          4         12
    ##      X6       5500       2860         10       1944       6720
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       3888        972         NA        144       3210
    ##      X2        442       1326         NA       5214       7426
    ##      X3      11664          8         NA       2328        240
    ##      X4         96       5832         NA       3246        516
    ##      X5       3476         48         NA      14495       6875
    ##      X6        776       2607         NA          2       2145
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       3246       3880         NA        159          8
    ##      X2       2432       3246         NA       6018      11664
    ##      X3      11596       1824         NA      10764         72
    ##      X4         42       7984         NA       1377       1738
    ##      X5        954       2899         NA        386       3880
    ##      X6       4012        126         NA       5725       4869
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       7176          4         24          0       3040
    ##      X2        459        477       1623       1198       5988
    ##      X3        386       2006       2432        108          4
    ##      X4         44       5382       7984      12750        954
    ##      X5       4580       2295       5798       1476       3009
    ##      X6       1520        386         42       2610       3588
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       7188         33          5         NA       2295
    ##      X2         72       1704       1003         NA        579
    ##      X3       8500       1145        193         NA         55
    ##      X4        492       4560         44         NA       1278
    ##      X5       2610          0       1704         NA          0
    ##      X6       4132       3594       2290         NA       7188
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA         36       1520         NA         54
    ##      X2         NA       6375          0         NA       4250
    ##      X3         NA       2460         18         NA       2460
    ##      X4         NA       2610       1305         NA       3915
    ##      X5         NA       3099       4132         NA       5165
    ##      X6         NA       2324       2324         NA       1743

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
    ##      X1      37874      12403      14003      34077      17739
    ##      X2      11286      37991      21052      23212      44619
    ##      X3      62612      10705       6332      14884       8578
    ##      X4       6158      42294      12796      23189      22394
    ##      X5      22780      20473      13967      32745      21751
    ##      X6      20007      25731       9316      21693      31519

\#Running statistical models on stratified feature tables

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
y = rnorm(100)

x = dummy_strat(10, 
                nfeatures = 10, 
                nsamples = 100, 
                type = "by_subtype", 
                p_missing = .30) %>% 
  as.sft()

z = sample(LETTERS[1:3], 100, replace = T)


#The getFeature function extracts features by name and returns a table with each subtype of that feature, per sample. 
#getFeatures integrates with models and apply. 

#Run a model with each subtype as a predictor
lm(y ~ getFeature(x, 1) * z) %>% summary
```

    ## 
    ## Call:
    ## lm(formula = y ~ getFeature(x, 1) * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -1.58723 -0.47097 -0.02113  0.50263  2.51594 
    ## 
    ## Coefficients:
    ##                                  Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)                    -3.565e-01  2.646e-01  -1.347    0.182
    ## getFeature(x, 1)subtype_003     8.187e-05  6.923e-05   1.183    0.240
    ## getFeature(x, 1)subtype_004    -1.909e-04  1.547e-04  -1.234    0.221
    ## getFeature(x, 1)subtype_005    -4.289e-05  8.216e-05  -0.522    0.603
    ## getFeature(x, 1)subtype_008     3.564e-06  6.967e-05   0.051    0.959
    ## getFeature(x, 1)subtype_009     1.907e-04  1.256e-04   1.519    0.133
    ## getFeature(x, 1)subtype_010     6.826e-05  7.435e-05   0.918    0.361
    ## zB                              4.331e-02  4.500e-01   0.096    0.924
    ## zC                              6.121e-01  3.862e-01   1.585    0.117
    ## getFeature(x, 1)subtype_003:zB -3.110e-04  1.875e-04  -1.658    0.101
    ## getFeature(x, 1)subtype_004:zB  1.006e-04  1.649e-04   0.610    0.544
    ## getFeature(x, 1)subtype_005:zB  9.046e-05  1.064e-04   0.850    0.398
    ## getFeature(x, 1)subtype_008:zB  9.056e-05  1.221e-04   0.741    0.461
    ## getFeature(x, 1)subtype_009:zB  8.555e-05  1.814e-04   0.472    0.638
    ## getFeature(x, 1)subtype_010:zB -1.265e-04  1.920e-04  -0.659    0.512
    ## getFeature(x, 1)subtype_003:zC  3.117e-05  1.507e-04   0.207    0.837
    ## getFeature(x, 1)subtype_004:zC  1.280e-04  1.917e-04   0.668    0.506
    ## getFeature(x, 1)subtype_005:zC  1.287e-04  1.146e-04   1.123    0.265
    ## getFeature(x, 1)subtype_008:zC -1.244e-04  1.369e-04  -0.908    0.367
    ## getFeature(x, 1)subtype_009:zC -1.959e-04  1.457e-04  -1.345    0.182
    ## getFeature(x, 1)subtype_010:zC -1.941e-04  1.418e-04  -1.369    0.175
    ## 
    ## Residual standard error: 0.8596 on 79 degrees of freedom
    ## Multiple R-squared:  0.2145, Adjusted R-squared:  0.01566 
    ## F-statistic: 1.079 on 20 and 79 DF,  p-value: 0.3878

``` r
#Run a model for each individual subtype
apply(X      = getFeature(x, 1), 
      MARGIN = 2, 
      FUN    = function(x){lm(y~x) %>% summary})
```

    ## $subtype_003
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.36336 -0.52405 -0.00573  0.57393  3.02300 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -1.399e-01  1.148e-01  -1.219    0.226
    ## x            5.149e-05  4.779e-05   1.077    0.284
    ## 
    ## Residual standard error: 0.8657 on 98 degrees of freedom
    ## Multiple R-squared:  0.01171,    Adjusted R-squared:  0.00162 
    ## F-statistic: 1.161 on 1 and 98 DF,  p-value: 0.284
    ## 
    ## 
    ## $subtype_004
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -1.79016 -0.58508 -0.02759  0.48065  2.97974 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept)  4.971e-02  1.069e-01   0.465   0.6431  
    ## x           -6.732e-05  3.960e-05  -1.700   0.0923 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.8583 on 98 degrees of freedom
    ## Multiple R-squared:  0.02864,    Adjusted R-squared:  0.01873 
    ## F-statistic:  2.89 on 1 and 98 DF,  p-value: 0.09231
    ## 
    ## 
    ## $subtype_005
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.36150 -0.59708 -0.03695  0.49909  3.11257 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -9.652e-02  1.095e-01  -0.882    0.380
    ## x            2.197e-05  3.872e-05   0.567    0.572
    ## 
    ## Residual standard error: 0.8694 on 98 degrees of freedom
    ## Multiple R-squared:  0.003274,   Adjusted R-squared:  -0.006897 
    ## F-statistic: 0.3219 on 1 and 98 DF,  p-value: 0.5718
    ## 
    ## 
    ## $subtype_008
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.35179 -0.57662 -0.03123  0.52372  3.10368 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -8.473e-02  1.111e-01  -0.763    0.447
    ## x            1.605e-05  4.268e-05   0.376    0.708
    ## 
    ## Residual standard error: 0.8702 on 98 degrees of freedom
    ## Multiple R-squared:  0.001442,   Adjusted R-squared:  -0.008748 
    ## F-statistic: 0.1415 on 1 and 98 DF,  p-value: 0.7076
    ## 
    ## 
    ## $subtype_009
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.31885 -0.56721 -0.02632  0.51369  3.13873 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -1.200e-01  1.075e-01  -1.117    0.267
    ## x            4.064e-05  4.218e-05   0.963    0.338
    ## 
    ## Residual standard error: 0.8667 on 98 degrees of freedom
    ## Multiple R-squared:  0.009384,   Adjusted R-squared:  -0.0007247 
    ## F-statistic: 0.9283 on 1 and 98 DF,  p-value: 0.3377
    ## 
    ## 
    ## $subtype_010
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.32564 -0.58616 -0.03743  0.50795  3.12722 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -1.158e-01  1.145e-01  -1.012    0.314
    ## x            4.133e-05  5.406e-05   0.765    0.446
    ## 
    ## Residual standard error: 0.8682 on 98 degrees of freedom
    ## Multiple R-squared:  0.00593,    Adjusted R-squared:  -0.004214 
    ## F-statistic: 0.5846 on 1 and 98 DF,  p-value: 0.4464
