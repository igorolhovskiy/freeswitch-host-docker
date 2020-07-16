#!/bin/bash

rm -f /etc/freeswitch/freeswitch.serial
rm -f /etc/freeswitch/tls/*

/usr/bin/freeswitch -nonat