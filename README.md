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
wrk -t10 -c1000 -d60s http://192.168.20.25:3000/
```

Results:

```
> wrk -t10 -c1000 -d60s http://192.168.20.25:3000/
Running 1m test @ http://192.168.20.25:3000/
  10 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    26.05ms   19.32ms 263.77ms   98.09%
    Req/Sec     4.16k   362.65    29.72k    99.35%
  2483566 requests in 1.00m, 307.91MB read
Requests/sec:  41323.85
Transfer/sec:      5.12MB

```
