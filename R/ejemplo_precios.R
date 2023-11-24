library(rvest)
library(purrr)
library(tibble)
library(lubridate)

# automatizar la tarea
# mac/linux https://github.com/bnosac/cronR
# windows https://github.com/bnosac/taskscheduleR

tiendas <- list(
  list(
    tienda = "dos_pinos",
    url = "https://express.dospinos.com/leche-homogenizada-2-l-tb-15000194",
    xpath = "//span[contains(text(), '₡')]"
  ),
  list(
    tienda = "walmart",
    url = "https://www.walmart.co.cr/leche-dos-pinos-semidescremada-1000ml-2/p",
    xpath = "//div[contains(@class, 'vtex-store-components-3-x-sellingPrice')]/span/span"
  ),
  list(
    tienda = "masxmenos",
    url = "https://www.masxmenos.cr/leche-dos-pinos-semidescremada-1000ml-2/p",
    xpath = "//div[contains(@class, 'vtex-store-components-3-x-sellingPrice')]/span/span"
  )
)

precios <- map(tiendas, function(tienda){
  pagina <- read_html(tienda$url)
  
  precio <- pagina |> 
    html_element(xpath = tienda$xpath ) |> 
    html_text2()
  
  tibble(
    tienda = tienda$tienda,
    precio = precio, 
    fecha_hora = now()
  )
}) |> 
  list_rbind()

  
saveRDS(precios, paste0("/Users/aguero/Documents/GitHub/taller_gpt/data/precios_",now(),".rds"))
