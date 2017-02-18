
# this is terrible, really terrible

# using wget because curl mksbehaving on termux
name=`wget -q -O- https://twitter.com/pikesley | grep title | head -n1 | sed 's/ .@.*//' | sed 's/.*>//'`
rm -f list2.txt
touch list2.txt
cat _data/pikes.json | grep -v '\[' | grep -v '\]' | sed 's/[",]//g' | sed 's/^ *//' >> list2.txt
echo $name >> list2.txt
uniq < list2.txt > list.txt
rm list2.txt
comma=""
(
echo "["
(
    while read line; do
        echo $comma
        comma=","
        echo $line | sed 's/^/"/' | sed 's/$/"/'
    done
) < list.txt
echo "]"
) | jq . | tee _data/pikes.json
