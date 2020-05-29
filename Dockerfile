
FROM google/cloud-sdk:alpine
RUN gcloud components install bigtable beta cbt


RUN addgroup -S appgroup && adduser -S appuser -G appgroup -h /home/appuser
USER appuser

WORKDIR /home/appuser



ADD cbtrc /home/appuser/.cbtrc
ARG BIGTABLE_PROJECT=local
ARG BIGTABLE_INSTANCE=local

RUN sed -i "s/<project>/$BIGTABLE_PROJECT/" /home/appuser/.cbtrc \
 && cat /home/appuser/.cbtrc
RUN sed -i "s/<instance>/$BIGTABLE_INSTANCE/" /home/appuser/.cbtrc \
 && cat /home/appuser/.cbtrc

EXPOSE 8086
ENTRYPOINT gcloud beta emulators bigtable start --host-port=0.0.0.0:8086