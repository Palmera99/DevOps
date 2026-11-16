# SaludConecta - Portal Web de Reserva de Horas Médicas
> **Proyecto Integrador DevOps - Unidad 1 (Semana 3)**  
> **Estudiante:** Héctor Díaz Bravo  
> **Carrera:** Ingeniería en Informática  
> **Institución:** Instituto Profesional IACC (2026)  
> **Asignatura:** DevOps (DEVPS1301)

---

## 1. Descripción del Proyecto

Este proyecto responde a la necesidad de modernización DevOps para una empresa del rubro de la salud que administra una plataforma web de reserva de citas médicas. El modelo tradicional presentaba despliegues manuales cada dos semanas, fallas por discrepancias de dependencias en ambientes de prueba y riesgos de fuga de información.

La solución implementada adopta el paradigma DevOps mediante:
- **Contenedores Docker:** Empaquetado estandarizado, inmutable y reproducible con Nginx sobre Alpine Linux.
- **Docker Compose:** Orquestación local declarativa para levantar el servicio en un único comando.
- **Control de Versiones con Git:** Flujo colaborativo basado en ramas, Pull Requests y commits semánticos.
- **Automatización CI (GitHub Actions):** Pipeline que verifica la integridad de archivos, la ausencia de credenciales expuestas y la compilación exitosa de la imagen Docker.

---

## 2. Estructura del Repositorio

```text
proyecto-devops/
├── .github/
│   └── workflows/
│       └── devops-automation.yml    # Pipeline CI en GitHub Actions
├── src/
│   ├── index.html                   # Interfaz de reserva de horas y estado del servicio
│   └── styles.css                   # Hoja de estilos con diseño médico y responsivo
├── .env.example                     # Plantilla de variables de entorno seguras
├── .gitignore                       # Filtro de archivos sensibles, logs y temporales
├── docker-compose.yml               # Orquestación del servicio local en puerto 8080
├── Dockerfile                       # Definición de la imagen inmutable Nginx Alpine
└── README.md                        # Documentación técnica del proyecto
```

---

## 3. Requisitos Previos

- **Git:** v2.30 o superior.
- **Docker Desktop:** v20.10 o superior (con Docker Compose v2.0+).
- **Navegador Web:** Chrome, Edge, Firefox u otro para verificación de interfaz.

---

## 4. Instalación y Ejecución Local

### Paso 1: Clonar o descargar el repositorio
```bash
git clone https://github.com/tu-usuario/proyecto-devops.git
cd proyecto-devops
```

### Paso 2: Configurar las variables de entorno
Copie la plantilla de variables de entorno para crear su archivo `.env` local:
```bash
# En Windows PowerShell:
Copy-Item .env.example .env

# En Linux / macOS / Git Bash:
cp .env.example .env
```

### Paso 3: Construir y levantar el contenedor con Docker Compose
```bash
docker compose up -d --build
```

### Paso 4: Verificar el estado del servicio
```bash
docker compose ps
```
El contenedor `saludconecta-web` debe figurar con estado `Up (healthy)`.

---

## 5. Verificación Funcional

1. Abra su navegador web e ingrese a:
   [http://localhost:8080](http://localhost:8080)
2. Se desplegará la interfaz del **Portal de Reserva de Horas Médicas SaludConecta**, mostrando:
   - Indicador de estado del servicio (*Operativo - Nginx Alpine*).
   - Tarjetas de información y horarios de atención clínica.
   - Formulario de agendamiento de citas médicas.
3. Complete el formulario de prueba con sus datos y presione **Confirmar Reserva de Hora**. Se mostrará una confirmación dinámica en pantalla.

---

## 6. Monitoreo y Comandos de Operación

### Inspeccionar registros (Logs)
```bash
docker logs saludconecta-web
```

### Supervisar consumo de recursos (CPU, Memoria, Red)
```bash
docker stats --no-stream saludconecta-web
```

### Detener y remover el servicio
```bash
docker compose down
```

---

## 7. Buenas Prácticas de Seguridad Aplicadas

1. **Sin Secretos en el Código:** El repositorio no contiene contraseñas, tokens ni credenciales.
2. **Plantilla `.env.example`:** Solo se versiona una guía con valores por defecto seguros.
3. **Filtro estricto en `.gitignore`:** Se excluyen archivos `.env`, claves criptográficas (`*.pem`, `*.key`) y temporales.
4. **Imagen Base Mínima (`nginx:alpine`):** Minimiza la superficie de ataque y vulnerabilidades de librerías del sistema operativo.
5. **No Almacenamiento de Datos Médicos Reales:** El portal estático simula la experiencia sin persistir información confidencial de salud (cumplimiento de estándares de privacidad clínica).
