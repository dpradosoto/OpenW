FROM nginx:latest
RUN apt-get install git
RUN git clone https://github.com/dpradosoto/OpenW.git
RUN ls
COPY OpenW-master /usr/share/nginx/html
EXPOSE 80