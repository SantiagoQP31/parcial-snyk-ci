# Se actualiza a una versión LTS actual con base Alpine para mitigar vulnerabilidades del SO base
FROM node:20-alpine

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Actualizar el gestor de paquetes global (npm) para parchar vulnerabilidades internas (glob, tar, minimatch)
RUN npm install -g npm@latest pacote@latest

# Copiar package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instalar dependencias de la app
RUN npm install

# Copiar el resto del código de la aplicación al directorio de trabajo
COPY . .

# Exponer el puerto en el que se ejecuta la aplicación
EXPOSE 3000

# Define el comando para ejecutar la aplicación
CMD ["npm", "start"]
