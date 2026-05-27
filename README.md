# PriorityFlow 🚀

🌐 **Live Deployment**: **[https://priorityflow-slp1.onrender.com](https://priorityflow-slp1.onrender.com)**

PriorityFlow is a premium, high-performance task management web application built on a modern Spring Boot architecture. Engineered for fluid interactivity and secure multi-tenant usage, it features lightweight servlet-level session authentication, robust JPA data mapping, dynamic H2/MySQL profile swapping, and a fully containerized Docker execution layer.

---

## 🛠️ Technology Stack

* **Backend Framework**: Spring Boot 4.0.6 (Java 21)
* **Persistence Layer**: Spring Data JPA & Hibernate ORM
* **Databases**: 
  * **H2 Database** (In-Memory, rapid development & testing)
  * **MySQL Database** (Persistent production storage)
* **Frontend Web Stack**: Java Server Pages (JSP), JSTL, Custom Vanilla CSS
* **UI Components**: Bootstrap 5, Bootstrap Datepicker (Webjars), jQuery
* **Containerization**: Docker (Eclipse Temurin 21)
* **Authentication**: Lightweight Custom Servlet-based `HttpSession` Validation

---

## ✨ Core Features

* **Open-to-All Isolated Session Routing**: Allows immediate, passwordless entry using any distinct username, automatically provisioning a completely isolated, secure workspace and database sandbox for their tasks.
* **Premium UX & Date Picker**: Features a cohesive, highly polished responsive UI with integrated native Bootstrap Datepicker widgets for picking and editing task completion dates seamlessly.
* **Dynamic Persistence Engine**: Automatically routes task management operations to the underlying SQL database via Hibernate, optimizing write operations and data fetching.
* **Multi-Database Compatibility**: Supports standard default H2 configurations and seamless toggle over to production MySQL instances via profile activation.
* **Zero-Config Docker Deployment**: Comes pre-packaged with a optimized `Dockerfile` for instantaneous containerization and cloud-ready hosting.

---

## 🚀 How to Run Locally

### 1. Standard Run (Default H2 Mode)
Build and run the application in memory using the Maven wrapper:
```bash
# Build the executable package
.\mvnw.cmd package -DskipTests

# Run the Spring Boot server
.\mvnw.cmd spring-boot:run
```
* Access the app at: **http://localhost:8080**
* Access the H2 Database console at: **http://localhost:8080/h2-console** (JDBC URL: `jdbc:h2:mem:testdb`, username: `sa`, blank password).

### 2. Persistent MySQL Mode
Ensure your local MySQL instance has a database created (`CREATE DATABASE todosdb;`), then run the app with the `mysql` profile:
```bash
.\mvnw.cmd spring-boot:run -Dspring-boot.run.profiles=mysql
```

---

## 🐳 Containerized Deployment (Docker)

To run the application inside a fully isolated, lightweight Docker container:

1. **Build the Docker Image**:
   ```bash
   docker build -t priorityflow:latest .
   ```
2. **Run the Container**:
   ```bash
   docker run -d -p 8080:8080 --name priorityflow priorityflow:latest
   ```
3. Open your browser and navigate to **http://localhost:8080**!
