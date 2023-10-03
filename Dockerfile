FROM centos:latest

WORKDIR /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y
RUN yum -y install java

RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz /opt/tomcat
RUN tar -xvzf apache-tomcat-9.0.80.tar.gz
RUN cp -r apache-tomcat-9.0.80/* /opt/tomcat
RUN rm -rf apache-tomcat-9.0.80/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh" , "run"]
