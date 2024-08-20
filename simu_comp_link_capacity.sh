
#!/bin/bash

outputFile="capacity" # set the destination file
> $outputFile # clean the destination file

for capacity in 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6.5 7 7.5 8 8.5 9 9.5 10 10.5 11; do
  for entropy in l h; do
    for queueSize in 1 60; do
      ./ns3 run compression-exp -- --filename=myconfig.txt --packetNumber=6000 --compLinkCap=${capacity}Mbps --payload=1100 --entropy=$entropy --threshold=20 --queueSize=$queueSize
      # get the results
      python3 getSimuRes.py $outputFile $entropy $capacity $queueSize
    done
  done
done
