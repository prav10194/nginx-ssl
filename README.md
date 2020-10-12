# nginx-ssl

Setting up a simple application to run nginx on port 80 and 443. 

Steps - 

1. The chart was created using the following command. **Note: You don't need to run this.**

```cmd
helm create nginx-https
```

2. Generate the certificate for ssl using openssl

```cmd
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=test.internal/O=test.internal"
```

3. After successfully genreating the certificates, create a secret

```cmd
kubectl create secret generic nginx-certs-keys --from-file=./nginx.crt --from-file=./nginx.key
```

4. Also create the config map for the default.conf containing the configuration for the nginx server

```cmd
kubectl create configmap nginxconfigmap --from-file=default.conf
```

5. Install the helm chart

```cmd
helm install test-nginx ./
```

In case you want to uninstall the chart

```cmd
helm uninstall test-nginx
```

6. To see the app running on localhost, run the following commands on 2 different terminals/cmd

```cmd
sudo oc port-forward svc/nginxsvc 80:80
sudo oc port-forward svc/nginxsvc 443:443
```

7. You can now connect to your service on http://localhost and https://localhost
