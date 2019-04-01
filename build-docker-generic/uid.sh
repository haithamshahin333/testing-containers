#!/bin/bash

zap.sh -daemon -host 0.0.0.0 -port 8080 -config api.disablekey=true -config api.addrs.addr.regex=true -config api.addrs.addr.name=.*