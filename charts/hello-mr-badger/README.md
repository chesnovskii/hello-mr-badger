# Hello-mr-badger Helm Chart

## Get Repo Info

```console
helm repo add hello-mr-badger https://chesnovskii.github.io/hello-mr-badger/charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
# Helm install with hello-mr-badger namespace already created
helm install -n hello-mr-badger [RELEASE_NAME] hello-mr-badger/hello-mr-badger

# Helm install and create namespace
helm install -n hello-mr-badger [RELEASE_NAME] hello-mr-badger/hello-mr-badger --create-namespace

```

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Upgrade Chart

```console
$ helm upgrade -n hello-mr-badger [RELEASE_NAME] hello-mr-badger/hello-mr-badger
```

## Parameters

| Parameter                                     | Description                                                                                                                                                                                                                                         | Default                                                                   |
| :-------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------ |
| replicaCount                     | How many Pods should be maintaining                                                                                                                                                                                         | `1`                                            |
| container.image                  | Container image                                                                                                                                                                                               | `chesnovskii/hello-mr-badger:1.0`        |
| container.port                   | Container port                                                                                                                                                                                                | `8080`                                         |
| service.type                     | Service type                                                                                                                                                                                                | `ClusterIP`                                    |
| service.port                     |Service port                                                                                                                                                                                                | `8080`                                         |
