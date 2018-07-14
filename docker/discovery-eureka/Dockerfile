# 基于某个镜像
FROM java:8

# 本地文件挂载到当前容器
VOLUME /tmp

# 复制文件到容器，也可以直接写成ADD microservice-discovery-eureka-0.0.1-SNAPSHOT.jar /app.jar
ADD microservice-discovery-eureka-0.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'

# 声明暴露端口
EXPOSE 9000

# 配置容器启动后执行命令
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
