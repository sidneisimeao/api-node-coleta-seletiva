## Comando obrigatório
## Baixa a imagem do node com versão alpine (versão mais simplificada e leve)
FROM node:latest

## Define o local onde o app vai ficar no disco do container
## Pode ser o diretório que você quiser
WORKDIR /usr/app

## Copia tudo que começa com package e termina com .json para dentro da pasta /usr/app
COPY package*.json ./

# Pacotes globais
RUN npm install -g ts-node-dev knex

## Executa npm install para adicionar as dependências e criar a pasta node_modules
RUN npm install 

## Copia tudo que está no diretório onde o arquivo Dockerfile está 
## para dentro da pasta /usr/app do container
## Vamos ignorar a node_modules por isso criaremos um .dockerignore
COPY . .

## Container ficará ouvindo os acessos na porta 3000
EXPOSE 3000
