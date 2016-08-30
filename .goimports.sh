#!/bin/bash


if [[ ${GIMME_GO_VERSION} =~ "1.4*" ]]; then
  exit
fi

case $1 in
  "get")
    go get golang.org/x/tools/cmd/goimports
    ;;
  "run")
    goimports -d -e $(find -name '*.go') | awk '{ print } END { exit NR == 0 ? 0 : 1 }'
    ;;
  *)
    echo "usage: $0 (get|run)" > /dev/stderr
    exit 1
esac
