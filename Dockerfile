FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD npm run build

# second phase of copying build files generated in previous step in /app/build to this phase and run nginx

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
