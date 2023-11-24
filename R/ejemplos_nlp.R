library(httr2)
library(jsonlite)
library(readr)


gpt4_turbo <- function(.prompt = NA, input = NA){
  # Asegúrate de tener tu clave de API de OpenAI
  openai_api_key <- Sys.getenv("OPENAI_API_KEY")
  
  # Crear un objeto de solicitud
  req <- request("https://api.openai.com/v1/chat/completions") |>
    req_headers(
      `Content-Type` = "application/json",
      `Authorization` = paste("Bearer", openai_api_key)
    ) |>
    req_body_json(list(
      model = "gpt-4",
      messages = list(
        list(role = "system", content = .prompt),
        list(role = "user", content = input)
      ),
      temperature = 1,
      max_tokens = 500,
      top_p = 1,
      frequency_penalty = 0,
      presence_penalty = 0
    ))
  
  # Enviar la solicitud y obtener la respuesta
  respuesta <- req |> req_perform()
  
  # Procesar la respuesta
  contenido <- respuesta |> resp_body_json()
  contenido <- contenido$choices[[1]]$message$content
 
  return(contenido)
  
}

clientes <- data.frame(
  nombre = c(
    "karla de los angeles castro lopez",
    "carlos Aguero",
    "maria de los angeles lopez lopez",
    "usnavy batista"
  ),
  direccion = c(
    "100m sur de la UCR rodrigo facio",
    "puntarenas, corredores, paso canoas",
    "san vito, puntarenas",
    "potrero grande, puntarenas"
  ),
  profesion = c(
    "profesora universitaria",
    "educacion prescolar",
    "ingeniero electrico",
    "vendedor"
  )
)



x <- gpt4_turbo(
  .prompt = '
    retorna en formato json los nombres y apellidos por separado en el siguiente formato:
  [
    {
        "nombre": "marta eugenia",
        "apellidos": "castro lopez"
    },
    {
        "nombre": "carlos andrey",
        "apellidos": "aguero"
    },
    {
        "nombre": "maria de los angeles",
        "apellidos": "lopez lopez"
    },
    {
        "nombre": "jose maria",
        "apellidos": "castro"
    }
]
  ',
  input = paste0(clientes$nombre, collapse = ",")
)

x <- fromJSON(x)
x



# direcciones -----------------------------------------------------------------------------------------------------
p <- paste0(read_lines("inst/direcciones.txt"), collapse = " ")
x <- gpt4_turbo(
  .prompt = p,
input = paste0(clientes$direccion, collapse = ",")
)

x <- fromJSON(x)
x


# generalizar categorias ------------------------------------------------------------------------------------------

p <- paste0(read_lines("inst/tipos_trabajo.txt"), collapse = " ")
x <- gpt4_turbo(
  .prompt = p,
input = paste0(clientes$profesion, collapse = ",")
)

x <- fromJSON(x)
x

