FROM python:3.10

WORKDIR /app

# Install build essentials and required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    gnupg2 \
    unzip \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libdbus-1-dev \
    libgirepository1.0-dev \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ----------------------------
# Install Java 17 (OpenJDK)
# ----------------------------
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Set environment variables for Java
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# ----------------------------
# Python dependencies
# ----------------------------
RUN pip install --upgrade pip setuptools wheel cython

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash"]
