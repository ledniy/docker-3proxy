#!/bin/bash

sed -i 's/login/'"$login"'/g' /etc/3proxy/3proxy.cfg
sed -i 's/password/'"$password"'/g' /etc/3proxy/3proxy.cfg
exec "$@"
