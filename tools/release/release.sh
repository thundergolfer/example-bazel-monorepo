#!/usr/bin/env bash

main() {
  aws sts get-caller-identity
}

main "$@"