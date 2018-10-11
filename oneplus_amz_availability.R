library(rvest)
library(stringr)
library(notifier)

oneplus6gb <- read_html("https://www.amazon.in/OnePlus-Mirror-Black-64GB-Storage/dp/B0756Z43QS")

#validation

#oneplus8gb <- read_html("https://www.amazon.in/OnePlus-Mirror-Black-128GB-Storage/dp/B0756VRJ25/")

result <- oneplus6gb %>% html_node("#availability") %>% html_text() %>% str_replace_all("\n","") %>% trimws()

print(result)

#oneplus8gb %>% html_node("#availability") %>% html_text() 

notifier::notify( title = as.character(Sys.time()),
                  msg = result)