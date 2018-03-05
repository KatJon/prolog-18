printf "%-3s|%-6s|%s\n" N SUM AVG

FACT=1

for i in {1..6}
do
    FACT=$((FACT*i))
    INF=`cat l${i}.txt | grep -e "^%" | cut -d " " -f 2 | awk '{s+=$1} END {print s}'`
    AVG=$((INF/FACT))
    printf "%3d|%6d|%d\n" $i $INF $AVG
done