import 'maplibre-gl/dist/maplibre-gl.css'
import './style.css'
import maplibregl from 'maplibre-gl'
import { Protocol } from 'pmtiles'

document.addEventListener('DOMContentLoaded', () => {
  maplibregl.addProtocol('pmtiles', (new Protocol()).tile)
  const map = new maplibregl.Map({
    container: 'map', hash: true, 
    style: 'https://hfu.github.io/spherical/style.json'
  })
  map.addControl(new maplibregl.FullscreenControl())
})

