#!/usr/bin/env bash

rm 'registration_metrics.csv'

dicomautomaton_dispatcher \
  ../reg_phant_v0_original.xyz  \
  ../reg_phant_v0_translated.xyz \
  -o ExtractPointsWarp:MovingPointSelection=first:ReferencePointSelection=last \
     -p Method=centroid \
  -o ExportWarps:TransformSelection=first:Filename='translated_centroid.tform' \
  -o WarpPoints:PointSelection=first:TransformSelection=first \
  -o PointSeparation:FileName='registration_metrics.csv' \
     -p PointSelectionA=first \
     -p PointSelectionB=last \
     -p UserComment='translated_centroid'

dicomautomaton_dispatcher \
  ../reg_phant_v0_original.xyz  \
  ../reg_phant_v0_translated.xyz \
  -o ExtractPointsWarp:MovingPointSelection=first:ReferencePointSelection=last \
     -p Method=pca \
  -o ExportWarps:TransformSelection=first:Filename='translated_pca.tform' \
  -o WarpPoints:PointSelection=first:TransformSelection=first \
  -o PointSeparation:FileName='registration_metrics.csv' \
     -p PointSelectionA=first \
     -p PointSelectionB=last \
     -p UserComment='translated_pca'

dicomautomaton_dispatcher \
  ../reg_phant_v0_original.xyz  \
  ../reg_phant_v0_translated.xyz \
  -o ExtractPointsWarp:MovingPointSelection=first:ReferencePointSelection=last \
     -p Method=exhaustive_icp \
  -o ExportWarps:TransformSelection=first:Filename='translated_icp.tform' \
  -o WarpPoints:PointSelection=first:TransformSelection=first \
  -o PointSeparation:FileName='registration_metrics.csv' \
     -p PointSelectionA=first \
     -p PointSelectionB=last \
     -p UserComment='translated_icp'

