download:
	ruby download.rb | sh

unzip:
	ruby unzip.rb | sh

unrar:
	ruby unrar.rb | sh

produce:
	ruby stream.rb | sh | jq -c -f filter.jq | tippecanoe -f -o thai-amx.pmtiles \
	--maximum-zoom=15 --drop-fraction-as-needed --drop-densest-as-needed 

fgb:
	ruby stream.rb | sh | ogr2ogr -f FlatGeobuf -skipfailures \
	-clipdst 97.4 6.7 105.6 20.5 -lco SPATIAL_INDEX=YES \
	thai-amx.fgb /vsistdin?buffer_limit=-1/

prod:
	ogr2ogr -f GeoJSONSeq /vsistdout/ thai-amx.fgb \
	-clipsrc 97.4 6.7 105.6 20.5 -skipfailures \
	| jq -c -f filter.jq | tippecanoe -f -o thai-amx.pmtiles \
	--maximum-zoom=16 --base-zoom=16 --drop-polygons \
	--coalesce-fraction-as-needed

h3: 
	ogr2ogr -f GeoJSONSeq /vsistdout/ thai-amx.fgb | \
	ruby filter.rb

upload:
	aws s3 cp thai-amx.pmtiles s3://smartmaps/sugi/thai-amx.pmtiles \
	--endpoint-url=https://data.source.coop

pages:
	rm docs/assets/*
	cp -r vite/dist/. docs/

