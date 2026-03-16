# Shopping CRUD API with Spring Boot and Google Cloud SQL

This project is a sample Spring Boot application that provides a RESTful API for managing shopping products (CRUD operations) and is configured to connect to Google Cloud SQL (MySQL) for persistent storage. It is ready for deployment in Google Cloud Platform (GCP) environments.

## Features
- CRUD operations for products: productId, productName, price, quantity
- Spring Boot REST API
- JPA/Hibernate for ORM
- Google Cloud SQL (MySQL) integration

## Setup

1. **Configure Cloud SQL:**
   - Create a MySQL instance in Google Cloud SQL.
   - Note the instance connection name, database name, username, and password.

2. **Configure `application.properties`:**
   - Edit `src/main/resources/application.properties` and set:
     - `<YOUR_DATABASE_NAME>`
     - `<YOUR_INSTANCE_CONNECTION_NAME>`
     - `<YOUR_DB_USER>`
     - `<YOUR_DB_PASSWORD>`

3. **Build and Run Locally:**
   - Make sure you have Java 17+ and Maven installed.
   - Run:
     ```
     mvn clean install
     mvn spring-boot:run
     ```

4. **Deploy to GCP:**
   - Use Google Cloud Build, App Engine, or Cloud Run for deployment.
   - Ensure the service account has Cloud SQL Client permissions.

## API Endpoints
- `GET /api/products` - List all products
- `GET /api/products/{id}` - Get product by ID
- `POST /api/products` - Create new product
- `PUT /api/products/{id}` - Update product
- `DELETE /api/products/{id}` - Delete product

## Notes
- The application uses the Cloud SQL Socket Factory for secure connection to Cloud SQL.
- Update the placeholders in `application.properties` with your actual GCP Cloud SQL details.
