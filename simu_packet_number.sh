
#!/bin/bash

for packetNum in 100 500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000; do
  for entropy in l h; do
    ./ns3 run compression-exp -- --filename=myconfig.txt --packetNumber=$packetNum --compLinkCap=10Mbps --entropy=$entropy
  done
done
