
---

# 🐳 Volatility 2 in Docker

Run **Volatility 2** inside Docker without worrying about Python 2 or dependencies.

---

## 🚀 Build & Run

```bash
# Build the image
docker build -t myvol2 .

# Run interactive container (mounts dumps)
docker run -it --name vol2 -v /home/mahady-hasan-fahim/Desktop/sheard:/memdump myvol2 bash

# One-shot run (auto-remove after)
docker run --rm -v /home/mahady-hasan-fahim/Desktop/sheard:/memdump myvol2 \
  python2 vol.py -f /memdump/basic.dmp imageinfo
```

Exit container:

```bash
exit
```

Stop/remove container:

```bash
docker stop vol2
docker rm vol2
```

---

## 🔎 Common Volatility 2 Commands

📌 Replace `Win10x64_15063` with the correct profile from `imageinfo`.

```bash
# Detect image profile
python2 vol.py -f /memdump/basic.dmp imageinfo

# List running processes
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 pslist

# Scan hidden processes
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 psscan

# Show network connections
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 netscan

# List DLLs loaded by processes
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 dlllist

# Detect possible malware injections
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 malfind

# Extract command history
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 cmdscan

# Show loaded services
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 svcscan
```

---

## 🧰 Extra Useful Plugins

```bash
# Registry hives
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 hivelist

# Dump SAM registry (for hashes)
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 samdump

# Extract files from memory
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 filescan

# Dump memory of a process (PID 1234 example)
python2 vol.py -f /memdump/basic.dmp --profile=Win10x64_15063 memdump -p 1234 -D /memdump/out/
```

---

## 🧹 Cleanup

```bash
# Remove all stopped containers
docker container prune -f

# Remove the Volatility 2 image
docker rmi myvol2
```

---
