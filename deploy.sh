docker build -t zalcyone/multi-client:latest -t zalcyone/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t zalcyone/multi-server:latest -t zalcyone/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t zalcyone/multi-worker:latest -t zalcyone/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push zalcyone/multi-client:latest
docker push zalcyone/multi-client:$SHA
docker push zalcyone/multi-server:latest
docker push zalcyone/multi-server:$SHA
docker push zalcyone/multi-worker:latest
docker push zalcyone/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=zalcyone/multi-client:$SHA
kubectl set image deployments/server-deployment server=zalcyone/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=zalcyone/multi-worker:$SHA