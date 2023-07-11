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
    ## subtype_01|feature_03  3  9 15 21
    ## subtype_02|feature_02  5 11 17 23

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = subtype_01
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03
    ##      X1          1          2          3
    ##      X2          7          5          9
    ##      X3         13          8         15
    ##      X4         19         11         21
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03
    ##      X1         NA         14         NA
    ##      X2         NA         17         NA
    ##      X3         NA         20         NA
    ##      X4         NA         23         NA

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                          X1   X2   X3   X4   X5   X6
    ## subtype_001|feature_01  228 1269 2298 2937 1293 2364
    ## subtype_001|feature_02  228 1269 2298 2937 1293 2364
    ## subtype_001|feature_04  456 2538 4596 5874 2586 4728
    ## subtype_001|feature_05  456 2538 4596 5874 2586 4728
    ## subtype_002|feature_01 1420 2320 3316 1240  168 1652
    ## subtype_002|feature_02 1775 2900 4145 1550  210 2065

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        228        228         NA        456        456
    ##      X2       1420       1775         NA       1775       7038
    ##      X3        328        820         NA       1338        240
    ##      X4        892       4692         NA       7038        172
    ##      X5       5865        879         NA       2637       2538
    ##      X6       3516         60         NA        300       2934
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        240       3352        355       3352         NA
    ##      X2       4190       1566        984       1044         NA
    ##      X3       1305        258        892        172         NA
    ##      X4        172       1269       4395       2538         NA
    ##      X5       1269       2900        300       2900         NA
    ##      X6       2320       4750       2514       2205         NA
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1900       1956       1044         NA         NA
    ##      X2       1470        355        129         NA         NA
    ##      X3       2445       1291        580         NA         NA
    ##      X4       1420       7712       5700         NA         NA
    ##      X5       5164       3132       1470         NA         NA
    ##      X6       9640       4512       1775         NA         NA
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2610         NA       6455       2934         NA
    ##      X2       3008         NA       5784       1065         NA
    ##      X3       2298         NA       2088       6455         NA
    ##      X4       3316         NA       2256       7712         NA
    ##      X5       1484         NA        829       2088         NA
    ##      X6       1888         NA       4452       3008         NA
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       4585       2298         NA       4596       5164
    ##      X2        252       4145         NA       4145       3008
    ##      X3       2492       3710         NA       2832       4596
    ##      X4       3990       3668         NA       5502       5502
    ##      X5       8295         63         NA        189       2492
    ##      X6       5940        623         NA       3115       5940
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2937       3192       1888       3192         NA
    ##      X2       1240       9954        315       6636         NA
    ##      X3       1068       8910       3115       5940         NA
    ##      X4       1844       2937       2394       5874         NA
    ##      X5       5260       1550       6636       1550         NA
    ##      X6       2100       2670       4455       2766         NA
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        848       4208        310       6312       5874
    ##      X2       7540        525       3204       1575       6312
    ##      X3       1010        212       1844       1060        848
    ##      X4       2888       6032       2625       6032       2888
    ##      X5       1293       1212       1060        808       2586
    ##      X6        168       4332       4524       2888        948
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        538       1293        808       2586         NA
    ##      X2       1566        210       2166        210         NA
    ##      X3        790       1345         42       2349         NA
    ##      X4       5392        632       1614        948         NA
    ##      X5      12012       1348       1566       4044         NA
    ##      X6       1075       3003       6740      15015         NA
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       7150        860      15015        860         NA
    ##      X2       1024       8580        645       5720         NA
    ##      X3       2364       1536       5720       1024         NA
    ##      X4       1652       2364        768       4728         NA
    ##      X5       1050       2065        413       2065         NA
    ##      X6       1290       2625       3150       1935         NA
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       7920       6336       1290       9504      12012
    ##      X2       2356        589       2945       1767       1024
    ##      X3       4424       1106       5530       5530       4728
    ##      X4       5330       4264       3198       4264       9504
    ##      X5       2475       2970       1980       1980       4424
    ##      X6        212        318        159        212        212

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
    ##      X1      28956      23723      27165      33792      23506
    ##      X2      24066      27699      16172      23937      17382
    ##      X3      18524      19188      19811      26700      10412
    ##      X4      26896      33570      22950      44636      18066
    ##      X5      44167      16119      14254      18261      12040
    ##      X6      28149      22893      27769      31444      10034

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

x = dummy_strat(nsubtypes = 5, 
                nfeatures = 10, 
                nsamples = 100, 
                type = "by_subtype", 
                p_missing = .30) %>% 
  as.sft()

z = sample(LETTERS[1:3], 100, replace = T)


#The getFeature function extracts features by name or index and returns a table with each subtype of that feature, per sample. 

getFeature(x, "feature_003") %>% 
  Tjazi::clr_c(., samples_are = "rows") %>% 
  rownames_to_column("ID") %>% 
  pivot_longer(!ID) %>% 
  
  ggplot() +
  aes(x = name, y = value, fill = name) +
  geom_boxplot() +
  theme_bw() +
  ylab("Abundance (CLR-transformed)") + xlab(NULL) +
  ggtitle("The abundance of feature 3 by subtype")
```

![](README_files/figure-gfm/lm.sft-1.png)<!-- -->

``` r
#getFeatures integrates with models and apply. 

#Run a model with each subtype as a predictor
lm(y ~ getFeature(x, 1) * z) %>% summary
```

    ## 
    ## Call:
    ## lm(formula = y ~ getFeature(x, 1) * z)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0512 -0.8126  0.0758  0.7507  2.3962 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)                   -2.389e-01  4.069e-01  -0.587    0.559
    ## getFeature(x, 1)subtype_02    -1.815e-04  1.215e-04  -1.494    0.139
    ## getFeature(x, 1)subtype_03    -3.488e-05  1.428e-04  -0.244    0.808
    ## getFeature(x, 1)subtype_04     4.379e-05  1.103e-04   0.397    0.692
    ## getFeature(x, 1)subtype_05     2.931e-04  1.793e-04   1.634    0.106
    ## zB                             8.280e-02  5.950e-01   0.139    0.890
    ## zC                            -5.980e-02  5.749e-01  -0.104    0.917
    ## getFeature(x, 1)subtype_02:zB  2.563e-04  1.595e-04   1.606    0.112
    ## getFeature(x, 1)subtype_03:zB  1.997e-04  1.926e-04   1.037    0.303
    ## getFeature(x, 1)subtype_04:zB -4.374e-05  2.015e-04  -0.217    0.829
    ## getFeature(x, 1)subtype_05:zB -3.586e-04  2.194e-04  -1.635    0.106
    ## getFeature(x, 1)subtype_02:zC  2.400e-04  1.862e-04   1.289    0.201
    ## getFeature(x, 1)subtype_03:zC  1.505e-04  1.900e-04   0.792    0.431
    ## getFeature(x, 1)subtype_04:zC -9.861e-05  1.976e-04  -0.499    0.619
    ## getFeature(x, 1)subtype_05:zC -2.076e-04  2.095e-04  -0.991    0.325
    ## 
    ## Residual standard error: 1.107 on 85 degrees of freedom
    ## Multiple R-squared:  0.1094, Adjusted R-squared:  -0.03733 
    ## F-statistic: 0.7455 on 14 and 85 DF,  p-value: 0.7231

``` r
#Run a model for each individual subtype
apply(X      = getFeature(x, 1), 
      MARGIN = 2, 
      FUN    = function(x){lm(y~x * z) %>% summary})
```

    ## $subtype_02
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.97627 -0.84347 -0.03746  0.96191  2.19865 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)  0.1718469  0.2765811   0.621    0.536
    ## x           -0.0001454  0.0001148  -1.266    0.209
    ## zB          -0.1706782  0.3842579  -0.444    0.658
    ## zC          -0.2480223  0.4024773  -0.616    0.539
    ## x:zB         0.0002492  0.0001519   1.641    0.104
    ## x:zC         0.0002177  0.0001731   1.257    0.212
    ## 
    ## Residual standard error: 1.093 on 94 degrees of freedom
    ## Multiple R-squared:  0.03985,    Adjusted R-squared:  -0.01122 
    ## F-statistic: 0.7804 on 5 and 94 DF,  p-value: 0.5663
    ## 
    ## 
    ## $subtype_03
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0643 -0.7674  0.1164  0.7485  2.5674 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -5.434e-02  3.048e-01  -0.178    0.859
    ## x           -6.724e-06  1.304e-04  -0.052    0.959
    ## zB          -6.550e-02  4.263e-01  -0.154    0.878
    ## zC          -1.158e-01  4.019e-01  -0.288    0.774
    ## x:zB         1.577e-04  1.703e-04   0.926    0.357
    ## x:zC         1.441e-04  1.762e-04   0.818    0.416
    ## 
    ## Residual standard error: 1.092 on 94 degrees of freedom
    ## Multiple R-squared:  0.04221,    Adjusted R-squared:  -0.008739 
    ## F-statistic: 0.8285 on 5 and 94 DF,  p-value: 0.5326
    ## 
    ## 
    ## $subtype_04
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.0360 -0.8373  0.0868  0.8068  2.3280 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -1.333e-01  2.729e-01  -0.488    0.626
    ## x            3.669e-05  9.774e-05   0.375    0.708
    ## zB           2.416e-01  4.675e-01   0.517    0.606
    ## zC           2.068e-01  4.052e-01   0.510    0.611
    ## x:zB         5.262e-06  1.839e-04   0.029    0.977
    ## x:zC        -4.934e-05  1.803e-04  -0.274    0.785
    ## 
    ## Residual standard error: 1.109 on 94 degrees of freedom
    ## Multiple R-squared:  0.01149,    Adjusted R-squared:  -0.04109 
    ## F-statistic: 0.2184 on 5 and 94 DF,  p-value: 0.9538
    ## 
    ## 
    ## $subtype_05
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -3.00086 -0.79466  0.07477  0.86330  2.31838 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -0.4816084  0.3302309  -1.458    0.148
    ## x            0.0002703  0.0001696   1.594    0.114
    ## zB           0.6575601  0.4382578   1.500    0.137
    ## zC           0.3976257  0.4128154   0.963    0.338
    ## x:zB        -0.0002603  0.0002002  -1.300    0.197
    ## x:zC        -0.0001896  0.0001977  -0.959    0.340
    ## 
    ## Residual standard error: 1.092 on 94 degrees of freedom
    ## Multiple R-squared:  0.0416, Adjusted R-squared:  -0.009377 
    ## F-statistic: 0.8161 on 5 and 94 DF,  p-value: 0.5412
