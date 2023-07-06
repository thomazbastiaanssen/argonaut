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
    ## subtype_02|feature_02  5 11 17 23

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = subtype_01
    ## 
    ##             samples
    ## features     X1 X2 X3 X4
    ##   feature_01 NA NA NA NA
    ##   feature_02  2  8 14 20
    ##   feature_03  3  9 15 21
    ## 
    ## , , subtypes = subtype_02
    ## 
    ##             samples
    ## features     X1 X2 X3 X4
    ##   feature_01  4 10 16 22
    ##   feature_02  5 11 17 23
    ##   feature_03 NA NA NA NA

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 
sdf <- dummy_strat(10, 5, 6, type = "by_subtype", p_missing = 0.2)

head(sdf)
```

    ##                          X1   X2   X3   X4   X5   X6
    ## subtype_001|feature_01 4290 1290 2016  414 3150 6240
    ## subtype_001|feature_02 3575 1075 1680  345 2625 5200
    ## subtype_001|feature_03 4290 1290 2016  414 3150 6240
    ## subtype_001|feature_04 1430  430  672  138 1050 2080
    ## subtype_001|feature_05  715  215  336   69  525 1040
    ## subtype_002|feature_01  380 1716  712 2460 5888 4680

``` r
head(as.stratifiedFeatureTable(sdf))
```

    ## , , subtypes = subtype_001
    ## 
    ##             samples
    ## features       X1   X2   X3  X4   X5   X6
    ##   feature_01 4290 1290 2016 414 3150 6240
    ##   feature_02 3575 1075 1680 345 2625 5200
    ##   feature_03 4290 1290 2016 414 3150 6240
    ##   feature_04 1430  430  672 138 1050 2080
    ##   feature_05  715  215  336  69  525 1040
    ## 
    ## , , subtypes = subtype_002
    ## 
    ##             samples
    ## features      X1   X2   X3   X4   X5   X6
    ##   feature_01 380 1716  712 2460 5888 4680
    ##   feature_02 285 1287  534 1845 4416 3510
    ##   feature_03 570 2574 1068 3690 8832 7020
    ##   feature_04 475 2145  890 3075 7360 5850
    ##   feature_05 285 1287  534 1845 4416 3510
    ## 
    ## , , subtypes = subtype_003
    ## 
    ##             samples
    ## features       X1   X2   X3   X4    X5   X6
    ##   feature_01 5478 5616 1674 1224 13182 7746
    ##   feature_02 1826 1872  558  408  4394 2582
    ##   feature_03 4565 4680 1395 1020 10985 6455
    ##   feature_04 1826 1872  558  408  4394 2582
    ##   feature_05 1826 1872  558  408  4394 2582
    ## 
    ## , , subtypes = subtype_004
    ## 
    ##             samples
    ## features     X1 X2 X3 X4 X5 X6
    ##   feature_01 NA NA NA NA NA NA
    ##   feature_02 NA NA NA NA NA NA
    ##   feature_03 NA NA NA NA NA NA
    ##   feature_04 NA NA NA NA NA NA
    ##   feature_05 NA NA NA NA NA NA
    ## 
    ## , , subtypes = subtype_005
    ## 
    ##             samples
    ## features       X1   X2   X3  X4   X5   X6
    ##   feature_01 3806 3298 1070 216 1420 1054
    ##   feature_02 5709 4947 1605 324 2130 1581
    ##   feature_03 9515 8245 2675 540 3550 2635
    ##   feature_04   NA   NA   NA  NA   NA   NA
    ##   feature_05 7612 6596 2140 432 2840 2108
    ## 
    ## , , subtypes = subtype_006
    ## 
    ##             samples
    ## features      X1  X2 X3  X4  X5  X6
    ##   feature_01  60  57 24 114  57  90
    ##   feature_02  60  57 24 114  57  90
    ##   feature_03  40  38 16  76  38  60
    ##   feature_04 120 114 48 228 114 180
    ##   feature_05  NA  NA NA  NA  NA  NA
    ## 
    ## , , subtypes = subtype_007
    ## 
    ##             samples
    ## features       X1    X2   X3   X4    X5   X6
    ##   feature_01 5350 11885 1455 8110 10180 1690
    ##   feature_02 6420 14262 1746 9732 12216 2028
    ##   feature_03 4280  9508 1164 6488  8144 1352
    ##   feature_04 3210  7131  873 4866  6108 1014
    ##   feature_05 5350 11885 1455 8110 10180 1690
    ## 
    ## , , subtypes = subtype_008
    ## 
    ##             samples
    ## features     X1  X2  X3  X4  X5  X6
    ##   feature_01  9  96 178 128  33  23
    ##   feature_02 NA  NA  NA  NA  NA  NA
    ##   feature_03 45 480 890 640 165 115
    ##   feature_04 27 288 534 384  99  69
    ##   feature_05 18 192 356 256  66  46
    ## 
    ## , , subtypes = subtype_009
    ## 
    ##             samples
    ## features      X1  X2  X3  X4 X5 X6
    ##   feature_01 134 302 120 196 42 56
    ##   feature_02 134 302 120 196 42 56
    ##   feature_03  NA  NA  NA  NA NA NA
    ##   feature_04 201 453 180 294 63 84
    ##   feature_05 201 453 180 294 63 84
    ## 
    ## , , subtypes = subtype_010
    ## 
    ##             samples
    ## features     X1 X2  X3 X4  X5 X6
    ##   feature_01 12  9  29 13  48 13
    ##   feature_02 60 45 145 65 240 65
    ##   feature_03 NA NA  NA NA  NA NA
    ##   feature_04 NA NA  NA NA  NA NA
    ##   feature_05 12  9  29 13  48 13

\#Apply_by()

``` r
#We can apply a function on the stratifiedFeatureTable with the apply_by() function. 

sft = as.stratifiedFeatureTable(sdf)

#MARGIN must be exactly 1, 2 or 3, corresponding to applying a function on all observations (1) per sample, (2) per feature or (3) per subtype.  

#for example, we can collapse to an unstratified feature table by summing all subtypes of the same feature. 
apply_by(X = sft, MARGIN = 3, FUN = sum)
```

    ##             samples
    ## features        X1    X2   X3    X4    X5    X6
    ##   feature_01 19519 24269 7278 12875 34000 21592
    ##   feature_02 18069 23847 6412 13029 26120 15112
    ##   feature_03 23305 26815 9224 12868 34864 23877
    ##   feature_04  7289 12433 3755  9393 19188 11859
    ##   feature_05 16019 22509 5588 11427 22532 11073
