FROM nginx:latest
RUN git clone https://github.com/dpradosoto/OpenW.git
COPY startbootstrap-resume-gh-pages /usr/share/nginx/html
EXPOSE 80