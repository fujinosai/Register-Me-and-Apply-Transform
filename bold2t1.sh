#! /bin/bash

## Author: Raven | qiaokn123@163.com 
## print script usage
Usage () {
    cat <<USAGE
-----------------------------------------------------------------------------------------
`basename $0` performs boundary-based rigid registration between T1 and BOLD fMRI images
-----------------------------------------------------------------------------------------
Usage example:

bash $0 -a /home/alex/input/rest_ref.nii.gz
        -b /home/alex/input/freesurfer
        -c /homoe/alex/output
        -d rest2t1
-----------------------------------------------------------------------------------------
Required arguments:
        -a:  moving image 
        -b:  FreeSurfer recon-all directory
        -c:  output directory
        -d:  output prefix
-----------------------------------------------------------------------------------------


USAGE
    exit 1
}

## parse arguments
if [[ $# -lt 8 ]]
then
    Usage >&2
    exit 1
else
    while getopts "a:b:c:d:" OPT
    do
      case $OPT in
          a) ## moving image file
             MOVIMAGE=$OPTARG
             ;;
          b) ## freesurfer recon-all directory
             RECONALL=$OPTARG
             ;;
          c) ## output directory
             OUTDIR=$OPTARG
             ;;
          d) ## output prefix
             PREFIX=$OPTARG
             ;;
          *) ## getopts issues an error message
             echo "ERROR:  unrecognized option -$OPT $OPTARG"
             exit 1
             ;;
      esac
    done
fi

## get recon-all directory and its parent directory
export SUBJECTS_DIR=$(dirname ${RECONALL})
SUBJECT=$(basename ${RECONALL})

bbregister --s ${SUBJECT} --mov ${MOVIMAGE} --reg ${OUTDIR}/${PREFIX}.dat --init-coreg --t2 --fslmat ${OUTDIR}/${PREFIX}_fsl.mat --o ${OUTDIR}/${PREFIX}_warped.nii.gz

 
