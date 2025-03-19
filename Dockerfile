FROM openjdk:17-jdk-alpine

ENV INSTALL_PATH /barber-shop-api
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/barber-shop-api-0.0.1-SNAPSHOT.jar"]