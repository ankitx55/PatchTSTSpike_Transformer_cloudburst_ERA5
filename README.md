# PatchTSTSpike_Transformer_cloudburst_ERA5

Cloudburst prediction over the Himalayan region using ERA5 reanalysis data, built around a PatchTST-style / Spike Transformer time-series model.

> **Note:** This repository does not yet include a description, topics, or license. The summary below is inferred from file names and structure — update the sections marked `TODO` with details from the actual notebooks (methodology, model architecture, metrics, results).

## Overview

This project explores predicting **cloudburst events** (sudden, extreme, localized precipitation) in the Himalayan region using time-series weather data from **ERA5** (ECMWF's atmospheric reanalysis dataset). It combines:

- Exploratory data analysis (EDA) of historical cloudburst events and associated meteorological variables
- A transformer-based time-series model (PatchTST / Spike Transformer variant) trained to detect or forecast cloudburst "spike" events from ERA5 features

## Repository Structure

| File | Description |
|---|---|
| `EDA_himalayan_region_cloudburst_prediction.ipynb` | Exploratory data analysis of cloudburst events and ERA5 variables |
| `Transformer_model_himalayan_region_cloudburst_prediction.ipynb` | Model training/evaluation notebook (PatchTST / Spike Transformer) |
| `feature_selection_score.csv` | Feature importance / selection scores used to choose model inputs |
| `lag_correlation_table.csv` | Lag-correlation analysis between meteorological variables and cloudburst events |
| `mutual_info_table.csv` | Mutual information scores between candidate features and the target |
| `spike_vs_nonspike_effect_table.csv` | Statistical comparison between cloudburst ("spike") and non-cloudburst periods |
| `verified_cloudburst_events_with_coords.csv` | Verified cloudburst events with geographic coordinates |
| `verified_himalayan_cloudburst_events_1960_2024_geocoded.csv` | Historical, geocoded record of verified Himalayan cloudburst events (1960–2024) |

## Data

- **Source:** ERA5 reanalysis data (ECMWF)
- **Region:** Himalayan region
- **Event records:** Verified cloudburst events spanning 1960–2024, with geocoded coordinates
- TODO: list specific ERA5 variables used (e.g. precipitation, humidity, wind, temperature, pressure levels), spatial/temporal resolution, and preprocessing steps

## Methodology

TODO — summarize from the notebooks, e.g.:
- Feature selection approach (mutual information, lag correlation)
- Definition of a "spike" (cloudburst) vs. non-spike event
- Model architecture (PatchTST backbone, Spike Transformer modifications)
- Training/validation split and evaluation metrics

## Getting Started

```bash
git clone https://github.com/ankitx55/PatchTSTSpike_Transformer_cloudburst_ERA5.git
cd PatchTSTSpike_Transformer_cloudburst_ERA5
```

Open the notebooks in Jupyter:

```bash
jupyter notebook EDA_himalayan_region_cloudburst_prediction.ipynb
jupyter notebook Transformer_model_himalayan_region_cloudburst_prediction.ipynb
```

TODO: add a `requirements.txt` / environment setup instructions (Python version, key libraries — e.g. PyTorch, pandas, numpy, scikit-learn, xarray for ERA5 handling).

## Results

TODO — add key metrics (e.g. accuracy, F1, precision/recall on spike detection) and any figures from the notebooks.

## License

No license currently specified.

## Acknowledgments

- ERA5 reanalysis data provided by ECMWF / Copernicus Climate Change Service
