# Cloud big table emulator with cbt tool installed

A docker image `FROM google/cloud-sdk:alpine` that `gcloud beta emulators bigtable start` and adds the CBT tool which allows you to configure your docker compose to use the CBT tool against the local big table emulator.

## Running with docker-compose

Add the `BIGTABLE_EMULATOR_HOST` environment variable set to your local hostname.
Create a .cbtrc file consiting of the project and instance names.
E.G.

.cbtrc
project = local  
instance = local

Add this file to the docker compose container as a volume.


E.G
```
bigtable:
    image: ianherbert/bigtable-emulator-cbt
    ports:
        - "8086:8086"
    volumes:
      - ./.cbtrc:/home/cbtuser/.cbtrc
    environment:
      BIGTABLE_EMULATOR_HOST: bigtable:8086
```

## Query the local big table emulator using CBT

docker-compose exec bigtable cbt read links
