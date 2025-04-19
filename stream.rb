require 'find'

params = "-s_srs EPSG:24047 -t_srs EPSG:4326 -skipfailures"
#params = "-t_srs EPSG:4326 -skipfailures"
Find.find('src') {|path|
  next unless /polygon.*?shp$/.match path
  print <<-EOS
ogr2ogr -f GeoJSONSeq /vsistdout/ #{params} "#{path}"
  EOS
}
