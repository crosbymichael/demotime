#!/bin/bash

function FROM () {
    mkdir -p rootfs
    # dist pull "$1" rootfs
}

function CWD() {
    export nsinitcwd="$1"
}

function MEM() {
    export nsinitmem="$1"
}

function EXEC() {
    nsinit exec \
        --tty \
        --rootfs "$(pwd)/rootfs" \
        --create \
        --cwd="$nsinitcwd" \
        --memory-limit="$nsinitmem" \
        --memory-swap -1 \
        --userns-root-uid 1000 \
        --veth-bridge docker0 \
        --veth-mtu 1500 \
        --veth-address "172.17.0.150/16" \
        --veth-gateway "172.17.42.1" \
        -- "$@"
}

function RUN() {
    EXEC "$@"
}

