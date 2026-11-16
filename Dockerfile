# ====================================================================
# Dockerfile - Servicio Web de Reserva de Horas Médicas
# Proyecto Integrador DevOps - Unidad 1 (Semana 3)
# Estudiante: Héctor Díaz Bravo | Carrera: Ingeniería en Informática
# ====================================================================

FROM nginx:alpine

# Metadatos del contenedor
LABEL maintainer="Héctor Díaz Bravo <hector.diaz@alumnos.iacc.cl>"
LABEL description="Servidor web estático Nginx para reserva de citas médicas"
LABEL version="1.0.0"

# Establecer directorio de trabajo
WORKDIR /usr/share/nginx/html

# Eliminar contenido por defecto de Nginx
RUN rm -rf ./*

# Copiar archivos estáticos de la aplicación
COPY src/ /usr/share/nginx/html/

# Exponer el puerto estándar HTTP
EXPOSE 80

# Verificación de salud del contenedor (Healthcheck)
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Comando por defecto para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
