helm create nginx-https

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=test.internal/O=test.internal"

kubectl create secret generic nginx-certs-keys --from-file=./nginx.crt --from-file=./nginx.key

kubectl create configmap nginxconfigmap --from-file=default.conf