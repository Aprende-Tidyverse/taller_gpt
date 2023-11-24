library(rvest)
library(janitor)
library(purrr)

url <- read_html("https://es.wikipedia.org/wiki/Distritos_de_Costa_Rica") |> 
  html_elements(xpath = "//*[contains(text(),'Lista de distritos')]") |> 
  html_attr("href")

url <- paste0("https://es.wikipedia.org",url)

info <- map_chr(url, function(x){
  
  df <- read_html(x) |> 
    html_table() |> 
    keep_at(2) |> 
    list_rbind() |> 
    clean_names()
  
  paste0(df$canton,":",df$nombre_del_distrito, collapse = " ")
})
