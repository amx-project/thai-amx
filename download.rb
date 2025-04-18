File.foreach('urls.txt') {|l|
  url = l.strip
  next unless /^https/.match url
  print <<-EOS
curl -C - --http1.1 --retry 10 -o src/#{url.split('/')[-1]} #{url}
  EOS
}

