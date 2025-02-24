# CHANGELOG

## [v0.2.0](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.2.0) - 2023-04-28 15:15:34

*No description*

## [v0.1.9](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.9) - 2023-04-28 13:53:52

*No description*

## [v0.1.8](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.8) - 2023-04-21 15:15:31

**Full Changelog**: https://github.com/carsonpurnell/cryotomosim_CTS/compare/v0.1.6...v0.1.8

## [v0.1.6](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.6) - 2023-02-09 16:35:30

*No description*

### Bug Fixes

- general:
  - fix error from beads lacking flags ([d192646](https://github.com/carsonpurnell/cryotomosim_CTS/commit/d192646301204b647d61fa6b68c2b2a85321df48))

## [v0.1.5](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.5) - 2023-01-31 17:25:49

*No description*

### Feature

- general:
  - feat membrane is now generated as nonspherical, blobby vesicles ([b256e6f](https://github.com/carsonpurnell/cryotomosim_CTS/commit/b256e6f48a2dd110b8caf363f2b48ae12d6a0d4d))

## [v0.1.4](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.4) - 2023-01-24 18:37:45

*No description*

### Bug Fixes

- general:
  - fix bypass memory leak with vesicle generation ([015d6b6](https://github.com/carsonpurnell/cryotomosim_CTS/commit/015d6b653f208f197c57c85571efcdc4e646630a))

## [v0.1.3](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.3) - 2023-01-16 21:54:07

*No description*

## [v0.1.2](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.2) - 2023-01-16 02:12:14

Implementation of a parameter manager for models that takes on all arguments other than the input volume, layered placement of particles to better control their relative quantity and to replace the inelegant use of the distractor argument, and preliminary implementation of a flag-based control scheme for modeling rather than exclusive classes.

**Full Changelog**: https://github.com/carsonpurnell/cryotomosim_CTS/compare/v0.1.0...v0.1.2

### Feature

- general:
  - feat model parameter manager ([a694136](https://github.com/carsonpurnell/cryotomosim_CTS/commit/a694136129b8644de867ad075d1265e1f5c5251a))
  - feat particle layering implemented ([70ed8a6](https://github.com/carsonpurnell/cryotomosim_CTS/commit/70ed8a612a99fe7272de050d95781253be949bca))
  - feat layer model filling preliminaries ([38dab9f](https://github.com/carsonpurnell/cryotomosim_CTS/commit/38dab9f7fac0a62a9a3f85f46a08042532723d5b))
  - feat model parameter manager ([2d74d4b](https://github.com/carsonpurnell/cryotomosim_CTS/commit/2d74d4beb87c8f2cf19c205aa78a57e416cc53eb))

### Bug Fixes

- general:
  - fix major speed increase by not using ind2sub ([7e3194c](https://github.com/carsonpurnell/cryotomosim_CTS/commit/7e3194c491f5b792012d209e44abe9cc5854e36d))

## [v0.1.0](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.1.0) - 2022-12-15 18:31:38

Model generation now supports placement of membrane proteins in or on generated vesicles through the classes 'memplex' (functioning as a complex) and 'membrane'. Membrane proteins must be oriented with the external domain in the positive Z direction, and must be oriented around 0,0,0 as the transmembrane centroid.
see https://opm.phar.umich.edu for an annotated database of membrane proteins, with structures that include membrane border models.

To conform to these requirements using ChimeraX, you can use define to create a plane or axis from the TMD, and then align to orient it along the Z axis, using turn y 108 if it is reversed. If this does not center the TMD at 0,0,0 you can use the measure command to determine the offset and the move command to shift all models until the TMD centroid is at 0,0,0. Do not save relative to any model, that will shift coordinates.

If you use an OPM structure or otherwise create a model annotation for the TMD, you can instead rename that TMD-defining model (such as the OPM planes) to something that includes 'origin' and save it as a .cif (as .pdb do not retain model names). CTS will detect the model name and use it to define the centroid. OPM models seem to already be aligned to this standard (and with the TMD centroid very close to 0,0,0) and so should be easier.
Note that old chimera cannot save .cif files, and chimeraX does not load model names - it can only save them, so it will overwrite any model names if used to open and save the file again.

## [v0.0.9](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.9) - 2022-12-09 18:34:58

implementation of preliminary support for integral membrane proteins

### Feature

- general:
  - feat membrane protein basic functions ([f5a528f](https://github.com/carsonpurnell/cryotomosim_CTS/commit/f5a528fc2b87aa7360944285b0776d2faaa00600))
  - feat ctsutil for cross-function utilities ([7a615a4](https://github.com/carsonpurnell/cryotomosim_CTS/commit/7a615a4761b351f99208ec49d048e4ce291b313e))

### Bug Fixes

- general:
  - fix ice blending with beads ([72e7669](https://github.com/carsonpurnell/cryotomosim_CTS/commit/72e76699febf8d5f8b6051bd21d55cb112415754))

## [v0.0.8](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.8) - 2022-10-17 14:55:38

*No description*

### Feature

- general:
  - feat output ctf profile by simulate ([4970880](https://github.com/carsonpurnell/cryotomosim_CTS/commit/4970880f4c8a68570def2215ce1774dd0d9a824f))

### Bug Fixes

- general:
  - fix prevent atlas label overlaps ([d4e7a7e](https://github.com/carsonpurnell/cryotomosim_CTS/commit/d4e7a7e7d6b14d35aa5fec2beda0603ccaf5562e))
  - fix corrected tilt thickness calculation ([a54c850](https://github.com/carsonpurnell/cryotomosim_CTS/commit/a54c850970543cc5f29e4ca01a6957c63680e458))

## [v0.0.7](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.7) - 2022-09-21 16:17:07

*No description*

### Feature

- general:
  - feat membrane generation as vesicles ([cfe98e2](https://github.com/carsonpurnell/cryotomosim_CTS/commit/cfe98e2f13585da063ae412136c1a1d0061894f6))

### Bug Fixes

- general:
  - fix dynamotable generation failure ([bbb32e2](https://github.com/carsonpurnell/cryotomosim_CTS/commit/bbb32e2acc4d14d58ddc73d166f8caebbaf24a77))

### Performance Improvements

- general:
  - perf helper_input skips if given formatted particles ([0f86551](https://github.com/carsonpurnell/cryotomosim_CTS/commit/0f865519d93a73a588095e5f4a5a92ade3e7516a))

## [v0.0.6](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.6) - 2022-09-13 13:27:57

implemented random error in tilt angles (name-val 'tilterr'), a new model handle (.assembly) for nonuniform complexes, and ind_x output .mrc are now by default binary, can be changed with cts_simulate name-val 'bin'.

### Feature

- general:
  - feat tilt angle error margin ([a23a30f](https://github.com/carsonpurnell/cryotomosim_CTS/commit/a23a30fad55385b856b0508ec79ce8fbf45e7440))
  - feat variable complex - assembly ([03657d2](https://github.com/carsonpurnell/cryotomosim_CTS/commit/03657d2616be30635d1bbe6e578123a6e19e5b8d))

### Bug Fixes

- general:
  - fix overflow filenames ([55d6254](https://github.com/carsonpurnell/cryotomosim_CTS/commit/55d6254b1ba4fb7ec918bb59ab939724b8fd9fcd))

## [v0.0.5](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.5) - 2022-09-07 18:59:11

implemented support for .cif and .mmcif files

### Feature

- general:
  - update helper_input for .cif ([85003f2](https://github.com/carsonpurnell/cryotomosim_CTS/commit/85003f26ed043e0ef96ce623832d705f5734134b))
  - .cif implemented and working ([2f6f608](https://github.com/carsonpurnell/cryotomosim_CTS/commit/2f6f608bb39aefa13ab9dd2249dab3dffe397693))
  - feat graph export to GUI ([62b121c](https://github.com/carsonpurnell/cryotomosim_CTS/commit/62b121c7eb47cf5a3c16b5b0975fac05e2f5608f))
  - feature: .cif kind of working ([f19d743](https://github.com/carsonpurnell/cryotomosim_CTS/commit/f19d74329b2b1da40dc151d1a600bf16fd553c67))

### Bug Fixes

- general:
  - fix pdb2vol bad range for coords ([ebec1da](https://github.com/carsonpurnell/cryotomosim_CTS/commit/ebec1da5e67e126e98dca5a054f01e6e6d016483))

## [v0.0.4](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.4) - 2022-08-30 18:35:49

many miscellaneous speed and accuracy improvements, cts_model can now generate a dynamic graph readout of particle placement results

### Feature

- general:
  - model progress graph ([ff6e67b](https://github.com/carsonpurnell/cryotomosim_CTS/commit/ff6e67b767bda8f874c42a14df66d20c8d27c5e1))

### Performance Improvements

- general:
  - faster pdb2vol vectorized atomic data ([dc5e660](https://github.com/carsonpurnell/cryotomosim_CTS/commit/dc5e660316e223ae7e3c780700a2836ecfd06bff))
  - arrayinsert improvements ([a9af0ec](https://github.com/carsonpurnell/cryotomosim_CTS/commit/a9af0ecb572cc76c7fddd084e278ae65f52036e3))
  - pdb2vol avoid saving .mat that exists ([44e3ed2](https://github.com/carsonpurnell/cryotomosim_CTS/commit/44e3ed259c966cd32d9927e7ee017436858b88ae))

## [v0.0.3](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.3) - 2022-08-23 18:17:56

*No description*

### Bug Fixes

- general:
  - fix error in name parsing ([3182446](https://github.com/carsonpurnell/cryotomosim_CTS/commit/3182446cc593f32641c68f88d26be53f99a1c7c8))

### Performance Improvements

- general:
  - perf pdb2vol speed improvements ([b15f368](https://github.com/carsonpurnell/cryotomosim_CTS/commit/b15f368aca47e153d4ebba36235fc023fe1084ae))
  - perf faster pdb2vol ([0560bc6](https://github.com/carsonpurnell/cryotomosim_CTS/commit/0560bc6b837ea83805fe3a7656999275b8515337))

## [v0.0.2](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.2) - 2022-08-16 17:47:07

*No description*

### Feature

- general:
  - feature: bead generation ([3a2fcd8](https://github.com/carsonpurnell/cryotomosim_CTS/commit/3a2fcd829b578b72a80288d52cde0e8a347300fe))

### Bug Fixes

- general:
  - fix carbon grid function call ([ecf38b6](https://github.com/carsonpurnell/cryotomosim_CTS/commit/ecf38b66624960465115ee1546cb1458395fcdff))

## [v0.0.1](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.1) - 2022-08-12 19:56:36

basic help documentation rewrites for simulation

### Bug Fixes

- general:
  - fix pushing .asv files ([cd7ab45](https://github.com/carsonpurnell/cryotomosim_CTS/commit/cd7ab45f6aa6a1022fbddfd597bf666cfa4927c5))

## [v0.0.0](https://github.com/carsonpurnell/cryotomosim_CTS/releases/tag/v0.0.0) - 2022-08-12 17:13:11

*No description*

### Feature

- general:
  - feature: more parameter validations ([8ccb0ee](https://github.com/carsonpurnell/cryotomosim_CTS/commit/8ccb0ee05b22deee7959e2ae95137fc8ea5f9b75))

\* *This CHANGELOG was automatically generated by [auto-generate-changelog](https://github.com/BobAnkh/auto-generate-changelog)*
