# H3 生成に関するアーキテクチャ設計の決定

## 1. ステータス
- 提案中

## 2. 文脈
- GDAL と h3-ruby の組み合わせは相性が悪く、効率的な処理が難しい状況にある。そのため、H3 polyfill をシンプルに実装する必要がある。
- H3 polyfill の目的は、地理空間データを六角形グリッドに変換し、視覚化や分析を容易にすることである。

## 3. 決定
- .fgb ファイル（FlatGeobuf フォーマット）からポリゴン座標のストリームを生成し、それを CLI ツールである `h3 polygonsToCells` に渡して処理を行う。
- 使用する具体的なコマンド例:
  ```bash
  ogr2ogr -f GeoJSONSeq /vsistdout/ thai-amx.fgb | jq -c -f h3_in.jq | h3 polygonToCells -i -- -r 8
  ```
  - `ogr2ogr`: .fgb ファイルを GeoJSONSeq に変換。
  - `jq`: `geometry.type` に応じて `geometry.coordinates` を出力。
  - `h3 polygonsToCells`: H3 セルに変換。

## 4. 結果
- **容易になること**:
  - H3 polyfill の実装が簡素化され、処理速度が向上する。
  - ツールチェーンがシンプルになり、保守性が向上する。
- **難しくなること**:
  - .fgb ファイルの生成やストリーム処理の実装が新たな作業として発生する。
