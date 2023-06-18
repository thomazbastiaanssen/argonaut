# argonaut

An R package about dealing with stratified feature tables.

Please note this package is under active development.

``` r
library(argonaut)
#make some dummy data
sdf <- dummy_strat(2, 3, 4)
 
head(sdf)
```

    ##                      X1 X2 X3 X4
    ## microbe_1|function_1  1  7 13 19
    ## microbe_1|function_2  2  8 14 20
    ## microbe_1|function_3  3  9 15 21
    ## microbe_2|function_1  4 10 16 22
    ## microbe_2|function_2  5 11 17 23
    ## microbe_2|function_3  6 12 18 24

``` r
#wrangle to stratifiedFeatureTable
as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = microbe_1
    ## 
    ##        features
    ## samples function_1 function_2 function_3
    ##      X1          1          2          3
    ##      X2          7          8          9
    ##      X3         13         14         15
    ##      X4         19         20         21
    ## 
    ## , , subtypes = microbe_2
    ## 
    ##        features
    ## samples function_1 function_2 function_3
    ##      X1          4          5          6
    ##      X2         10         11         12
    ##      X3         16         17         18
    ##      X4         22         23         24

``` r
#argonaut is robust to incomplete input, for example when a microbe doesn't have a gene. 

sdf <- sdf[-c(2, 4),]

as.stratifiedFeatureTable(sdf)
```

    ## An object of class "stratifiedFeatureTable"
    ## , , subtypes = microbe_1
    ## 
    ##        features
    ## samples function_1 function_2 function_3
    ##      X1          1         NA          3
    ##      X2          7         NA          9
    ##      X3         13         NA         15
    ##      X4         19         NA         21
    ## 
    ## , , subtypes = microbe_2
    ## 
    ##        features
    ## samples function_1 function_2 function_3
    ##      X1         NA          5          6
    ##      X2         NA         11         12
    ##      X3         NA         17         18
    ##      X4         NA         23         24
