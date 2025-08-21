
---

# 🐳 Volatility 2 in Docker

Run **Volatility 2** in a clean Docker environment (no host Python 2 hassle).

## 🚀 Build

```bash
docker build -t myvol2 .
```

## ▶️ Run (interactive shell)

```bash
docker run -it --name vol2 -v /home/user/Desktop/sheard:/memdump myvol2 bash
```

Inside the container:

```bash
python2 vol.py -f /memdump/basic.dmp imageinfo
```

## ⚡ Run (one-shot command)

```bash
docker run --rm -v /home/user/Desktop/sheard:/memdump myvol2 \
  python2 vol.py -f /memdump/basic.dmp imageinfo
```

> `--rm` auto-removes the container when the command finishes.

## 🚪 Exit the container

* From interactive shell: type `exit` or press `Ctrl-D`.

## ⛔ Stop & 🗑️ Remove the container

If you ran **without** `--rm` and used `--name vol2`:

```bash
# Stop a running container
docker stop vol2

# Remove a stopped container
docker rm vol2

# Force stop + remove in one go (even if running)
docker rm -f vol2
```

List containers to find names/IDs:

```bash
docker ps        # running only
docker ps -a     # all (including stopped)
```

## 🧹 Clean up (optional)

```bash
# Remove all stopped containers
docker container prune -f

# Remove the image (rebuild later if needed)
docker rmi myvol2
```

## 📂 Example layout

```
/home/user/Desktop/sheard/
 └── basic.dmp
```

> Mount your dumps with `-v /home/user/Desktop/sheard:/memdump` and refer to them as `/memdump/...` inside the container.

---

