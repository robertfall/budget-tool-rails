set -e

docker kill `docker ps -f name=budget-app -q`
docker run --link postgres -itd --name budget-app -p 80:3000 budget-tool-production:1.0.0 rails server -b 0.0.0.0