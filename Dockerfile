FROM node:18 AS builder

# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package.json ./
COPY yarn.lock ./
COPY prisma ./prisma/

# Install app dependencies
RUN yarn install

COPY . .

EXPOSE 3000
CMD [ "yarn", "start:dev" ]

# RUN yarn build

# FROM node:18

# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/package.json ./
# COPY --from=builder /app/yarn.lock ./
# COPY --from=builder /app/dist ./dist

# EXPOSE 3333
# CMD [ "yarn", "start:prod" ]
