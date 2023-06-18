# argonaut

An R package about dealing with stratified feature tables.

Please note this package is under active development.

``` r
library(argonaut)
#make some dummy data
sdf <- dummy_strat(2, 3, 4, type = "seq")
 
head(sdf)
```

    ##                      X1 X2 X3 X4
    ## subtype_1|function_1  1  7 13 19
    ## subtype_1|function_3  3  9 15 21
    ## subtype_2|function_1  4 10 16 22
    ## subtype_2|function_3  6 12 18 24

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = subtype_1
    ## 
    ##        features
    ## samples function_1 function_3
    ##      X1          1          3
    ##      X2          7          9
    ##      X3         13         15
    ##      X4         19         21
    ## 
    ## , , subtypes = subtype_2
    ## 
    ##        features
    ## samples function_1 function_3
    ##      X1          4          6
    ##      X2         10         12
    ##      X3         16         18
    ##      X4         22         24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 10, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                       X1  X2  X3   X4  X5  X6
    ## subtype_1|function_1 384 732 810 1140 666 816
    ## subtype_1|function_2 128 244 270  380 222 272
    ## subtype_1|function_4 256 488 540  760 444 544
    ## subtype_1|function_5 128 244 270  380 222 272
    ## subtype_1|function_6  64 122 135  190 111 136
    ## subtype_1|function_7 192 366 405  570 333 408

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_1
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1        384         320        128         NA        256        128
    ##      X2        732         610        244         NA        488        244
    ##      X3        810         675        270         NA        540        270
    ##      X4       1140         950        380         NA        760        380
    ##      X5        666         555        222         NA        444        222
    ##      X6        816         680        272         NA        544        272
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1         64        192         64        384
    ##      X2        122        366        122        732
    ##      X3        135        405        135        810
    ##      X4        190        570        190       1140
    ##      X5        111        333        111        666
    ##      X6        136        408        136        816
    ## 
    ## , , subtypes = subtype_10
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1       1628        3256         NA       4884       4070       1628
    ##      X2        838        1676         NA       2514       2095        838
    ##      X3         54         108         NA        162        135         54
    ##      X4        422         844         NA       1266       1055        422
    ##      X5        780        1560         NA       2340       1950        780
    ##      X6        408         816         NA       1224       1020        408
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1         NA       4884       3256       1628
    ##      X2         NA       2514       1676        838
    ##      X3         NA        162        108         54
    ##      X4         NA       1266        844        422
    ##      X5         NA       2340       1560        780
    ##      X6         NA       1224        816        408
    ## 
    ## , , subtypes = subtype_2
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1        865        1730       5190       5190       4325       1730
    ##      X2        189         378       1134       1134        945        378
    ##      X3        254         508       1524       1524       1270        508
    ##      X4        149         298        894        894        745        298
    ##      X5        203         406       1218       1218       1015        406
    ##      X6         84         168        504        504        420        168
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1         NA       1730       3460         NA
    ##      X2         NA        378        756         NA
    ##      X3         NA        508       1016         NA
    ##      X4         NA        298        596         NA
    ##      X5         NA        406        812         NA
    ##      X6         NA        168        336         NA
    ## 
    ## , , subtypes = subtype_3
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1         NA        1170        585        195        780        390
    ##      X2         NA        3984       1992        664       2656       1328
    ##      X3         NA        5316       2658        886       3544       1772
    ##      X4         NA         654        327        109        436        218
    ##      X5         NA        4536       2268        756       3024       1512
    ##      X6         NA        5256       2628        876       3504       1752
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1        975        975       1170        975
    ##      X2       3320       3320       3984       3320
    ##      X3       4430       4430       5316       4430
    ##      X4        545        545        654        545
    ##      X5       3780       3780       4536       3780
    ##      X6       4380       4380       5256       4380
    ## 
    ## , , subtypes = subtype_4
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1         NA         378        945         NA         NA        567
    ##      X2         NA         392        980         NA         NA        588
    ##      X3         NA        2024       5060         NA         NA       3036
    ##      X4         NA        2464       6160         NA         NA       3696
    ##      X5         NA        2248       5620         NA         NA       3372
    ##      X6         NA         670       1675         NA         NA       1005
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1        756         NA        189         NA
    ##      X2        784         NA        196         NA
    ##      X3       4048         NA       1012         NA
    ##      X4       4928         NA       1232         NA
    ##      X5       4496         NA       1124         NA
    ##      X6       1340         NA        335         NA
    ## 
    ## , , subtypes = subtype_5
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1       2788         697       2788       1394       4182        697
    ##      X2        428         107        428        214        642        107
    ##      X3        664         166        664        332        996        166
    ##      X4        472         118        472        236        708        118
    ##      X5       2200         550       2200       1100       3300        550
    ##      X6        300          75        300        150        450         75
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1       2788         NA       2788         NA
    ##      X2        428         NA        428         NA
    ##      X3        664         NA        664         NA
    ##      X4        472         NA        472         NA
    ##      X5       2200         NA       2200         NA
    ##      X6        300         NA        300         NA
    ## 
    ## , , subtypes = subtype_6
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1        960         480       1920       2400        960       2400
    ##      X2       2942        1471       5884       7355       2942       7355
    ##      X3        316         158        632        790        316        790
    ##      X4        122          61        244        305        122        305
    ##      X5       2438        1219       4876       6095       2438       6095
    ##      X6       1000         500       2000       2500       1000       2500
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1       2880         NA       1440       1920
    ##      X2       8826         NA       4413       5884
    ##      X3        948         NA        474        632
    ##      X4        366         NA        183        244
    ##      X5       7314         NA       3657       4876
    ##      X6       3000         NA       1500       2000
    ## 
    ## , , subtypes = subtype_7
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1        960         576        576       1152        576         NA
    ##      X2       1430         858        858       1716        858         NA
    ##      X3       4915        2949       2949       5898       2949         NA
    ##      X4       1720        1032       1032       2064       1032         NA
    ##      X5        605         363        363        726        363         NA
    ##      X6        980         588        588       1176        588         NA
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1        192         NA        960       1152
    ##      X2        286         NA       1430       1716
    ##      X3        983         NA       4915       5898
    ##      X4        344         NA       1720       2064
    ##      X5        121         NA        605        726
    ##      X6        196         NA        980       1176
    ## 
    ## , , subtypes = subtype_8
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1        314         628        628       1256         NA       1884
    ##      X2        328         656        656       1312         NA       1968
    ##      X3        380         760        760       1520         NA       2280
    ##      X4        170         340        340        680         NA       1020
    ##      X5       1291        2582       2582       5164         NA       7746
    ##      X6        844        1688       1688       3376         NA       5064
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1         NA         NA       1884        628
    ##      X2         NA         NA       1968        656
    ##      X3         NA         NA       2280        760
    ##      X4         NA         NA       1020        340
    ##      X5         NA         NA       7746       2582
    ##      X6         NA         NA       5064       1688
    ## 
    ## , , subtypes = subtype_9
    ## 
    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1       3405        2043       1362       4086       1362       4086
    ##      X2        305         183        122        366        122        366
    ##      X3        935         561        374       1122        374       1122
    ##      X4       2525        1515       1010       3030       1010       3030
    ##      X5       1745        1047        698       2094        698       2094
    ##      X6        280         168        112        336        112        336
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1       1362         NA       3405       1362
    ##      X2        122         NA        305        122
    ##      X3        374         NA        935        374
    ##      X4       1010         NA       2525       1010
    ##      X5        698         NA       1745        698
    ##      X6        112         NA        280        112

\#Apply_by()

``` r
#We can apply a function on the stratifiedFeatureTable with the apply_by() function. 

stf = as.stratifiedFeatureTable(sdf)

#MARGIN must be exactly 1, 2 or 3, corresponding to applying a function on all observations (1) per sample, (2) per feature or (3) per subtype.  

#for example, we can collapse to an unstratified feature table by summing all subtypes of the same feature. 
apply_by(X = stf, MARGIN = 3, FUN = sum)
```

    ##        features
    ## samples function_1 function_10 function_2 function_3 function_4 function_5
    ##      X1      11304       11278      14122      20557      16511      13510
    ##      X2       7192       10315      12298      15275      10748      13172
    ##      X3       8328       13225      14891      12234      10124       9998
    ##      X4       6720        8276      10859       8584       5868       9487
    ##      X5       9928       15066      20047      19493      13232      22777
    ##      X6       4712       10609       9767      10142       7638      11580
    ##        features
    ## samples function_6 function_7 function_8 function_9
    ##      X1       9017       7781      18616       8049
    ##      X2      13888       6578      15278      13268
    ##      X3      11582       5505      16855      12958
    ##      X4       7855       2679       9436       5765
    ##      X5      18720       6859      24096      14108
    ##      X6       9464       6180      15003      10580
