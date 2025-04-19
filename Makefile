download:
	ruby download.rb | sh

unzip:
	ruby unzip.rb | sh

unrar:
	ruby unrar.rb | sh

produce:
	ruby stream.rb | sh | jq -c -f filter.jq | tippecanoe -f -o thai-amx-force.pmtiles \
	--maximum-zoom=17 --drop-fraction-as-needed --drop-densest-as-needed 

upload:
	aws s3 cp thai-amx.pmtiles s3://smartmaps/sugi/thai-amx.pmtiles \
	--endpoint-url=https://data.source.coop
