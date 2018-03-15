# ProxyProtocolDemo

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`
  * Start HAProxy with the below configuration
  * Visit [`localhost:8000`](http://localhost:8000) and open up your js console

# HAProxy Configuration
```
global
  log 127.0.0.1 local0 info
  stats timeout 30s
  maxconn 1024

defaults
  mode http
  log global
  option httplog
  option http-server-close
  option dontlognull
  option redispatch
  option contstats
  option forwardfor
  retries 3
  backlog 10000
  timeout connect  5000
  timeout client  50000
  timeout server  50000
  timeout tunnel 3600s
  timeout http-keep-alive 1s
  timeout http-request 15s
  timeout queue 30s
  timeout tarpit 60s

frontend device
  bind 0.0.0.0:8000
  option tcplog
  mode tcp
  default_backend backend

backend backend
  mode tcp
  server srv-1 0.0.0.0:4000 check
```