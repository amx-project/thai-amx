require 'find'

Find.find('src') {|path|
  next unless /polygon.*?shp$/.match path
  print <<-EOS
ogr2ogr -f GeoJSONSeq /vsistdout/ "#{path}"
  EOS
}
