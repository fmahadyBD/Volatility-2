# Use an official Debian image
FROM debian:bullseye

# Set noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install minimal dependencies including yara
RUN apt-get update && apt-get install -y \
    python2 \
    python2-dev \
    git \
    pcregrep \
    libdistorm3-3 \
    libdistorm3-dev \
    libyara-dev \
    yara \
    build-essential \
    wget \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip for Python2
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py -O get-pip.py && \
    python2 get-pip.py && \
    rm get-pip.py

# Install essential Python packages
RUN python2 -m pip install --no-cache-dir \
    pycrypto \
    distorm3

# Install yara-python compatible with Python 2.7
RUN python2 -m pip install --no-cache-dir yara-python==3.11.0

# Clone Volatility 2
RUN git clone https://github.com/volatilityfoundation/volatility.git /volatility2

# Set working directory
WORKDIR /volatility2

# Create a symbolic link to make vol.py accessible globally
RUN ln -s /volatility2/vol.py /usr/local/bin/vol

# Set default command
CMD ["bash"]