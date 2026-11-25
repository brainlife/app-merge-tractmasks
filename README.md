<h1 align="center">Merge tractmasks into individual mask</h1>

<p align="center">
  One 4D mask image, with one volume per tract, from the separate tract masks of a tractmasks dataset.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.788"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.788-blue.svg" alt="Run on brainlife.io"></a>
  <a href="https://github.com/brainlife/app-merge-tractmasks/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> 📍 **This branch, `v1.0`, is the brainlife.io App Merge tractmasks into individual mask** ([doi:10.25663/brainlife.app.788](https://doi.org/10.25663/brainlife.app.788)).

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Utility that concatenates the individual tract masks of a tractmasks dataset into one 4D mask image with FSL fslmerge, keeping the label file.**

Reads the tract names from color.json and stacks the masks in that order into masks/mask.nii.gz (one volume per tract), copying color.json as label.json. Use it when a downstream App expects all tract masks in a single file. Needs a tractmasks dataset with a color.json listing its tracts.

| | |
|---|---|
| 📥 **Inputs** | `neuro/tractmasks` |
| 📤 **Outputs** | `neuro/tractmasks` |
| 🐳 **Container** | `brainlife/fsl:6.0.4-patched2` |
| ⚙️ **Resources** | 2 CPUs · 0.83 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.788](https://doi.org/10.25663/brainlife.app.788) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `masks` | `neuro/tractmasks` | yes | Tract masks dataset: one NIfTI mask per tract plus color.json with tract names. Masks must share the same grid; file names must start with the names in color.json. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `masks` | `neuro/tractmasks` | Single 4D mask.nii.gz with one volume per tract, plus label.json. |

<!-- brainlife-app:end -->

## 🔬 How it works

The App reads the tract names from the `color.json` file of the input `neuro/tractmasks` dataset and stacks the mask of each tract, in that order, into a single 4D image with FSL `fslmerge -t`. The input `color.json` is copied as `label.json`, so volume *n* of the merged image is the *n*-th tract listed there. Use it when a downstream App expects all tract masks in one file.

## 🚀 Running the App

### ☁️ On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.788](https://doi.org/10.25663/brainlife.app.788), choose a `neuro/tractmasks` dataset from your project and press **Execute**. The merged mask is archived to your project as a `neuro/tractmasks` dataset tagged `merged`.

### 💻 Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). `main` runs `merge-mask.sh` inside the `brainlife/fsl:6.0.4-patched2` container.

1. Clone this repository and check out the App's branch: `git checkout v1.0`.
2. Create `config.json` with the path to the tractmasks directory (it must contain `color.json` and one `<tract name>*.nii.gz` file per tract):

   ```json
   {
       "mask": "/input/tractmasks/masks"
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

## 📦 Outputs

```text
masks/
└── masks/
    ├── mask.nii.gz    4D image, one volume per tract
    └── label.json     tract names and colours, in volume order (copy of color.json)
```

## 🩺 Troubleshooting

- **`something went wrong. check data`**: no merged mask was produced. Check that the mask file names start with the tract names listed in `color.json`.

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Merge tractmasks into individual mask. brainlife.io App. [doi:10.25663/brainlife.app.788](https://doi.org/10.25663/brainlife.app.788)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## 👥 Authors

- Brad Caron

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

This repository does not include a license file. FSL is distributed under its own [license](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Licence) (non-commercial use).
