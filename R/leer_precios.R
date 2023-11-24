library(pins)
library(readr)

# usando pins y posit connect
board <- board_connect()
datos <- pin_read(board, "aguero/precios")
pins::pin_versions(board, "aguero/precios")
datos

# leer directamente

datos <- read_rds("http://connect.aprendetidyverse.com/precios-leche/precios.rds")
datos
