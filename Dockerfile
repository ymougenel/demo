FROM tomcat:8.5.37-jre8

COPY target/demo.war /usr/local/tomcat/webapps/ 
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
