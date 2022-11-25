docker build -t badpassword-logstash .
docker run -e outputIp=127.0.0.2 -p 5044:5044 -it badpassword-logstash
