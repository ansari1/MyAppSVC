# ==========================
# 1. BUILD STAGE (Maven)
# ==========================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy application source
COPY src ./src

# Build application (skips tests for speed)
RUN mvn clean package -DskipTests


# ==========================
# 2. RUNTIME STAGE (JRE)
# ==========================
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy JAR from build stage
COPY --from=builder /app/target/*.jar service.jar

# Cloud Run uses PORT environment variable
ENV PORT=8080
EXPOSE 8080

CMD ["java", "-jar", "service.jar"]