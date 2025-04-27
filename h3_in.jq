if .geometry.type == "Polygon" then
    .geometry.coordinates
elif .geometry.type == "MultiPolygon" then
    .geometry.coordinates[]
else
    empty
end