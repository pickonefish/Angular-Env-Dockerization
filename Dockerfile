FROM nginx

COPY docker/start.sh /
COPY docker/buildConfig.sh /
RUN chmod +x /start.sh /buildConfig.sh

#COPY docker/myapp.nginx.conf /etc/nginx/conf.d/default.conf
COPY build /usr/share/nginx/html

ENV MYAPP_OPTION_A="Default1 option A value"
ENV MYAPP_OPTION_B="Default2 option B value"
ENV MYAPP_OPTION_C="Default3 option C value"

CMD ["/start.sh"]
