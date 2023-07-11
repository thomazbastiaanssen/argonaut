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
    ## subtype_01|feature_03  3  9 15 21
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
    ## samples feature_01 feature_02 feature_03
    ##      X1          1         NA          3
    ##      X2          7         NA          9
    ##      X3         13         NA         15
    ##      X4         19         NA         21
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03
    ##      X1          4          5         NA
    ##      X2         10         11         NA
    ##      X3         16         17         NA
    ##      X4         22         23         NA

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                          X1   X2   X3   X4   X5   X6
    ## subtype_001|feature_01 5720 2490 4280 1795 1780 2350
    ## subtype_001|feature_02 5720 2490 4280 1795 1780 2350
    ## subtype_001|feature_04 2288  996 1712  718  712  940
    ## subtype_001|feature_05 1144  498  856  359  356  470
    ## subtype_002|feature_01  640  750  478 1510  330  840
    ## subtype_002|feature_02  320  375  239  755  165  420

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       5720       5720         NA       2288       1144
    ##      X2       2490       2490         NA        996        498
    ##      X3       4280       4280         NA       1712        856
    ##      X4       1795       1795         NA        718        359
    ##      X5       1780       1780         NA        712        356
    ##      X6       2350       2350         NA        940        470
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        640        320       1600       1600        960
    ##      X2        750        375       1875       1875       1125
    ##      X3        478        239       1195       1195        717
    ##      X4       1510        755       3775       3775       2265
    ##      X5        330        165        825        825        495
    ##      X6        840        420       2100       2100       1260
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2804       2804        701       2103       4206
    ##      X2       1376       1376        344       1032       2064
    ##      X3       4036       4036       1009       3027       6054
    ##      X4        788        788        197        591       1182
    ##      X5       1404       1404        351       1053       2106
    ##      X6       3744       3744        936       2808       5616
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       3450       3450         NA       4140         NA
    ##      X2       7225       7225         NA       8670         NA
    ##      X3       7010       7010         NA       8412         NA
    ##      X4       3795       3795         NA       4554         NA
    ##      X5       4390       4390         NA       5268         NA
    ##      X6       4690       4690         NA       5628         NA
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2750       2200         NA        550       3300
    ##      X2        615        492         NA        123        738
    ##      X3        145        116         NA         29        174
    ##      X4         65         52         NA         13         78
    ##      X5       2110       1688         NA        422       2532
    ##      X6       1035        828         NA        207       1242
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        741       4446         NA         NA         NA
    ##      X2        225       1350         NA         NA         NA
    ##      X3        717       4302         NA         NA         NA
    ##      X4        150        900         NA         NA         NA
    ##      X5         84        504         NA         NA         NA
    ##      X6        554       3324         NA         NA         NA
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       6780         NA       5650       6780       4520
    ##      X2       7794         NA       6495       7794       5196
    ##      X3       2886         NA       2405       2886       1924
    ##      X4        942         NA        785        942        628
    ##      X5       7740         NA       6450       7740       5160
    ##      X6       6882         NA       5735       6882       4588
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        462         77        462         NA        154
    ##      X2       1044        174       1044         NA        348
    ##      X3        846        141        846         NA        282
    ##      X4       1752        292       1752         NA        584
    ##      X5       1068        178       1068         NA        356
    ##      X6       3960        660       3960         NA       1320
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1150       1380        230        460        230
    ##      X2       1980       2376        396        792        396
    ##      X3       3025       3630        605       1210        605
    ##      X4       1995       2394        399        798        399
    ##      X5        355        426         71        142         71
    ##      X6        800        960        160        320        160
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA        910        546        364       1092
    ##      X2         NA       1175        705        470       1410
    ##      X3         NA       2035       1221        814       2442
    ##      X4         NA        415        249        166        498
    ##      X5         NA       1645        987        658       1974
    ##      X6         NA       5495       3297       2198       6594

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
    ##      X1      24497      21307       9189      18285      15606
    ##      X2      23499      17033      10859      21752      11775
    ##      X3      23423      25789       7281      19285      13054
    ##      X4      12792      11186       7157      11557       5993
    ##      X5      19261      12180       9752      16820      13050
    ##      X6      24855      22471      16188      21083      21250

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
    ##      Min       1Q   Median       3Q      Max 
    ## -2.48272 -0.56920  0.07903  0.58626  2.39672 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept)                    5.191e-01  4.381e-01   1.185   0.2392  
    ## getFeature(x, 1)subtype_01    -3.001e-04  1.423e-04  -2.108   0.0378 *
    ## getFeature(x, 1)subtype_03    -5.837e-05  7.469e-05  -0.782   0.4366  
    ## getFeature(x, 1)subtype_04     6.162e-04  3.973e-04   1.551   0.1245  
    ## zB                            -6.522e-01  6.444e-01  -1.012   0.3142  
    ## zC                            -6.359e-01  6.397e-01  -0.994   0.3229  
    ## getFeature(x, 1)subtype_01:zB  4.201e-04  1.762e-04   2.385   0.0192 *
    ## getFeature(x, 1)subtype_03:zB  3.706e-05  9.356e-05   0.396   0.6930  
    ## getFeature(x, 1)subtype_04:zB -3.744e-04  4.706e-04  -0.795   0.4285  
    ## getFeature(x, 1)subtype_01:zC  2.734e-04  1.822e-04   1.501   0.1371  
    ## getFeature(x, 1)subtype_03:zC  2.626e-05  1.055e-04   0.249   0.8039  
    ## getFeature(x, 1)subtype_04:zC -3.846e-04  4.626e-04  -0.832   0.4079  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.9584 on 88 degrees of freedom
    ## Multiple R-squared:  0.1279, Adjusted R-squared:  0.01894 
    ## F-statistic: 1.174 on 11 and 88 DF,  p-value: 0.3168

``` r
#Run a model for each individual subtype
apply(X      = getFeature(x, 1), 
      MARGIN = 2, 
      FUN    = function(x){lm(y~x * z) %>% summary})
```

    ## $subtype_01
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.68648 -0.47247  0.03354  0.60611  2.38459 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept)  0.7828257  0.3208231   2.440   0.0166 *
    ## x           -0.0002875  0.0001403  -2.049   0.0432 *
    ## zB          -0.7869691  0.4278586  -1.839   0.0690 .
    ## zC          -0.8120974  0.4206333  -1.931   0.0565 .
    ## x:zB         0.0004029  0.0001718   2.345   0.0211 *
    ## x:zC         0.0002558  0.0001779   1.438   0.1537  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.9513 on 94 degrees of freedom
    ## Multiple R-squared:  0.08212,    Adjusted R-squared:  0.0333 
    ## F-statistic: 1.682 on 5 and 94 DF,  p-value: 0.1465
    ## 
    ## 
    ## $subtype_03
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.65455 -0.55827  0.02549  0.58233  2.43237 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)  9.661e-02  3.027e-01   0.319    0.750
    ## x            2.804e-05  5.708e-05   0.491    0.624
    ## zB           3.171e-01  4.061e-01   0.781    0.437
    ## zC          -1.568e-01  4.513e-01  -0.347    0.729
    ## x:zB        -6.691e-05  7.973e-05  -0.839    0.403
    ## x:zC        -3.584e-05  9.121e-05  -0.393    0.695
    ## 
    ## Residual standard error: 0.9756 on 94 degrees of freedom
    ## Multiple R-squared:  0.03467,    Adjusted R-squared:  -0.01667 
    ## F-statistic: 0.6753 on 5 and 94 DF,  p-value: 0.6432
    ## 
    ## 
    ## $subtype_04
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.4970 -0.6305  0.0830  0.5542  2.3605 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -0.1462925  0.3140814  -0.466    0.642
    ## x            0.0004142  0.0003007   1.377    0.172
    ## zB           0.2421284  0.4103747   0.590    0.557
    ## zC          -0.1340445  0.4101360  -0.327    0.745
    ## x:zB        -0.0002091  0.0003910  -0.535    0.594
    ## x:zC        -0.0002040  0.0003769  -0.541    0.590
    ## 
    ## Residual standard error: 0.9621 on 94 degrees of freedom
    ## Multiple R-squared:  0.06128,    Adjusted R-squared:  0.01135 
    ## F-statistic: 1.227 on 5 and 94 DF,  p-value: 0.3025
