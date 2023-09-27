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
    ## samples feature_01 feature_02 feature_03
    ##      X1         NA          2          3
    ##      X2         NA          8          9
    ##      X3         NA         14         15
    ##      X4         NA         20         21
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03
    ##      X1          4         NA          6
    ##      X2         10         NA         12
    ##      X3         16         NA         18
    ##      X4         22         NA         24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 

#Let's switch it up and generate some more Argonauts with some heroic skills. 
sdf <- board_argo(nsubtypes = 10, nfeatures = 5, nsamples = 6, p_missing = 1/2)

head(sdf)
```

    ##                             X1  X2   X3   X4  X5   X6
    ## Asclepius|Discus throwing  268 136  416  672 780  480
    ## Asclepius|Oration          335 170  520  840 975  600
    ## Iolaus|Hunting            1342  46 5614 6202 898 2896
    ## Iolaus|Discus throwing     671  23 2807 3101 449 1448
    ## Iolaus|Running             671  23 2807 3101 449 1448
    ## Thersanon|Running          472 496  652  544 208  992

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = Admetus
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1              NA      88      NA      NA     352
    ##      X2              NA     118      NA      NA     472
    ##      X3              NA      18      NA      NA      72
    ##      X4              NA      55      NA      NA     220
    ##      X5              NA      30      NA      NA     120
    ##      X6              NA      10      NA      NA      40
    ## 
    ## , , subtypes = Asclepius
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1             268      NA      NA     335      NA
    ##      X2             136      NA      NA     170      NA
    ##      X3             416      NA      NA     520      NA
    ##      X4             672      NA      NA     840      NA
    ##      X5             780      NA      NA     975      NA
    ##      X6             480      NA      NA     600      NA
    ## 
    ## , , subtypes = Ialmenus
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1              NA     912     456     912    2280
    ##      X2              NA    1868     934    1868    4670
    ##      X3              NA     786     393     786    1965
    ##      X4              NA     126      63     126     315
    ##      X5              NA     890     445     890    2225
    ##      X6              NA     496     248     496    1240
    ## 
    ## , , subtypes = Iolaus
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1             671      NA    1342      NA     671
    ##      X2              23      NA      46      NA      23
    ##      X3            2807      NA    5614      NA    2807
    ##      X4            3101      NA    6202      NA    3101
    ##      X5             449      NA     898      NA     449
    ##      X6            1448      NA    2896      NA    1448
    ## 
    ## , , subtypes = Iphis
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1             336      NA    1008      NA      NA
    ##      X2            1224      NA    3672      NA      NA
    ##      X3            2788      NA    8364      NA      NA
    ##      X4            2682      NA    8046      NA      NA
    ##      X5            1658      NA    4974      NA      NA
    ##      X6            2346      NA    7038      NA      NA
    ## 
    ## , , subtypes = Nauplius
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1             896    5376      NA      NA      NA
    ##      X2             927    5562      NA      NA      NA
    ##      X3            1027    6162      NA      NA      NA
    ##      X4             610    3660      NA      NA      NA
    ##      X5            1294    7764      NA      NA      NA
    ##      X6             704    4224      NA      NA      NA
    ## 
    ## , , subtypes = Orpheus
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1            4077    4077      NA    5436    6795
    ##      X2            3741    3741      NA    4988    6235
    ##      X3            8040    8040      NA   10720   13400
    ##      X4            4293    4293      NA    5724    7155
    ##      X5            2061    2061      NA    2748    3435
    ##      X6             570     570      NA     760     950
    ## 
    ## , , subtypes = Telamon
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1              NA    1226      NA      NA      NA
    ##      X2              NA    1510      NA      NA      NA
    ##      X3              NA     174      NA      NA      NA
    ##      X4              NA     851      NA      NA      NA
    ##      X5              NA    1319      NA      NA      NA
    ##      X6              NA      79      NA      NA      NA
    ## 
    ## , , subtypes = Thersanon
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1              NA     472      NA     472     472
    ##      X2              NA     496      NA     496     496
    ##      X3              NA     652      NA     652     652
    ##      X4              NA     544      NA     544     544
    ##      X5              NA     208      NA     208     208
    ##      X6              NA     992      NA     992     992
    ## 
    ## , , subtypes = Theseus
    ## 
    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1              NA      NA    1422     711      NA
    ##      X2              NA      NA    1818     909      NA
    ##      X3              NA      NA    2958    1479      NA
    ##      X4              NA      NA     258     129      NA
    ##      X5              NA      NA    3366    1683      NA
    ##      X6              NA      NA     342     171      NA

\#Apply_by()

``` r
#We can apply a function on the stratifiedFeatureTable with the apply_by() function. 

sft = as.stratifiedFeatureTable(sdf)

#MARGIN must be exactly 1, 2 or 3, corresponding to applying a function on all observations (1) per sample, (2) per feature or (3) per subtype.  

#for example, we can collapse to an unstratified feature table by summing all subtypes of the same feature. 
apply_by(X = sft, MARGIN = 3, FUN = sum)
```

    ##        features
    ## samples Discus throwing Fishing Hunting Oration Running
    ##      X1            6248   12151    4228    7866   10570
    ##      X2            6051   13295    6470    8431   11896
    ##      X3           15078   15832   17329   14157   18896
    ##      X4           11358    9529   14569    7363   11335
    ##      X5            6242   12272    9683    6504    6437
    ##      X6            5548    6371   10524    3019    4670

\#Running statistical models on stratified feature tables

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.3     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.3     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
set.seed(123)

y = rnorm(100)

x = board_argo(nsubtypes = 5, 
                nfeatures = 10, 
                nsamples = 100, p_missing = 0.3) %>% 
  as.sft()

z = sample(LETTERS[1:3], 100, replace = T)


#The getFeature function extracts features by name or index and returns a table with each subtype of that feature, per sample. 

getFeature(x, "Philosophy") %>% 
  Tjazi::clr_c(., samples_are = "rows") %>% 
  rownames_to_column("ID") %>% 
  pivot_longer(!ID) %>% 
  
  ggplot() +
  aes(x = name, y = value, fill = name) +
  geom_boxplot() +
  theme_bw() +
  ylab("Abundance (CLR-transformed)") + xlab(NULL) +
  ggtitle("The philosophical skill levels of our argonauts")
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
    ## -1.98160 -0.61111 -0.06757  0.53362  2.18472 
    ## 
    ## Coefficients:
    ##                               Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept)                  0.8488322  0.4881141   1.739   0.0855 .
    ## getFeature(x, 1)Caeneus     -0.0001526  0.0000676  -2.258   0.0264 *
    ## getFeature(x, 1)Demoleon     0.0007238  0.0004744   1.526   0.1307  
    ## getFeature(x, 1)Orpheus     -0.0003897  0.0002037  -1.913   0.0590 .
    ## zB                          -0.6314848  0.7243458  -0.872   0.3857  
    ## zC                          -0.5150449  0.6327448  -0.814   0.4179  
    ## getFeature(x, 1)Caeneus:zB   0.0001666  0.0001107   1.506   0.1357  
    ## getFeature(x, 1)Demoleon:zB -0.0013351  0.0006876  -1.942   0.0554 .
    ## getFeature(x, 1)Orpheus:zB   0.0005960  0.0003681   1.619   0.1090  
    ## getFeature(x, 1)Caeneus:zC   0.0001319  0.0001014   1.301   0.1968  
    ## getFeature(x, 1)Demoleon:zC -0.0011142  0.0006073  -1.835   0.0699 .
    ## getFeature(x, 1)Orpheus:zC   0.0004379  0.0002762   1.586   0.1164  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.9054 on 88 degrees of freedom
    ## Multiple R-squared:  0.1255, Adjusted R-squared:  0.01613 
    ## F-statistic: 1.148 on 11 and 88 DF,  p-value: 0.3354

``` r
#Run a model for each individual subtype
apply(X      = getFeature(x, 1), 
      MARGIN = 2, 
      FUN    = function(x){lm(y~x * z) %>% summary})
```

    ## $Caeneus
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.22853 -0.54211 -0.02379  0.60815  2.24717 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept)  5.906e-01  3.044e-01   1.941   0.0553 .
    ## x           -1.268e-04  6.736e-05  -1.882   0.0629 .
    ## zB          -4.101e-01  4.510e-01  -0.909   0.3656  
    ## zC          -4.213e-01  4.110e-01  -1.025   0.3080  
    ## x:zB         1.048e-04  1.067e-04   0.982   0.3287  
    ## x:zC         9.466e-05  1.014e-04   0.933   0.3531  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.9183 on 94 degrees of freedom
    ## Multiple R-squared:  0.03912,    Adjusted R-squared:  -0.01199 
    ## F-statistic: 0.7654 on 5 and 94 DF,  p-value: 0.577
    ## 
    ## 
    ## $Demoleon
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.04652 -0.65371 -0.02019  0.58385  2.25772 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept) -0.2396601  0.2788705  -0.859   0.3923  
    ## x            0.0007178  0.0004794   1.497   0.1376  
    ## zB           0.6740875  0.4506203   1.496   0.1380  
    ## zC           0.5690926  0.4007887   1.420   0.1589  
    ## x:zB        -0.0012048  0.0006605  -1.824   0.0713 .
    ## x:zC        -0.0011102  0.0006093  -1.822   0.0716 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.9151 on 94 degrees of freedom
    ## Multiple R-squared:  0.04581,    Adjusted R-squared:  -0.004945 
    ## F-statistic: 0.9026 on 5 and 94 DF,  p-value: 0.4829
    ## 
    ## 
    ## $Orpheus
    ## 
    ## Call:
    ## lm(formula = y ~ x * z)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.39468 -0.58416 -0.05283  0.55959  2.10911 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)
    ## (Intercept)  0.5027223  0.3098211   1.623    0.108
    ## x           -0.0003087  0.0002045  -1.510    0.134
    ## zB          -0.4889529  0.4976591  -0.983    0.328
    ## zC          -0.4629726  0.4122580  -1.123    0.264
    ## x:zB         0.0003833  0.0003483   1.100    0.274
    ## x:zC         0.0003335  0.0002783   1.198    0.234
    ## 
    ## Residual standard error: 0.925 on 94 degrees of freedom
    ## Multiple R-squared:  0.02489,    Adjusted R-squared:  -0.02697 
    ## F-statistic:  0.48 on 5 and 94 DF,  p-value: 0.7904
