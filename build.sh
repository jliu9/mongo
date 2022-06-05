#! /bin/bash

setup_dep() {
    sudo apt-get install libcurl4-openssl-dev
    sudo apt-get install scons
    sudo apt install python-dev-is-python3 libssl-dev
    sudo apt-get install libunwind-dev
    pip install requirements_parser
    python -m pip install -r etc/pip/compile-requirements.txt
}

do_build() {
    # only build mongod
    # it's not clear how long does it take to do `install-all-meta`
    python3 buildscripts/scons.py install-mongod
}

case "$1" in
    (setup)
        setup_dep
        ;;
    (build)
        do_build
        ;;
    (*)
        echo "setup|build"
        ;;
esac

