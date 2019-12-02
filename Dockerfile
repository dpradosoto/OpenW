FROM nginx:latest
RUN apt update
RUN apt install git
RUN git --version
RUN git clone https://github.com/dpradosoto/OpenW.git
RUN ls
COPY OpenW-master /usr/share/nginx/html
EXPOSE 80