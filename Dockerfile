# Используем базовый образ Alpine 
FROM alpine:latest 
 
# Задаем аргумент по умолчанию для версии NGINX 
ARG NGINX_VERSION=latest 
 
# Устанавливаем пакеты NGINX и supervisord 
RUN apk update && apk add nginx supervisor 
 
# Копируем конфигурационные файлы в образ 
COPY nginx.conf /etc/nginx/nginx.conf 
COPY supervisord.conf /etc/supervisord.conf 
 
# Указываем команду, которая будет выполнена при запуске контейнера 
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

