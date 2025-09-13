# 1.  Volatility-2 Memory Forensics Docker

This repository provides a **Docker-based environment** for running **Volatility 2**, which is useful for memory forensics analysis of kernel-level rootkits and other types of malware.  

Volatility 2 often does not work properly on newer operating systems due to dependency issues. Using this Docker setup, you can run Volatility 2 reliably without installing Python 2 or outdated packages on your host system.  

## Features
- Preconfigured Volatility 2.6.x in Docker  
- Works on modern Linux, macOS, and Windows hosts  
- Simple volume mounting for your memory dumps  

## Usage
For command examples and step-by-step instructions, please refer to the other files in this repository.  
---


### 2. Setup Volatility 2 on Kali

Volatility 2 is a powerful tool for detecting low-level malware. Many modern operating systems do not support older versions of Volatility, so using a Docker container ensures compatibility.

I created a Docker image in my repository so Volatility 2 can be used easily.

**Steps:**

1. **Install Docker** (if not already installed – see above).

2. **Clone my repository:**

```bash
git clone https://github.com/fmahadyBD/Volatility-2.git
cd Volatility-2
```

3. **Build the Docker image** (run this in the directory containing the `Dockerfile`):

```bash
sudo docker build -t myvol2 .
```

---

### 3. Running Volatility 2

**a) Run an interactive shell inside the container**

Mount a host folder containing memory dumps to `/memdump` inside the container:

```bash
sudo docker run -it --name vol2 -v /home/user/Desktop/shared:/memdump myvol2 bash
```

**b) Run a single Volatility command without keeping the container**

This runs the container, executes the command, and then exits:

```bash
sudo docker run --rm -v /home/user/Desktop/shared:/memdump myvol2 \
  python2 vol.py -f /memdump/basic.dmp imageinfo
```

**c) Exit from bash
```bash
exit
```
---

### 4. Managing the Container

**Stop a running container:**

```bash
docker stop vol2
```

**Remove a container:**

```bash
docker rm vol2
```

**List all containers:**

```bash
docker ps -a
```

---
