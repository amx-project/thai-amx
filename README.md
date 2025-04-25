# thai-amx
Thai AMX

# Overview
The Thai AMX project focuses on creating and sharing geospatial data for Thailand, particularly land parcel information. It leverages modern mapping technologies to provide accessible and interactive visualizations, enabling better understanding and utilization of geographic data.

# Development Plan

The `vite` directory is being used to develop a viewer site. A static copy of the site created with Vite will be copied to the `docs` directory, making it accessible via GitHub Pages. This approach ensures that the viewer site is easily shareable and publicly available for users.

# Demo

## with PMTiles viewer
[PMTiles Viewer Demo](https://pmtiles.io/?url=https%3A%2F%2Fdata.source.coop%2Fsmartmaps%2Fsugi%2Fthai-amx.pmtiles#map=9.29/13.864/100.5039)

# Data Source
- [Land Parcel Nonthaburi](https://data.go.th/dataset/landparcel-nonthaburi)
- [Land Parcel Pathum Thani](https://data.go.th/dataset/landparcel-pathumthani)
- [Land Parcel Samut Prakan](https://data.go.th/dataset/landparcel-samutprakan)
- [Land Parcel Samut Sakhon](https://data.go.th/dataset/landparcel-samutsakhon)

# About the coordinate transformation
Thailand employs several coordinate transformation parameters for converting data from the Indian 1975 datum to WGS84. Based on experiments, the "RTSD parameter" has been validated as a reliable option for this transformation. For further details, refer to the study available at [ResearchGate](https://www.researchgate.net/profile/Clifford-Mugnier/publication/236067254_Thailand_National_Transformation_Parameters/data/00b7d515f1c6f24ddd000000/Thailand-National-Transformation-Parameter.doc?origin=publication_list).

# See Also
- [AMX Project Issue #35](https://github.com/amx-project/0/issues/35)
- [UN Open GIS Issue #695](https://github.com/UNopenGIS/7/issues/695)

