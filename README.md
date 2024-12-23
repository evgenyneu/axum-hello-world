# Axum Hello World

This is a simple hello world web application using Axum.

## Setup

Open the project in VSCode using Dev Containers extension.

## Running the application

```sh
cargo run
```

## Deploying the application

Here is how to deploy the application to a Orange Pi 5 server:

Add aarch64 target to your Rust toolchain:

```sh
rustup target add aarch64-unknown-linux-gnu
```

Build the release binary:

```sh
cargo build --release --target aarch64-unknown-linux-gnu
```

Copy the binary to the server:

```sh
scp target/aarch64-unknown-linux-gnu/release/axum-hello-world orange:~/axum-hello-world
```


## Benchmarking

```sh
sudo apt install wrk
wrk -t10 -c1000 -d60s http://192.168.20.24:3000/
```


Results:

```
> wrk -t10 -c1000 -d60s http://192.168.20.24:3000/
Running 1m test @ http://192.168.20.24:3000/
  10 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    71.91ms  133.13ms   1.99s    88.25%
    Req/Sec     2.51k   815.27     5.30k    64.20%
  1500233 requests in 1.00m, 186.00MB read
  Socket errors: connect 0, read 0, write 0, timeout 2
Requests/sec:  24983.98
Transfer/sec:      3.10MB

```
