FROM node:lts-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# DevSecOps: Reducción de superficie de ataque.
# Se elimina por completo el gestor de paquetes tras su uso para erradicar vulnerabilidades heredadas.
RUN rm -rf /usr/local/lib/node_modules/npm \
    && rm -f /usr/local/bin/npm \
    && rm -f /usr/local/bin/npx

EXPOSE 3000

# Se ejecuta el motor de node directamente sin intermediarios
CMD ["node", "index.js"]
