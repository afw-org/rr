FROM openjdk:11 as build-stage
COPY . /usr/src/rr
WORKDIR /usr/src/rr
RUN ./gradlew

FROM openjdk:11
COPY --from=build-stage /usr/src/rr/build/libs/rr.war /rr.war
