#!/bin/sh

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 &
until /app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=railway-app --advertise-exit-node
do
    sleep 0.1
done
sleep 
