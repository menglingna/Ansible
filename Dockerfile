# 指定基于的基础镜像
FROM centos:centos7.6

# 维护者信息
MAINTAINER menglingna "915930061@qq.com"

#工作目录
WORKDIR /app
#获取源码
#Install Ansible
#1、解压软件包
#拷贝软件包
COPY ansible-2.10.6.tar.gz ./
RUN chmod -R 775 /app/ansible-2.10.6
RUN yum install -y ansible

#设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

#jvm通用的参数配置
ENV JAVA_OPTIONS="-Djava.rmi.server.hostname=0.0.0.0 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=18080 -Dcom.sun.management.jmxremote.rmi.port=18080 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=10M -Xloggc:logs/gc.log -verbose:gc"

#jvm内存相关参数
ENV JVM_MEM="-Xms512M -Xmx1024M"








