# Axum Hello World

This is a simple hello world web application using Axum.

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
wrk -t8 -c10 -d5s http://localhost:3000
```

```
  8 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   126.00us  126.77us  16.37ms   96.09%
    Req/Sec     8.14k   430.20    19.33k    88.51%
  1945816 requests in 30.10s, 241.24MB read
Requests/sec:  64646.26
Transfer/sec:      8.01MB
```
