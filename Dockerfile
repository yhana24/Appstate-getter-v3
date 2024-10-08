FROM node:18-slim



WORKDIR /app

COPY package*.json ./

RUN npm install

RUN apt-get update && apt-get install -y \
    wget \
    chromium \
    fonts-noto-color-emoji \
    fonts-noto \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . .


ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

CMD ["node", "index"]
