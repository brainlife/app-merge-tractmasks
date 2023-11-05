#!/bin/bash

masks=`jq -r '.mask' config.json`
names=(`jq -r '.[].name' ${masks}/color.json`)
outdir="masks"
[ ! -d ${outdir} ] && mkdir ${outdir} ${outdir}/masks

for i in ${names[*]}
do
    if [[ $i == ${names[0]} ]]; then
        cp ${masks}/${i}*.nii.gz $outdir/mask.nii.gz
    else
        fslmerge -t $outdir/mask.nii.gz $outdir/masks/mask.nii.gz ${masks}/$i*.nii.gz
    fi
done

if [ ! -f $outdir/masks/mask.nii.gz ]; then
    echo "something went wrong. check data"
    exit 1
fi

[ ! -f ${outdir}/label.json ] && cp ${masks}/color.json ${outdir}/masks/label.json

