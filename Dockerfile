FROM nginx
MAINTAINER samuelololol <samuelololol@gmail.com>
EXPOSE 4281
RUN apt-get update;\
    apt-get -y install ssh wget vim;\
    apt-get clean;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

