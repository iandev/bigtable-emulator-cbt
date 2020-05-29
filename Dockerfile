
FROM google/cloud-sdk:alpine
RUN gcloud components install bigtable beta cbt
RUN addgroup -S cbtgroup && adduser -S cbtuser -G cbtgroup -h /home/cbtuser
USER cbtuser
WORKDIR /home/cbtuser
EXPOSE 8086
ENTRYPOINT gcloud beta emulators bigtable start --host-port=0.0.0.0:8086