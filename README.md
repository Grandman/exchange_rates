## Requiremets
This app uses sidekiq which uses Redis.

## Run

```
redis-server
foreman start
```
Go to http://127.0.0.1:3000/

## Configuring

In application there are some configurable params:
 - parse_job_interval - interval for run parsing dollar exchange rate (for example: 10m, 5s, 1d)
 - faye_auth_token - secret token for accepting messages of faye
 
You can edit this params in config/application.yml or run with same env variables, for example:

```
faye_auth_token=token parse_job_interval=5s foreman start
```
