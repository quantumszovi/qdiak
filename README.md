# qdiak

This chart organizes the deployment process of the QDIAK bundle (frappe applications).

# Infrastructure and Deployment

```bash
# Enter the helmfile deployer container
docker compose -f helm/docker-compose.yaml run -it --rm qdiak-releaser
# Sync statefile (deploy app) for default env (deploys iskolaszovi2)
docker compose -f helm/docker-compose.yaml run -it --rm qdiak-releaser helmfile sync
# Deploy empty Frappe app
docker compose -f helm/docker-compose.yaml run -it --rm qdiak-releaser helmfile sync --environment=frappe
# Sync statefile (deploy app) for different env
docker compose -f helm/docker-compose.yaml run -it --rm qdiak-releaser helmfile sync --environment=<ENV_NAME>
# Delete environment
docker compose -f helm/docker-compose.yaml run -it --rm qdiak-releaser helmfile destroy # --environment=<ENV_NAME>
```

> Set up your .env in /helm/.env. Check /helm/.env.example for guidance.

# Checking deployed infrastructure

For insight check the NOTES.txt inside /helm/qdiak/qdiak and /helm/qdiak/qdiak-deps

# TODOs

- nfs-provisioner should be decoupled from the main helmfile for multi-env deployments in same cluster
