require 'find'

params = "-s_srs \"+proj=utm +zone=47 +ellps=evrst30 +towgs84=206.000,837.000,295.000,0,0,0,0 +units=m +no_defs\" -t_srs EPSG:4326 -skipfailures"
Find.find('src') {|path|
  next unless /polygon.*?shp$/.match path
  print <<-EOS
ogr2ogr -f GeoJSONSeq /vsistdout/ "#{path}" #{params}
  EOS
}

