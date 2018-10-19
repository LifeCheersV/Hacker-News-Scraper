# Hacker News - Scraper

## Installation

You can install `rvest` from [CRAN](https://cran.r-project.org/package=rvest) with:

``` r
install.packages('rvest')
```
## Example

Get Current scores of Hacker News:

``` r
library(rvest)

#read html code:
mainpage <- read_html ('https://news.ycombinator.com/')

#read html node for Title:
title <- html_nodes(mainpage, 'td:nth-child(3) > a')  %>% html_text()

#output
title

#read html node for Link-Domain:
domain <- html_nodes(mainpage, 'td:nth-child(3) > span > a > span')  %>% html_text()

#output
domain

#read html node for Age of the link:
age <- html_nodes(mainpage, 'span.age')  %>% html_text()

#output
age

## Create Dataframe for further analysis:

data1 <- data.frame (title = title, link_domain = domain, Age = age)
View(data1)
