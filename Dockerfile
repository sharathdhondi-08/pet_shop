from tomcat:10.1

run apt-get update && apt-get install -y maven git && rm -rf /var/lib/apt/lists/*

run git clone https://github.com/sharathdhondi-08/pet_shop.git /opt/petshop

workdir /opt/petshop

run mvn clean package

run rm -rf /usr/local/tomcat/webapps/*

run cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

run cp /opt/petshop/target/*. war /usr/local/tomcat/webapps/petshop.war
