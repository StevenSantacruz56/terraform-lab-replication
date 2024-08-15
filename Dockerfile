# Usa una imagen mínima como base
FROM alpine:3.18

# Añade un archivo vacío para crear una capa adicional
RUN touch /empty-file

# Añade una etiqueta para la imagen
LABEL name="placeholder-image"

LABEL name="placeholder-image-steven"