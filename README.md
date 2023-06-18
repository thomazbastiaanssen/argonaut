# argonaut

An R package about dealing with stratified feature tables.

Please note this package is under active development.

``` r
library(argonaut)
#make some dummy data
sdf <- dummy_strat(2, 3, 4, type = "seq")
 
head(sdf)
```

    ##                        X1 X2 X3 X4
    ## subtype_01|function_01  1  7 13 19
    ## subtype_01|function_02  2  8 14 20
    ## subtype_02|function_02  5 11 17 23
    ## subtype_02|function_03  6 12 18 24

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = subtype_01
    ## 
    ##        features
    ## samples function_01 function_02 function_03
    ##      X1           1           2          NA
    ##      X2           7           8          NA
    ##      X3          13          14          NA
    ##      X4          19          20          NA
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##        features
    ## samples function_01 function_02 function_03
    ##      X1          NA           5           6
    ##      X2          NA          11          12
    ##      X3          NA          17          18
    ##      X4          NA          23          24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                           X1   X2   X3   X4   X5   X6
    ## subtype_001|function_01  236    0  212  700  268  340
    ## subtype_001|function_03  295    0  265  875  335  425
    ## subtype_001|function_04   59    0   53  175   67   85
    ## subtype_002|function_01 2184 2160 4548 1464 3678 4302
    ## subtype_002|function_03 1456 1440 3032  976 2452 2868
    ## subtype_002|function_04 1092 1080 2274  732 1839 2151

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1         236          NA         295          59          NA
    ##      X2           0          NA           0           0          NA
    ##      X3         212          NA         265          53          NA
    ##      X4         700          NA         875         175          NA
    ##      X5         268          NA         335          67          NA
    ##      X6         340          NA         425          85          NA
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1        2184          NA        1456        1092        1456
    ##      X2        2160          NA        1440        1080        1440
    ##      X3        4548          NA        3032        2274        3032
    ##      X4        1464          NA         976         732         976
    ##      X5        3678          NA        2452        1839        2452
    ##      X6        4302          NA        2868        2151        2868
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1        4497        8994        4497        4497        7495
    ##      X2          18          36          18          18          30
    ##      X3         597        1194         597         597         995
    ##      X4         513        1026         513         513         855
    ##      X5        1287        2574        1287        1287        2145
    ##      X6        1353        2706        1353        1353        2255
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1         580         116         116          NA         696
    ##      X2        6805        1361        1361          NA        8166
    ##      X3        7675        1535        1535          NA        9210
    ##      X4        9705        1941        1941          NA       11646
    ##      X5       12690        2538        2538          NA       15228
    ##      X6        1850         370         370          NA        2220
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1           4           8          16          16          24
    ##      X2         106         212         424         424         636
    ##      X3          16          32          64          64          96
    ##      X4           5          10          20          20          30
    ##      X5          29          58         116         116         174
    ##      X6          22          44          88          88         132
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1          NA         465         310          NA         155
    ##      X2          NA         129          86          NA          43
    ##      X3          NA         282         188          NA          94
    ##      X4          NA         342         228          NA         114
    ##      X5          NA         102          68          NA          34
    ##      X6          NA         216         144          NA          72
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1        3153          NA          NA        6306        1051
    ##      X2        4560          NA          NA        9120        1520
    ##      X3        1893          NA          NA        3786         631
    ##      X4        4281          NA          NA        8562        1427
    ##      X5         501          NA          NA        1002         167
    ##      X6        1014          NA          NA        2028         338
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1        1842          NA        3070         614        3070
    ##      X2         231          NA         385          77         385
    ##      X3        6111          NA       10185        2037       10185
    ##      X4        2145          NA        3575         715        3575
    ##      X5        1776          NA        2960         592        2960
    ##      X6         336          NA         560         112         560
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1         249         332         415         332          83
    ##      X2        1695        2260        2825        2260         565
    ##      X3         282         376         470         376          94
    ##      X4         177         236         295         236          59
    ##      X5          36          48          60          48          12
    ##      X6         714         952        1190         952         238
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1        1436        1436        2154        3590          NA
    ##      X2         254         254         381         635          NA
    ##      X3        2088        2088        3132        5220          NA
    ##      X4        2504        2504        3756        6260          NA
    ##      X5        2996        2996        4494        7490          NA
    ##      X6        1998        1998        2997        4995          NA

\#Apply_by()

``` r
#We can apply a function on the stratifiedFeatureTable with the apply_by() function. 

stf = as.stratifiedFeatureTable(sdf)

#MARGIN must be exactly 1, 2 or 3, corresponding to applying a function on all observations (1) per sample, (2) per feature or (3) per subtype.  

#for example, we can collapse to an unstratified feature table by summing all subtypes of the same feature. 
apply_by(X = stf, MARGIN = 3, FUN = sum)
```

    ##        features
    ## samples function_01 function_02 function_03 function_04 function_05
    ##      X1       14181       11351       12329       16506       14030
    ##      X2       15829        4252        6920       13614       12785
    ##      X3       23422        5507       19468       14407       24337
    ##      X4       21494        6059       12179       17213       18682
    ##      X5       23261        8316       14310       12441       23172
    ##      X6       11929        6286        9995       11764        8683
