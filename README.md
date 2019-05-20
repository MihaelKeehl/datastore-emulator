# Google Cloud Datastore Emulator

[Google Cloud Datastore Emulator](https://cloud.google.com/datastore/docs/tools/datastore-emulator/) unofficial container image for testing.

## Environment variables

Please set:

- `DATASTORE_PROJECT_ID`: The ID of the Google Cloud project for the emulator.

Optionally, set the address to listen on:

- `DATASTORE_LISTEN_ADDRESS`: defaults to `0.0.0.0:8081`. Datastore default port is 8081

## Application variables

Please set these variables in the application to connect to emulator:

- `DATASTORE_EMULATOR_HOST`: The listen address used by the emulator.
- `DATASTORE_PROJECT_ID`: The ID of the Google Cloud project used by the emulator.

[Running the Datastore mode Emulator](https://cloud.google.com/datastore/docs/tools/datastore-emulator)

### Emulator options

These options are supported: `--no-store-on-disk` and `--consistency`.
[Datastore Emulator Start](https://cloud.google.com/sdk/gcloud/reference/beta/emulators/datastore/start).

The image has a volume mounted at `/data` by default.


## Creating a Datastore emulator

[Docker Compose](https://docs.docker.com/compose).

```YAML
version: "2"

services:
  datastore:
    image: MihaelKeehl/datastore-emulator:latest
    environment:
      - DATASTORE_PROJECT_ID=project-test
    ports:
      - "8081:8081"
```

K8s:

kubectl run datastore-emulator --image=singularities/datastore-emulator:latest --restart=Always --env=DATASTORE_PROJECT_ID=${DATASTORE_PROJECT_ID} --port=8081
kubectl expose deployment datastore-emulator --port 8081 --target-port 8081 --name datastore-emulator --type ClusterIP
kubectl wait --for=condition=Ready pod -l run=datastore-emulator --timeout 1m
