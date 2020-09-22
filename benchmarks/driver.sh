#!/bin/sh

if [ "$#" -gt 2 -o "$#" -eq 0 ]; then
    echo "Usage: driver.sh /path/to/ghoti [/path/to/other/ghoti]"
    exit 1
fi

ghoti_PATH=$1
ghoti2_PATH=$2
BENCHMARKS_DIR=$(dirname "$0")/benchmarks

for benchmark in "$BENCHMARKS_DIR"/*; do
    basename "$benchmark"
    [ -n "$ghoti2_PATH" ] && echo "$ghoti_PATH"
    ${ghoti_PATH} --print-rusage-self "$benchmark" > /dev/null
    if [ -n "$ghoti2_PATH" ]; then
        echo "$ghoti2_PATH"
        ${ghoti2_PATH} --print-rusage-self "$benchmark" > /dev/null
    fi

    if command -v hyperfine >/dev/null 2>&1; then
        if [ -n "$ghoti2_PATH" ]; then
            hyperfine "${ghoti_PATH} $benchmark > /dev/null" "${ghoti2_PATH} $benchmark > /dev/null"
        else
            hyperfine "${ghoti_PATH} $benchmark > /dev/null"
        fi
    fi
done

