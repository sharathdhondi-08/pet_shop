# ========================================================
# STAGE 1: Build the Java application using Maven
# ========================================================
FROM maven:3.9-eclipse-temurin-17 AS builder

# Set the working directory to where you want the app to live
WORKDIR /app

# Clone your project directly INTO the current working directory (".")
RUN git clone https://github.com/sharathdhondi-08/pet_shop.git .

# Compile your code and package the WAR file
RUN mvn clean package

# ========================================================
# STAGE 2: Create the lightweight production Tomcat runtime
# ========================================================
FROM tomcat:10.1

RUN rm -rf /usr/local/tomcat/webapps/*
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/ || true

# Copies seamlessly from the correct working directory path (/app/target/)
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/petshop.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
