# awk

```bash
# Read the list of integers into a variable, separated by '|'
ids=$(paste -s -d'|' CHARACTERISTIC_ID.txt)

# Use awk to filter rows based on the ids variable
awk -F, -v ids="$ids" 'BEGIN{ split(ids, a, "|"); for(i in a) id[a[i]] } FNR==1 || ($9 in id)' 98-401-X2021013_English_CSV_data.csv
```