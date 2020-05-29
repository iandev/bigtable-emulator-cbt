
FROM google/cloud-sdk:alpine
RUN gcloud components install bigtable beta cbt


RUN addgroup -S appgroup && adduser -S appuser -G appgroup -h /home/appuser
USER appuser
WORKDIR /home/appuser
EXPOSE 8086
ENTRYPOINT gcloud beta emulators bigtable start --host-port=0.0.0.0:8086