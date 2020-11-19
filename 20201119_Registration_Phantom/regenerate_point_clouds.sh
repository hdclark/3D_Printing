#!/usr/bin/env bash

rm ./*.xyz

dicomautomaton_dispatcher \
  reg_phant_v0.stl \
  -o ConvertMeshesToPoints:Label=p:MeshSelection=first \
  -o ExportPointClouds:PointSelection='last':FilenameBase='reg_phant_v0_original'

dicomautomaton_dispatcher \
  reg_phant_v0.stl \
  -o TransformMeshes:MeshSelection=first:Transform='translate(1.25, -2.75, 0.35)' \
  -o ConvertMeshesToPoints:Label=p:MeshSelection=last \
  -o ExportPointClouds:PointSelection='last':FilenameBase='reg_phant_v0_translated'

dicomautomaton_dispatcher \
  reg_phant_v0.stl \
  -o TransformMeshes:MeshSelection=first:Transform='rotate(5.0, 1.0, -5.0,  1.0, 1.0, -1.0,  0.15)' \
  -o ConvertMeshesToPoints:Label=p:MeshSelection=last \
  -o ExportPointClouds:PointSelection='last':FilenameBase='reg_phant_v0_rotated'

dicomautomaton_dispatcher \
  reg_phant_v0.stl \
  -o TransformMeshes:MeshSelection=first:Transform='scale(-5.0, 5.0, 1.0, 1.20)' \
  -o ConvertMeshesToPoints:Label=p:MeshSelection=last \
  -o ExportPointClouds:PointSelection='last':FilenameBase='reg_phant_v0_scaled'

dicomautomaton_dispatcher \
  reg_phant_v0.stl \
  -o TransformMeshes:MeshSelection=first:Transform='translate(1.25, -2.75, 0.35)' \
  -o TransformMeshes:MeshSelection=first:Transform='rotate(5.0, 1.0, -5.0,  1.0, 1.0, -1.0,  0.15)' \
  -o TransformMeshes:MeshSelection=first:Transform='scale(-5.0, 5.0, 1.0, 1.20)' \
  -o ConvertMeshesToPoints:Label=p:MeshSelection=last \
  -o ExportPointClouds:PointSelection='last':FilenameBase='reg_phant_v0_translated_rotated_scaled'



~/Appliances/3d_design/Run_Interactively.sh meshlab reg_phant_v0.stl *xyz

