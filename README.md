# Taller de Integración de GPT con R

Este taller proporciona ejemplos prácticos de cómo integrar gpt-4 con R. Dentro de este repositorio, encontrarás dos ejemplos principales:

- Análisis de Precios de Supermercados: Para revisar este ejemplo, consulta el archivo R/ejemplos_precios.R.

- Procesamiento de Lenguaje Natural (NLP): Puedes encontrar este ejemplo en R/ejemplos_nlp.R.

-Los prompts utilizados en estos ejemplos se encuentran almacenados en la carpeta inst.

## Pasos para la Configuración

Para ejecutar correctamente el código de este taller, sigue los pasos a continuación:

+ Inicio del Proyecto en RStudio: Abre el proyecto RStudio utilizando taller_gpt.Rproj.

+ Instalación de Dependencias:Instala las dependencias necesarias (paquetes) del proyecto ejecutando el siguiente comando en R:

```r
renv::restore()
```

+ Configuración del Archivo .Renviron:Configura el archivo .Renviron para obtener acceso a la clave de la API de OpenAI. 

Añade la siguiente línea en tu archivo .Renviron, reemplazando "tu token de openai" con tu clave personal de la API de OpenAI:

```r
OPENAI_API_KEY = "tu token de openai"
```

### Notas Adicionales

Asegúrate de tener tu clave de API de OpenAI lista antes de iniciar la configuración.

Sigue las buenas prácticas de seguridad al manejar tu clave de API y no la compartas públicamente.
Con estos pasos, estarás listo para explorar las aplicaciones de GPT en el entorno de R. ¡Disfruta del taller!
