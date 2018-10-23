
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
    ## [4] "Jepsen: MongoDB 3.6.4"                                 
    ## [5] "Multithreading Rust and Wasm"                          
    ## [6] "Why Are Japan’s Cherry Blossom Trees Blooming in Fall?"

#### Extracting Domain node

``` r
domain <- html_nodes(mainpage, 'td:nth-child(3) > span > a > span')  %>% html_text()
head(domain)
```

    ## [1] "ifixit.org"         "coinbase.com"       "bbc.co.uk"         
    ## [4] "jepsen.io"          "rustwasm.github.io" "smithsonianmag.com"

#### Extracting Age node

``` r
age <- html_nodes(mainpage, 'span.age')  %>% html_text()
head(age)
```

    ## [1] "3 hours ago"    "41 minutes ago" "56 minutes ago" "2 hours ago"   
    ## [5] "3 hours ago"    "2 hours ago"

#### Saving data in a Dataframe and viewing for further analysis

``` r
data1 <- data.frame (TITLE = title, LINK_DOMAIN = domain, AGE = age)
library(knitr)
kable(data1[1:6, ], caption = "Top Hacker News")
```

| TITLE                                                  | LINK\_DOMAIN       | AGE            |
|:-------------------------------------------------------|:-------------------|:---------------|
| Motorola and iFixit partner to sell phone repair kits  | ifixit.org         | 3 hours ago    |
| Coinbase is launching support for the USDC stablecoin  | coinbase.com       | 41 minutes ago |
| Nasa photographs rectangular iceberg                   | bbc.co.uk          | 56 minutes ago |
| Jepsen: MongoDB 3.6.4                                  | jepsen.io          | 2 hours ago    |
| Multithreading Rust and Wasm                           | rustwasm.github.io | 3 hours ago    |
| Why Are Japan’s Cherry Blossom Trees Blooming in Fall? | smithsonianmag.com | 2 hours ago    |
