Dir.glob('src/ruupaeplngthiidin*shp') {|path|
  print <<-EOS
unrar #{path} src
  EOS
}
