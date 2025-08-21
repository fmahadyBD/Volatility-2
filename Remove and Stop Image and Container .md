

---

## 🧹 Docker Cleanup Commands

Sometimes you want to clean up containers, images, networks, or volumes after experimenting.
Here’s a quick reference:

### 1. List what you have

```bash
docker ps -a        # Show all containers
docker images       # Show all images
```

### 2. Stop all running containers

```bash
docker stop $(docker ps -q)
```

### 3. Remove all containers

```bash
docker container prune -f
```

### 4. Remove all images

```bash
docker image prune -a -f
```

### 5. Remove all unused networks and volumes

```bash
docker network prune -f
docker volume prune -f
```

---

## 🗑️ Alternative: Remove everything manually

```bash
# Remove all containers
docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)

# Force remove all images (if some are in use)
docker rmi -f $(docker images -q)
```

