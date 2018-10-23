
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

    ## [1] "Coinbase is launching support for the USDC stablecoin"     
    ## [2] "Show HN: Websites in 2018"                                 
    ## [3] "Deterministic quantum teleportation through fiber channels"
    ## [4] "Multithreading Rust and Wasm"                              
    ## [5] "Motorola and iFixit partner to sell phone repair kits"     
    ## [6] "Jepsen: MongoDB 3.6.4"

#### Extracting Domain node

``` r
domain <- html_nodes(mainpage, 'td:nth-child(3) > span > a > span')  %>% html_text()
head(domain)
```

    ## [1] "coinbase.com"       "bloomca.me"         "sciencemag.org"    
    ## [4] "rustwasm.github.io" "ifixit.org"         "jepsen.io"

#### Extracting Age node

``` r
age <- html_nodes(mainpage, 'span.age')  %>% html_text()
head(age)
```

    ## [1] "1 hour ago"     "56 minutes ago" "1 hour ago"     "4 hours ago"   
    ## [5] "3 hours ago"    "3 hours ago"

#### Saving data in a Dataframe and viewing for further analysis

``` r
data1 <- data.frame (TITLE = title, LINK_DOMAIN = domain, AGE = age)
library(knitr)
kable(data1[1:6, ], caption = "Top Hacker News")
```

| TITLE                                                      | LINK\_DOMAIN       | AGE            |
|:-----------------------------------------------------------|:-------------------|:---------------|
| Coinbase is launching support for the USDC stablecoin      | coinbase.com       | 1 hour ago     |
| Show HN: Websites in 2018                                  | bloomca.me         | 56 minutes ago |
| Deterministic quantum teleportation through fiber channels | sciencemag.org     | 1 hour ago     |
| Multithreading Rust and Wasm                               | rustwasm.github.io | 4 hours ago    |
| Motorola and iFixit partner to sell phone repair kits      | ifixit.org         | 3 hours ago    |
| Jepsen: MongoDB 3.6.4                                      | jepsen.io          | 3 hours ago    |
