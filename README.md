# Axum Hello World

This is a simple hello world web application using Axum.

## Setup

Open the project in VSCode using Dev Containers extension.

## Setup database

```sh
cargo install sqlx-cli --no-default-features --features postgres
sqlx database create
```

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
wrk -t10 -c1000 -d180s http://192.168.20.25:3000/
```

Results:

```
> wrk -t10 -c1000 -d180s http://192.168.20.25:3000/
Running 3m test @ http://192.168.20.25:3000/
  10 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    26.48ms   22.35ms 268.08ms   97.72%
    Req/Sec     4.19k   117.07     5.82k    78.12%
  7512554 requests in 3.00m, 0.91GB read
Requests/sec:  41728.01
Transfer/sec:      5.17MB
```

### Before (after reboot)

RAM usage: 238M
CPU Load average (over 1 minute): 0.06

### Server running

RAM usage: 237M
CPU Load average (over 1 minute): 0.06

### Stress test

```sh
wrk -t10 -c1000 -d600s http://192.168.20.25:3000/
```

RAM usage: 265 MB
CPU Load average (over 5 minutes): 1.60
