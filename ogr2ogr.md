# ogr2ogr

```bash
ogr2ogr -f "CSV" LANDAREA.csv lfsa000b21a_e.shp -sql "SELECT CFSAUID, LANDAREA FROM lfsa000b21a_e"
```

```bash
head LANDAREA.csv
```

```csv
CFSAUID,LANDAREA
A0A,4136.6221
A0B,4152.6284
A0C,2733.4722
A0E,6365.8235
A0G,15499.6047
A0H,20867.7402
A0J,1823.4152
A0K,58466.1398
A0L,1490.5444
```

```bash
ogr2ogr -f "ESRI Shapefile" ./fsa_K_means_20_clusters/fsa_K_means_20_clusters.shp lfsa000b21a_e.shp -dialect SQLite -sql "SELECT lfsa.*, csv.* FROM lfsa000b21a_e AS lfsa LEFT JOIN 'fsa_K_means_20_clusters.csv'.fsa_K_means_20_clusters AS csv ON lfsa.CFSAUID = csv.geo_name"
```