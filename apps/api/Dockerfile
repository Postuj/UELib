FROM node:18-alpine

WORKDIR /api

COPY yarn.lock package*.json .env ./

RUN yarn install --frozen-lockfile

COPY . .

ENV PORT=3001

# RUN npm run build

EXPOSE 3001

# CMD [ "node", "dist/main.js" ]

CMD [ "yarn", "start:dev" ]