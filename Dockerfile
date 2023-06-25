FROM ubuntu:latest
RUN apt-get update
RUN apt install default-jdk -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.89/bin/apache-tomcat-8.5.89.tar.gz .
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.89/* /opt/tomcat/.
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
                                       
