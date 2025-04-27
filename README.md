# thai-amx
Thai AMX

# Overview
The Thai AMX project focuses on creating and sharing geospatial data for Thailand, particularly land parcel information. It leverages modern mapping technologies to provide accessible and interactive visualizations, enabling better understanding and utilization of geographic data.

# Development Plan

The `vite` directory is being used to develop a viewer site. A static copy of the site created with Vite will be copied to the `docs` directory, making it accessible via GitHub Pages. This approach ensures that the viewer site is easily shareable and publicly available for users.

## Challenges and Learnings

The project faced significant challenges in addressing discrepancies between the Everest datum and error data. Resolving these issues required careful analysis and validation, ultimately leading to a PMTiles file with a moderate size. Additionally, the team implemented a robust pipeline for generating PMTiles files, ensuring efficient handling of large datasets. This pipeline includes:

- **Coordinate Transformation**: Leveraging the "RTSD parameter" for accurate conversion from the Indian 1975 datum to WGS84.
- **Data Validation**: Cross-referencing with authoritative sources to ensure data accuracy.
- **Optimization**: Reducing file size while maintaining data integrity, enabling faster loading times in the PMTiles viewer.

These efforts have significantly improved the usability and reliability of the geospatial data provided by the project.

## PMTiles Details

The project uses PMTiles to efficiently store and serve geospatial data. PMTiles is a single-file archive format optimized for tiled data, making it ideal for web-based mapping applications. The following steps outline the process of generating PMTiles files for this project:

1. **Data Preparation**: Source data is collected from authoritative datasets, such as land parcel information from Thailand's government open data portal.
2. **Coordinate Transformation**: Data is transformed from the Indian 1975 datum to WGS84 using the "RTSD parameter" for accuracy.
3. **Tile Generation**: Geospatial data is converted into vector tiles using tools like `tippecanoe` or custom scripts.
4. **PMTiles Packaging**: The tiles are packaged into a PMTiles file, ensuring efficient storage and retrieval.

### Benefits of PMTiles
- **Single File**: Simplifies deployment and sharing.
- **Efficient Loading**: Optimized for fast access in web applications.
- **Scalability**: Handles large datasets effectively.

The generated PMTiles file is hosted and can be accessed via the [PMTiles Viewer Demo](https://pmtiles.io/?url=https%3A%2F%2Fdata.source.coop%2Fsmartmaps%2Fsugi%2Fthai-amx.pmtiles#map=9.29/13.864/100.5039).

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

