FROM nginx:latest
RUN apk update && \
    apk add --update git
RUN apk install git\  
RUN git --version
RUN git clone https://github.com/dpradosoto/OpenW.git
RUN ls
COPY OpenW-master /usr/share/nginx/html
EXPOSE 80