# Flyshare

Simple self-hosted temporary file-sharing setup, using [plik](https://github.com/root-gg/plik) and hosted on [fly.io](https://fly.io/).
The backend database is on [Google Cloud Storage](https://cloud.google.com/storage).

## Installation

   * Set up a [Google Cloud Storage](https://cloud.google.com/storage) bucket for the backend
   * Set up a [service account](https://cloud.google.com/storage/docs/projects#service-accounts) with access to the bucket
   * [Generate a key](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) for the service account and download it
   * Deploy using `flyctl`
       ```bash
       ## Generate a unique name for the app
       $ APP_NAME=$( ls -id . | awk '{printf("flyshare-%s-%d\n", ENVIRON["USER"], $1)}' )
       $ flyctl launch --name "$APP_NAME" --no-deploy
       ```
   * Add the downloaded service account key as a secret using `flyctl`
        ```bash
        $ flyctl secrets set GCS_CREDS="$( cat my-service-account-key.json )"
        ```
   * Deploy
         ```bash
         $ flyctl deploy
         $ flyctl open
         ```

## Managing User Accounts

```bash
$ flyctl ssh console --command sh
$ ./plikd --config plikd.cfg user create --login username --name FullName
```

## References

   * https://fly.io/docs/getting-started/dockerfile/
   * https://github.com/root-gg/plik
