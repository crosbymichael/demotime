#!/bin/bash

function FROM () {
    mkdir rootfs
    dist pull "$1" rootfs
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
        --net host \
        -- "$@"
}

function RUN() {
    EXEC "$@"
}

