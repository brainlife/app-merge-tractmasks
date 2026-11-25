# app-merge-tractmasks

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Utility that concatenates the individual tract masks of a tractmasks dataset into one 4D mask image with FSL fslmerge, keeping the label file.**

Reads the tract names from color.json and stacks the masks in that order into masks/mask.nii.gz (one volume per tract), copying color.json as label.json. Use it when a downstream App expects all tract masks in a single file. Needs a tractmasks dataset with a color.json listing its tracts.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.788](https://doi.org/10.25663/brainlife.app.788)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `masks` | `neuro/tractmasks` | yes | Tract masks dataset: one NIfTI mask per tract plus color.json with tract names. Masks must share the same grid; file names must start with the names in color.json. |

| Output | Datatype | Description |
|---|---|---|
| `masks` | `neuro/tractmasks` | Single 4D mask.nii.gz with one volume per tract, plus label.json. |

Runtime: container `brainlife/fsl:6.0.4-patched2`; 2 CPUs; 0.83 h walltime.

<!-- brainlife-app:end -->

