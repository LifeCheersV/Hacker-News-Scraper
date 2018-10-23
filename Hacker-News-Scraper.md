
### Description

Get latest Hacker News, including their Title and Domain from <https://news.ycombinator.com/>

#### calling "rvest" Library

``` r
library(rvest)
```

    ## Loading required package: xml2

#### Reading html file

``` r
mainpage <- read_html ('https://news.ycombinator.com/')
```

#### Extracting Title node

``` r
title <- html_nodes(mainpage, 'td:nth-child(3) > a')  %>% html_text()
head(title)
```

    ## [1] "Motorola and iFixit partner to sell phone repair kits" 
    ## [2] "Coinbase is launching support for the USDC stablecoin" 
    ## [3] "Nasa photographs rectangular iceberg"                  
    ## [4] "Multithreading Rust and Wasm"                          
    ## [5] "Jepsen: MongoDB 3.6.4"                                 
    ## [6] "Why Are Japan’s Cherry Blossom Trees Blooming in Fall?"

#### Extracting Domain node

``` r
domain <- html_nodes(mainpage, 'td:nth-child(3) > span > a > span')  %>% html_text()
head(domain)
```

    ## [1] "ifixit.org"         "coinbase.com"       "bbc.co.uk"         
    ## [4] "rustwasm.github.io" "jepsen.io"          "smithsonianmag.com"

#### Extracting Age node

``` r
age <- html_nodes(mainpage, 'span.age')  %>% html_text()
head(age)
```

    ## [1] "3 hours ago"    "31 minutes ago" "46 minutes ago" "3 hours ago"   
    ## [5] "2 hours ago"    "2 hours ago"

#### Saving data in a Dataframe and viewing for further analysis

``` r
data1 <- data.frame (TITLE = title, LINK_DOMAIN = domain, AGE = age)
View(data1)
```
