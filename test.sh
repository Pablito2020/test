#!/bin/bash

for i in {72..10000}
do
	./exploit $i 1
	echo $i
done