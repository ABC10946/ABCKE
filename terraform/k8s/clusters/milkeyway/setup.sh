export CLOUDFLARE_API_TOKEN=$(vault kv get -format=json kv/cloudflare|jq -r '.data.data.API_TOKEN')
export AWS_SECRET_ACCESS_KEY=$(vault kv get -format=json kv/minio|jq -r '.data.data.AWS_SECRET_ACCESS_KEY')
export AWS_ACCESS_KEY_ID=$(vault kv get -format=json kv/minio|jq -r '.data.data.AWS_ACCESS_KEY_ID')
