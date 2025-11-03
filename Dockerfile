FROM nginx:1.15

RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update 
RUN apt-get install -y nano mc net-tools git sshpass curl
COPY . /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
