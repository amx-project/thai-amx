download:
	ruby download.rb | sh

unzip:
	ruby unzip.rb | sh

unrar:
	ruby unrar.rb | sh

produce:
	ruby stream.rb | sh | jq -c -f filter.jq | tippecanoe -f -o thai-amx.pmtiles \
	--maximum-zoom=17 --drop-fraction-as-needed --drop-densest-as-needed 

fgb:
	ruby stream.rb | sh | ogr2ogr -f FlatGeobuf -skipfailures \
	thai-amx.fgb /vsistdin?buffer_limit=-1/

prod:
	ogr2ogr -f GeoJSONSeq /vsistdout/ thai-amx.fgb | \
	jq -c -f filter.jq | tippecanoe -f -o thai-amx-16.pmtiles \
	--temporary-directory=/Volumes/Migrate-2025-04/github/thai-amx \
	--maximum-zoom=16 --drop-fraction-as-needed --drop-densest-as-needed 

upload:
	aws s3 cp thai-amx.pmtiles s3://smartmaps/sugi/thai-amx.pmtiles \
	--endpoint-url=https://data.source.coop

pages:
	rm docs/assets/*
	cp -r vite/dist/. docs/

