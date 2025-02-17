#!/usr/bin/env bash
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

set -e

FILES="$(ls ./*.go | grep -v -e _test.go -e .generated.go | tr '\n' ' ')"
codecgen \
    -c github.com/hashicorp/go-msgpack/v2/codec \
    -st codec \
    -d 100 \
    -t codegen_generated \
    -o structs.generated.go \
    -nr="(^ACLCache$)|(^IdentityClaims$)" \
    ${FILES}
