FROM rust:1.83-bookworm

RUN apt-get update && apt-get install -y \
    git \
    pkg-config \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
