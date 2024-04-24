
## non-linear reg
antsRegistrationSyN.sh -d 3 -f ${FSLDIR}/data/standard/MNI152_T1_1mm_brain.nii.gz -m ${T1OUTDIR}/masks/t1_brain.nii.gz -o t12mni -n ${NCORE}

## label from t12mni
antsApplyTransforms -d 3 -r ${FSLDIR}/data/standard/MNI152_T1_2mm_brain.nii.gz -i $T1OUTDIR/masks/t1_DKAseg.nii.gz -e 0 -t $T1OUTDIR/reg/t12mni1Warp.nii.gz -t $T1OUTDIR/reg/t12mni0GenericAffine.mat -o $T1OUTDIR/masks/mni.nii.gz -n GenericLabel
