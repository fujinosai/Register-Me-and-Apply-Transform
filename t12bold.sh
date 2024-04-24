
 ## here I use FreeSurfer's mri_label2vol to convert masks from T1 space to fMRI space; Also it could be done using antsApplyTransforms
 ## After simple testing, the results between antsApplyTransforms and mri_vol2vol are the same, but the qform/sform in the output are slightly different, possibly because of precision errors.
 ##  I choose to use mri_label2vol and mri_vol2vol to replace antsApplyTransforms, because the BOLD-T1 registration is performed using FreeSurfer's bbregister, and FreeSurfer's mri_label2vol/mri_vol2vol seems a more natural selection to use the registration results.

mri_label2vol --seg t1_wmmask.nii.gz --temp rest_ref.nii.gz --reg rest2t1.dat --o rest_wmmask.nii.gz
 
