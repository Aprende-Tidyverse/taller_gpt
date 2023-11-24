
library(httr2)

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
      list(role = "system", content = "
            quiero que lo escriba en reversa
           "),
      list(role = "user", content = "
           texto de prueba
           ")
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
contenido
