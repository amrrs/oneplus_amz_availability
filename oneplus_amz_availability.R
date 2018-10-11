library(rvest) #for scraping 
library(stringr) #for string manipulation
library(notifier) #for desktop notifications


#change the url in the below function to your desired product 

oneplus6gb <- read_html("https://www.amazon.in/OnePlus-Mirror-Black-64GB-Storage/dp/B0756Z43QS")

#validation

#oneplus8gb <- read_html("https://www.amazon.in/OnePlus-Mirror-Black-128GB-Storage/dp/B0756VRJ25/")


#below code finds the div id availability and then extracts the text and does some cleaning

result <- oneplus6gb %>% html_node("#availability") %>% html_text() %>% str_replace_all("\n","") %>% trimws()

# for console printing 

print(result)

#oneplus8gb %>% html_node("#availability") %>% html_text() 

# beauty of notification
notifier::notify( title = as.character(Sys.time()),
                  msg = result)