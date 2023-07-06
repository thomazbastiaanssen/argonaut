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
    ##      X2         NA          8         NA
    ##      X3         NA         14         NA
    ##      X4         NA         20         NA
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03
    ##      X1          4          5          6
    ##      X2         10         11         12
    ##      X3         16         17         18
    ##      X4         22         23         24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                          X1   X2   X3   X4   X5   X6
    ## subtype_001|feature_01 3396 1796 5428 4532  132 1156
    ## subtype_001|feature_02 2547 1347 4071 3399   99  867
    ## subtype_001|feature_03  849  449 1357 1133   33  289
    ## subtype_001|feature_04 4245 2245 6785 5665  165 1445
    ## subtype_001|feature_05 2547 1347 4071 3399   99  867
    ## subtype_002|feature_01 6684 1772 4104 3092 5496 3700

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       3396       2547        849       4245       2547
    ##      X2       1796       1347        449       2245       1347
    ##      X3       5428       4071       1357       6785       4071
    ##      X4       4532       3399       1133       5665       3399
    ##      X5        132         99         33        165         99
    ##      X6       1156        867        289       1445        867
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       6684       5013      10026         NA         NA
    ##      X2       1772       1329       2658         NA         NA
    ##      X3       4104       3078       6156         NA         NA
    ##      X4       3092       2319       4638         NA         NA
    ##      X5       5496       4122       8244         NA         NA
    ##      X6       3700       2775       5550         NA         NA
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       4485       2990       8970         NA       5980
    ##      X2       1437        958       2874         NA       1916
    ##      X3       1908       1272       3816         NA       2544
    ##      X4       1455        970       2910         NA       1940
    ##      X5       5994       3996      11988         NA       7992
    ##      X6       5466       3644      10932         NA       7288
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1836       1836       3672       3060       3060
    ##      X2       3612       3612       7224       6020       6020
    ##      X3       5841       5841      11682       9735       9735
    ##      X4       1491       1491       2982       2485       2485
    ##      X5        792        792       1584       1320       1320
    ##      X6         45         45         90         75         75
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       7716       7716       6430       2572       2572
    ##      X2       7224       7224       6020       2408       2408
    ##      X3       4368       4368       3640       1456       1456
    ##      X4       7938       7938       6615       2646       2646
    ##      X5       1092       1092        910        364        364
    ##      X6       6468       6468       5390       2156       2156
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1376       1376       1376       2064         NA
    ##      X2       4532       4532       4532       6798         NA
    ##      X3        164        164        164        246         NA
    ##      X4       2496       2496       2496       3744         NA
    ##      X5       4304       4304       4304       6456         NA
    ##      X6       4072       4072       4072       6108         NA
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1        192         96        384        192        576
    ##      X2        304        152        608        304        912
    ##      X3       3718       1859       7436       3718      11154
    ##      X4       1324        662       2648       1324       3972
    ##      X5       1314        657       2628       1314       3942
    ##      X6        220        110        440        220        660
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       1802       4505       4505         NA       3604
    ##      X2        600       1500       1500         NA       1200
    ##      X3       1794       4485       4485         NA       3588
    ##      X4        154        385        385         NA        308
    ##      X5        338        845        845         NA        676
    ##      X6       1052       2630       2630         NA       2104
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1         NA       1298         NA         NA         NA
    ##      X2         NA        488         NA         NA         NA
    ##      X3         NA       1188         NA         NA         NA
    ##      X4         NA        670         NA         NA         NA
    ##      X5         NA        604         NA         NA         NA
    ##      X6         NA       2102         NA         NA         NA
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples feature_01 feature_02 feature_03 feature_04 feature_05
    ##      X1       4135         NA        827        827       4135
    ##      X2       7685         NA       1537       1537       7685
    ##      X3       3260         NA        652        652       3260
    ##      X4       2515         NA        503        503       2515
    ##      X5       2540         NA        508        508       2540
    ##      X6       4625         NA        925        925       4625

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
    ##      X1      31622      27377      37039      12960      22474
    ##      X2      28962      21142      27402      19312      21488
    ##      X3      30585      26326      39388      22592      35808
    ##      X4      24997      20330      24310      16367      17265
    ##      X5      22002      16511      31044      10127      16933
    ##      X6      26804      22713      30318      10929      17775
