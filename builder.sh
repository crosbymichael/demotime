#!/bin/bash

function FROM () {
    mkdir -p rootfs
    dist pull "$1"
    dist mount "$1" rootfs
}

function COPY() {
    echo "COPY" "$@"
    mkdir -p "rootfs/$(dirname $2)"
    cp "$1" "rootfs/$2"
 }

function CWD() {
    echo "CWD" "$@"
    export nsinitcwd="$1"
}

function MEM() {
    echo "MEM" "$@"
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
    echo "RUN" "$@"
    EXEC "$@"
}

