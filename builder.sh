#!/bin/bash

function FROM () {
    mkdir rootfs
    dist pull "$1"
    nsinit config -f container.json --rootfs rootfs
}

function USERNS() {
    nsinit config --userns-root-uid "$1" -f container.json --rootfs rootfs
}

function RUN() {
   nsinit exec --rootfs rootfs --tty -- sh -c "$@" 
}

function CWD() {
    export nsinitcwd="$1"
}

function EXEC() {
    nsinit exec --tty --rootfs rootfs --cwd "$nsinitcwd" -- "$@"
}
