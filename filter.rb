require 'json'
require 'h3'
require 'set'
require 'rgeo'
require 'rgeo-geojson'

H3_RESOLUTION = 8
THAILAND_BBOX = RGeo::GeoJSON.decode({
    "type" => "Polygon",
    "coordinates" => [
        [
            [97.4, 6.7],
            [97.4, 20.5],
            [105.6, 20.5],
            [105.6, 6.7],
            [97.4, 6.7]
        ]
    ]
})
cells = Set.new

jq_command = ['jq', '-c', '-f', 'filter.jq']
jq_process = IO.popen(jq_command, 'w')
at_exit { jq_process.close }

ARGF.each_line do |line|
  f = JSON.parse(line)
  begin
    g = RGeo::GeoJSON.decode(f['geometry'])
    next unless g.valid?
    next unless THAILAND_BBOX.contains?(g)
  rescue RGeo::Error::InvalidGeometry
    next
  end
  coords = f['geometry']['coordinates']
  jq_process.puts JSON.dump(f)
  next unless f['geometry']['type'] == 'Polygon'
  p H3.polyfill(f['geometry'], H3_RESOLUTION)
  #$stderr.puts cells
end
