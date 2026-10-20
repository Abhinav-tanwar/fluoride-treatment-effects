# Fluoride Treatment Effects

Treatment-by-institution analysis of changes in decayed, missing, or filled teeth.

## The question

Do changes in DMFT differ by treatment, and does institution or its interaction with treatment matter?

## Approach

The source describes 69 participants with treatments SF, ACF, and W. The dataset is missing. Replaces balanced-design PROC ANOVA with PROC GLM, adds residual diagnostics, and keeps post-hoc comparisons in the institution-adjusted model. Full interaction, additive, and treatment-only models are separate; conclusions depend on the missing data.

## Run in SAS

Requires SAS 9.4 with SAS/STAT and ODS Graphics (or an equivalent licensed SAS Studio environment).

1. Download/clone this repository.
2. Set `project_root` in `src/config.sas` to its absolute directory.
3. Open `run.sas`. If SAS is not started in the repository directory, change its first `%include` to the absolute path to `src/config.sas`.
4. Submit the whole program. The HTML report is written to `outputs/analysis.html`.
5. Review the SAS log for errors and warnings before interpreting results.

## Repository guide

- `src/analysis.sas`: analysis procedures and explanatory comments.
- `src/config.sas`: one root-path setting and shared execution checks.
- `data/`: analysis inputs and schema/provenance notes.
- `docs/`: methods and recovery decisions.
- `validation/`: independent numerical checks when inputs are available.

## Validation status

Input unavailable. Only source review is possible; numerical results are intentionally absent.

## Authorship and provenance

Analysis supplied by Abhinav Tanwar; packaging and source recovery are documented in `docs/provenance.md`. These are analytical portfolio projects. No employer affiliation or production deployment is implied. Data retain their original ownership; no dataset license is invented.
