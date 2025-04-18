Dir.glob('src/*.zip') {|path|
  print <<-EOS
unzip -d src #{path}
  EOS
}

