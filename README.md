# Axum Hello World benchmark

This is a simple Axum (Rust) web app that returns "Hello, World!" response, made for benchmarking performance and resource usage and comparing it with [Next.js](https://github.com/evgenyneu/nextjs-hello-world) and [Hono](https://github.com/evgenyneu/hono-hello-world) benchmarks.

## Setup

Install Rust.

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

### Before (after reboot)

* RAM usage: 238M
* CPU Load average (over 1 minute): 0.06

### Server running idle

* RAM usage: 237M
* CPU Load average (over 1 minute): 0.06

### Stress test

```sh
wrk -t10 -c1000 -d600s http://192.168.20.25:3000/
```

* RAM usage: 270 MB
* CPU Load average (over 1 minute): 2.23

Results:

```
  10 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    27.81ms   26.06ms 482.62ms   96.82%
    Req/Sec     4.13k   106.13     5.54k    72.94%
  24628834 requests in 10.00m, 5.89GB read
Requests/sec:  41044.39
Transfer/sec:     10.06MB
```

## Hardware

The web server was run on Orange Pi 5 Max with 16 GB RAM and 1 TB NVMe SSD running Ubuntu 24.04 LTS. The program was compiled with Rust 1.83.0. The `wrk` benchmark command was run on a Desktop PC (12600K, 32 GB RAM), running Ubuntu 24.04 LTS. Both machines were connected to NetComm NF18ACV router via 1 Gbps Ethernet cables.

## Server response

```sh
curl -v http://192.168.20.25:3000/
*   Trying 192.168.20.25:3000...
* Connected to 192.168.20.25 (192.168.20.25) port 3000
> GET / HTTP/1.1
> Host: 192.168.20.25:3000
> User-Agent: curl/8.5.0
> Accept: */*
>
< HTTP/1.1 200 OK
< content-type: text/plain; charset=utf-8
< x-filler: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
< content-length: 13
< date: Wed, 25 Dec 2024 04:18:50 GMT
<
* Connection #0 to host 192.168.20.25 left intact
Hello, World!
```

The `x-filler` header was added to make the HTTP response size equal to that of the Next.js benchmark.

Response size:

```sh
curl -s -o /dev/null -w "%{size_download}\n%{size_header}\n" http://192.168.20.25:3000/
13
244
```
