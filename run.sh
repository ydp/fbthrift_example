#!/bin/bash

docker run -it --network=host --name=ubuntu -v `pwd`:/work  -w /work fbthrift:v0 bash
