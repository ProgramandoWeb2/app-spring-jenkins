# Usar una imagen base de JDK (usualmente openjdk)
FROM eclipse-temurin:21-jdk-alpine

# Crear un directorio para la aplicación
VOLUME /tmp

# Añadir el archivo JAR en el contenedor
ARG JAR_FILE=target/app-spring-jenkins-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar

# Exponer el puerto en el que la aplicación estará disponible (ajusta según tu configuración)
EXPOSE 8080

# Ejecutar el archivo JAR cuando se inicie el contenedor
ENTRYPOINT ["java","-jar","/app.jar"]