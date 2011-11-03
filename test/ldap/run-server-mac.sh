#!/usr/bin/env bash

## For OSX:
PATH=$PATH:/usr/libexec

if [[ $1 == "--ssl" ]]; then
    slapd -d 1 -f slapd-ssl-test.conf -h ldaps://localhost:3389
  else
    slapd -d 1 -f slapd-mac.conf -h ldap://localhost:3389 
fi