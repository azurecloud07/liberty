FROM websphere-liberty:kernel
COPY /config/server.xml /config
USER root
RUN chown 1001:0 /config/server.xml
USER 1001
#COPY --from=staging /staging/lib.index.cache /lib.index.cache
COPY target/veda-itg-core-0.0.1-SNAPSHOT.war /config/dropins/veda-itg-core-0.0.1-SNAPSHOT.war

#RUN configure.sh
