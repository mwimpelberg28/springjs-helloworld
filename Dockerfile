# Run stage
FROM openjdk:latest
WORKDIR /app
COPY hello-world-1.0.jar /app/hello-world-1.0.jar
COPY ./application.properties /app/
COPY opentelemetry-javaagent.jar /app/
ENTRYPOINT ["java", "-javaagent:opentelemetry-javaagent.jar", "-Dotel.metrics.exporter=otlp", "-Dotel.exporter.otlp.endpoint=http://grafana-k8s-monitoring-alloy-receiver.grafana.svc.cluster.local:4318",  "-Dotel.exporter.otlp.metrics.endpoint=http://grafana-k8s-monitoring-alloy-receiver.grafana.svc.cluster.local:4318/v1/metrics", "-Dmanagement.opentelemetry.metrics.export.step=5s",  "-jar", "./hello-world-1.0.jar"
