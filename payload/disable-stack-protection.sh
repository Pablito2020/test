#!/bin/sh

echo "0" > /proc/sys/kernel/randomize_va_space
echo "0" > /proc/sys/kernel/exec-shield