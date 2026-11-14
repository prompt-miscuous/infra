# infra

Shared Terraform infrastructure for the SPHEREx project (AWS, free tier).

```text
modules/static-site/  # reusable S3 + CloudFront static hosting
live/frontend/        # the frontend site (module instance)
```

## Bootstrap (once per AWS account)

Remote state lives in S3. Create the state bucket first:

```bash
aws s3api create-bucket --bucket spherex-tfstate-652992946953 --region us-east-1
aws s3api put-bucket-versioning --bucket spherex-tfstate-652992946953 \
  --versioning-configuration Status=Enabled
```

## Provision the frontend hosting

```bash
cd live/frontend
terraform init
terraform plan   # review; creates S3 bucket + CloudFront distribution
terraform apply  # confirm with "yes"
terraform output # site_url, bucket_name, distribution_id
```

CloudFront takes ~10–15 min to deploy on first apply.

## Deploy the site

```bash
cd ../../frontend && npm run build
aws s3 sync dist/ "s3://$(cd ../infra/live/frontend && terraform output -raw bucket_name)/" --delete
aws cloudfront create-invalidation --distribution-id "$(terraform output -raw distribution_id)" --paths "/*"
```

## Conventions

- One directory per app under `live/`; shared pieces go in `modules/`.
- `terraform fmt -check` must pass before pushing.
- Never commit `*.tfstate*` or `.terraform/` (see `.gitignore`).
