# ========================================================
# STAGE 1: Build the Java application using Maven
# ========================================================
FROM maven:3.9-eclipse-temurin-17 AS builder

# Set a working directory inside the build container
WORKDIR /app

# Clone your project directly inside this builder stage
RUN git clone https://github.com/sharathdhondi-08/pet_shop.git /opt/petshop

# Compile your code and package the WAR file
RUN mvn clean package

# ========================================================
# STAGE 2: Create the lightweight production Tomcat runtime
# ========================================================
FROM tomcat:10.1

# Clean out default Tomcat placeholder webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Fix for Tomcat 10's default layout structure 
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/ || true

# Copy ONLY the compiled .war file from the builder stage
# (This acts like a bridge between the two image blocks)
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/petshop.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

