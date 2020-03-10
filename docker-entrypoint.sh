#!/bin/bash

rm -rf /etc/freeswitch/*
cp -r /freeswitch_config/* /etc/freeswitch/

/usr/bin/freeswitch -nonat