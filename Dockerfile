# Usa una versión optimizada y actualizada de Node.js
FROM node:18-alpine

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar package.json y package-lock.json para instalar dependencias
COPY package*.json ./

# Configurar el entorno de producción
ENV NODE_ENV=production

# Instalar solo las dependencias de producción
RUN npm install --only=production

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto en el que se ejecuta la aplicación
EXPOSE 3000

# Crear un usuario no-root y cambiar a este usuario
RUN addgroup appgroup && adduser -S appuser -G appgroup
USER appuser

# Definir el comando para ejecutar la aplicación
CMD ["npm", "start"]
