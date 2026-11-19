what is this: wüsste ich auch gerne
how do i run it 
what is in the folder 
who made it 

# Cluster hello

Bootstraps a synthetic GPP series and prints a 95% interval.

## Run
Rscript scripts/cluster_hello.R 200

## Files
scripts/  the analysis code
jobs/     Slurm job scripts
docs/     notes and templates

## Author
Anna Eckert

zusätzliche Line geaddet (A3)

A5: Anna Eckert, 06.11.2026

## Block 4: Flux data summary

Report: `reports/block4_data_summary.qmd` (rendered: `reports/block4_data_summary.html`).

### How to reproduce

1. Requirements: R, Quarto, Python 3.9-3.13 (for the FLUXNET Shuttle).
2. R packages:
   ```r
   install.packages(c("here", "readr", "dplyr", "tidyr", "ggplot2", "knitr", "maps"))
   ```
3. Download the data (not stored in Git). Put `tower_sets_block4.csv` and `get_my_towers.R` in the project folder, set `my_student` to your number and run:
   ```bash
   Rscript get_my_towers.R 07
   ```
   This creates `data/snapshots/` and `data/raw/` with five zip files.
4. Render the report:
   ```bash
   quarto render reports/block4_data_summary.qmd
   ```

The first render reads the half-hourly files from the zips and caches them in `data/processed/all_hh.rds` (takes a few minutes).

### Notes
- Towers: DE-Lnf, FI-Let, US-Kon, CN-Lch, AU-Cpr.
- DE-Lnf: `_VUT_` columns for NEE/GPP/RECO are empty in the delivered file, so `_CUT_REF` variants are used.