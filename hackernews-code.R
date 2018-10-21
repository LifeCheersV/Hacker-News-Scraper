library(rvest)
mainpage <- read_html ('https://news.ycombinator.com/')
title <- html_nodes(mainpage, 'td:nth-child(3) > a')  %>% html_text()
title
domain <- html_nodes(mainpage, 'td:nth-child(3) > span > a > span')  %>% html_text()
domain
age <- html_nodes(mainpage, 'span.age')  %>% html_text()
age
data1 <- data.frame (title = title, link_domain = domain, Age = age)
View(data1)
