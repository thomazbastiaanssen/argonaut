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
    ## subtype_02|feature_03  6 12 18 24

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = subtype_01
    ## 
    ##        features
    ## samples feature_01 feature_03
    ##      X1          1          3
    ##      X2          4          6
    ##      X3          7          9
    ##      X4         10         12
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_01 feature_03
    ##      X1         13         15
    ##      X2         16         18
    ##      X3         19         21
    ##      X4         22         24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                           X1   X2   X3   X4   X5   X6
    ## subtype_001|feature_01   570 1635  590  515  425  278
    ## subtype_001|feature_02  2280 6540 2360 2060 1700 1112
    ## subtype_001|feature_03  1140 3270 1180 1030  850  556
    ## subtype_001|feature_04  1710 4905 1770 1545 1275  834
    ## subtype_002|feature_02  2334   64 1406 1857  578 1149
    ## subtype_002|feature_03 11670  320 7030 9285 2890 5745

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        570       2280       1140       1710         NA
    ##      X2        972       2334      11670      11670         NA
    ##      X3       1578       4296       1620       7160         NA
    ##      X4       5728        681       1578       5272         NA
    ##      X5       1318       1318       5272       5230         NA
    ##      X6       2092       5230       1046        329         NA
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA        658       1645       2740      14004
    ##      X2         NA        685       4110       4905       1944
    ##      X3         NA       6540       3270        320       3156
    ##      X4         NA         64        320       6330       4296
    ##      X5         NA       3798       1565       8812       2043
    ##      X6         NA        229       6188       2810       5272
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        329         NA       8812         NA       3138
    ##      X2       4110         NA        562         NA       1645
    ##      X3       1635         NA        145         NA       2740
    ##      X4        939         NA       3996         NA        384
    ##      X5       6188         NA       1180         NA       1878
    ##      X6       5064         NA       7030         NA      12376
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2203         NA       1005         NA       3798
    ##      X2       1124         NA       2000         NA        687
    ##      X3         29         NA       5844         NA       8812
    ##      X4       3996         NA        136         NA       1686
    ##      X5        590         NA       2170         NA        145
    ##      X6        603         NA       1278         NA       2664
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       2000       2203         NA         29       8436
    ##      X2       5904       2810         NA       2664       1206
    ##      X3       1461         58         NA       1770       4000
    ##      X4        272        666         NA       7030       4428
    ##      X5        434       2360         NA       7380          9
    ##      X6       1278       1406         NA       5844       5844
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA       4428         NA         NA        408
    ##      X2         NA          3         NA         NA       2170
    ##      X3         NA       1461         NA         NA        852
    ##      X4         NA        680         NA         NA      11142
    ##      X5         NA        868         NA         NA        540
    ##      X6         NA        213         NA         NA       2728
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        515       2060       1030        680       1677
    ##      X2        270       1857       9285        434        288
    ##      X3       1364       1677        450        852       7536
    ##      X4       2236         96       1364       1545       2391
    ##      X5       1884       1884       7536       9285       1985
    ##      X6       1594       3985        797       2795        620
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        397        794       1985       7536       3468
    ##      X2        930        155        930       3985        366
    ##      X3        425       1700        850        397       3556
    ##      X4        183        578       2890        620       3033
    ##      X5       1778       3033        305       1275       2127
    ##      X6       4044        709       1778       2890       2596
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        649        649       2596       5055       1563
    ##      X2       1042       2605        521       2596        895
    ##      X3        179        358        895       2605       3424
    ##      X4       5136        856       5136        179       6894
    ##      X5        278       1112        556       3424        678
    ##      X6        339       1149       5745        834       2284
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1142        684        565       5745        684
    ##      X2        912        342       1142       1140       1026
    ##      X3       1977       1977       7908       7908       7908
    ##      X4       4130      10325       2065      10325       6195
    ##      X5        999       1998       4995        999       4995
    ##      X6       1422        237       1422        948        948

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
    ##      X1       7805      13756      18778      23495      37176
    ##      X2      15264      10791      30220      27394      10227
    ##      X3       8648      18067      20982      21012      41984
    ##      X4      22620      13946      17485      31301      40449
    ##      X5      13469      16371      23579      36405      14400
    ##      X6      16436      13158      25284      16450      35332

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


#The getFeature function extracts features by name or index and returns a table with each subtype of that feature, per sample. 

getFeature(x, "feature_003") %>% 
  Tjazi::clr_c() %>% 
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
    ## -1.8082 -0.5514 -0.0196  0.6282  1.8485 
    ## 
    ## Coefficients:
    ##                                  Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept)                     1.335e-01  3.877e-01   0.344   0.7314  
    ## getFeature(x, 1)subtype_001    -3.265e-04  1.481e-04  -2.205   0.0304 *
    ## getFeature(x, 1)subtype_002    -1.005e-04  1.946e-04  -0.516   0.6070  
    ## getFeature(x, 1)subtype_005     2.643e-05  1.884e-04   0.140   0.8888  
    ## getFeature(x, 1)subtype_007    -6.604e-05  1.919e-04  -0.344   0.7317  
    ## getFeature(x, 1)subtype_009     1.581e-04  2.188e-04   0.722   0.4722  
    ## getFeature(x, 1)subtype_010     1.887e-04  2.466e-04   0.765   0.4464  
    ## zB                             -5.436e-02  5.375e-01  -0.101   0.9197  
    ## zC                              8.248e-02  5.029e-01   0.164   0.8701  
    ## getFeature(x, 1)subtype_001:zB  1.184e-04  1.923e-04   0.616   0.5398  
    ## getFeature(x, 1)subtype_002:zB  3.423e-04  2.565e-04   1.334   0.1859  
    ## getFeature(x, 1)subtype_005:zB  1.409e-04  2.331e-04   0.604   0.5474  
    ## getFeature(x, 1)subtype_007:zB  3.206e-04  2.451e-04   1.308   0.1946  
    ## getFeature(x, 1)subtype_009:zB -5.657e-04  2.672e-04  -2.117   0.0374 *
    ## getFeature(x, 1)subtype_010:zB -2.246e-04  2.726e-04  -0.824   0.4124  
    ## getFeature(x, 1)subtype_001:zC  3.796e-04  1.846e-04   2.057   0.0430 *
    ## getFeature(x, 1)subtype_002:zC -2.576e-04  2.269e-04  -1.135   0.2597  
    ## getFeature(x, 1)subtype_005:zC  2.504e-04  2.163e-04   1.158   0.2505  
    ## getFeature(x, 1)subtype_007:zC  1.618e-04  2.205e-04   0.734   0.4652  
    ## getFeature(x, 1)subtype_009:zC -2.026e-04  2.669e-04  -0.759   0.4500  
    ## getFeature(x, 1)subtype_010:zC -3.803e-04  2.886e-04  -1.318   0.1914  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.9341 on 79 degrees of freedom
    ## Multiple R-squared:  0.3074, Adjusted R-squared:  0.1321 
    ## F-statistic: 1.753 on 20 and 79 DF,  p-value: 0.04169

``` r
#Run a model for each individual subtype
apply(X      = getFeature(x, 1), 
      MARGIN = 2, 
      FUN    = function(x){lm(y~x) %>% summary})
```

    ## $subtype_001
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.1523 -0.7637  0.0727  0.7039  2.3942 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)  1.465e-01  1.487e-01   0.986    0.327
    ## x           -5.606e-05  6.545e-05  -0.856    0.394
    ## 
    ## Residual standard error: 1.004 on 98 degrees of freedom
    ## Multiple R-squared:  0.00743,    Adjusted R-squared:  -0.002698 
    ## F-statistic: 0.7336 on 1 and 98 DF,  p-value: 0.3938
    ## 
    ## 
    ## $subtype_002
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.05231 -0.75025  0.04087  0.72829  2.41842 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)  1.662e-01  1.491e-01   1.115    0.268
    ## x           -7.758e-05  7.534e-05  -1.030    0.306
    ## 
    ## Residual standard error: 1.002 on 98 degrees of freedom
    ## Multiple R-squared:  0.0107, Adjusted R-squared:  0.0006084 
    ## F-statistic:  1.06 on 1 and 98 DF,  p-value: 0.3057
    ## 
    ## 
    ## $subtype_005
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.0583 -0.7224  0.1122  0.7212  2.1407 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept) -1.533e-01  1.432e-01  -1.071   0.2869  
    ## x            1.334e-04  6.715e-05   1.987   0.0497 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.988 on 98 degrees of freedom
    ## Multiple R-squared:  0.03874,    Adjusted R-squared:  0.02893 
    ## F-statistic: 3.949 on 1 and 98 DF,  p-value: 0.04968
    ## 
    ## 
    ## $subtype_007
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.05655 -0.75817  0.07111  0.72822  2.32045 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept) -2.648e-02  1.557e-01  -0.170    0.865
    ## x            4.605e-05  6.918e-05   0.666    0.507
    ## 
    ## Residual standard error: 1.005 on 98 degrees of freedom
    ## Multiple R-squared:  0.0045, Adjusted R-squared:  -0.005658 
    ## F-statistic: 0.443 on 1 and 98 DF,  p-value: 0.5072
    ## 
    ## 
    ## $subtype_009
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.14179 -0.78468  0.05476  0.70982  2.28806 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)  1.272e-01  1.469e-01   0.866    0.389
    ## x           -5.873e-05  8.434e-05  -0.696    0.488
    ## 
    ## Residual standard error: 1.005 on 98 degrees of freedom
    ## Multiple R-squared:  0.004923,   Adjusted R-squared:  -0.005231 
    ## F-statistic: 0.4848 on 1 and 98 DF,  p-value: 0.4879
    ## 
    ## 
    ## $subtype_010
    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.12274 -0.76213  0.06533  0.70723  2.30741 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)  1.137e-01  1.449e-01   0.785    0.435
    ## x           -4.480e-05  7.651e-05  -0.586    0.559
    ## 
    ## Residual standard error: 1.006 on 98 degrees of freedom
    ## Multiple R-squared:  0.003487,   Adjusted R-squared:  -0.006682 
    ## F-statistic: 0.3429 on 1 and 98 DF,  p-value: 0.5595
