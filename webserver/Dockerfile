FROM node:lts-alpine as builder
WORKDIR /frontend

ARG VITE_BASE_URL=http://localhost
ARG VITE_GEOCODE_KEY=
ENV VITE_BASE_URL=$VITE_BASE_URL
ENV VITE_GEOCODE_KEY=$VITE_GEOCODE_KEY

COPY ./frontend/package.json ./frontend/package-lock.json ./
RUN npm ci
COPY ./frontend .
RUN npm run build

FROM nginx:alpine
COPY ./webserver/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /frontend/dist /usr/share/nginx/html
