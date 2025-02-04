# 🚀 funding-pips

## 📌 Ruby Version
- **Ruby:** `3.x.x` (Specify exact version, e.g., `3.1.2`)
- **Rails:** `7.x.x` (Specify version, e.g., `7.0.4`)

---

## ⚙️ System Dependencies
- **Docker** (`>= 20.x.x`)
- **Docker Compose** (`>= 2.x.x`)
- **PostgreSQL** (`>= 13`)

---

## 🛠 Configuration
**Clone the repository:**
   ```bash
   git clone https://github.com/syed-faraz/funding-pips.git
   cd your-app
   ```

**Ensure the following ENV variables are set properly inside the docker-compose.yaml file:**
   ```ini
   RAILS_ENV=production
   DATABASE_URL=postgres://postgres:password@db:5432/fundingpips
   ```

---

### Build the Docker Image and Start the Containers
```bash
docker-compose up -d --build
```
![alt text](https://github.com/syed-faraz/funding-pips/blob/main/image.png)

![alt text](https://github.com/syed-faraz/funding-pips/blob/main/image-1.png)

![alt text](https://github.com/syed-faraz/funding-pips/blob/main/image-2.png)


### Check Logs
```bash
docker-compose logs -f
```

### Stopping Services
```bash
docker-compose down
```

---

### Explanation of Best Practices:
1. **Use a Minimal Base Image**: The official `ruby:3.2-slim` image is used to ensure compatibility.
2. **Set Environment Variables**: Optimizes performance and prevents unnecessary dependencies.
3. **Use a Working Directory**: Ensures commands execute in the correct application directory.
4. **Install Dependencies Efficiently**: Uses `apt-get` with `--no-install-recommends` to minimize installed packages.
5. **Leverage Docker Layer Caching**: Copies and installs gems before adding application code.
6. **Precompile Assets**: Reduces container startup time.
7. **Expose Only Necessary Ports**: Ensures security.
8. **Use an EntryPoint Script**: Simplifies initialization tasks.
9. **Create a non-root-user**: Improves security by running the app as a non root user.
10. **Run the App Using `puma`**: A better choice than `rails server` for production.

