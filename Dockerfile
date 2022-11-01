#base_image
FROM openjdk:17
LABEL maintainer="hasalas"
ADD docker-demo.jar docker-sb-demo.jar
ENTRYPOINT ["java", "-jar", "docker-sb-demo.jar"]


