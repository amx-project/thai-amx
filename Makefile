download:
	ruby download.rb | sh

unzip:
	ruby unzip.rb | sh

unrar:
	ruby unrar.rb | sh

produce:
	ruby stream.rb | sh | jq -c -f filter.jq | tippecanoe -f -o thai-amx.pmtiles --maximum-zoom=16

