from maven:4.0.0-rc-7-eclipse-temurin-25-noble as builder

workdir /build

run git clone https://github.com/sharathdhondi-08/pet_shop.git .

run mvn clean package

from tomcat:jre25-temurin-resolute

run rm -rf /usr/local/tomcat/webapps/*

# run cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

copy --from=builder /build/target/*.war /usr/local/tomcat/webapps/petshop.war
