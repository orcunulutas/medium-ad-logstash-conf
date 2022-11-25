FROM centos:7
ENV outputIp=127.0.0.1
EXPOSE 9600  5044
RUN yum -y install java-11 install wget unzip nc
WORKDIR /badpassword
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-8.5.1-linux-x86_64.tar.gz && tar -xvf logstash-8.5.1-linux-x86_64.tar.gz
RUN mkdir config scripts log data && ln -s logstash-8.5.1 logstash
RUN chmod -R 777 log data logstash/bin
COPY badPassword-log_logstash.json config/ 
COPY start.sh scripts/
WORKDIR /badpassword/scripts
RUN chmod +x start.sh && chmod +x /badpassword/logstash/bin/*
ENTRYPOINT /badpassword/scripts/start.sh
