#!/bin/bash

for i in {1..10000}
do
	./exploit $i 1
	echo $i
done