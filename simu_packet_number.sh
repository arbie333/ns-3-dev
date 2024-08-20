
#!/bin/bash

outputFile="packet_number" # set the destination file
> $outputFile # clean the destination file

for packetNum in 500 1000 1500 2000 2500 3000 3500 4000 4500 5000 5500 6000 6500 7000 7500 8000 8500 9000 9500 10000; do
  for entropy in l h; do
    for queueSize in 1 60; do
      ./ns3 run compression-exp -- --filename=myconfig.txt --packetNumber=$packetNum --compLinkCap=2Mbps --entropy=$entropy --queueSize=$queueSize
      # get the results
      python3 getSimuRes.py $outputFile $entropy $packetNum $queueSize
    done
  done
done
