
FROM google/cloud-sdk:alpine
RUN gcloud components install bigtable beta cbt
COPY cbtrc ~/.cbtrc
ARG BIGTABLE_PROJECT=local
ARG BIGTABLE_INSTANCE=local

RUN sed -i "s/<project>/$BIGTABLE_PROJECT/" ~/.cbtrc \
 && cat ~/.cbtrc
 RUN sed -i "s/<instance>/$BIGTABLE_INSTANCE/" ~/.cbtrc \
 && cat ~/.cbtrc

EXPOSE 8086
ENTRYPOINT gcloud beta emulators bigtable start --host-port=0.0.0.0:8086