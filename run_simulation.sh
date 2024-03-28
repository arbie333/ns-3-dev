
#!/bin/bash

for ttl in {1..6}; do
  for entropy in l h; do
    ./ns3 run compression-ttl -- --filename=myconfig.txt --ttl=$ttl --entropy=$entropy
  done
done
