#!/usr/bin/env bash
# ==============================================================================
# reorganize_repo.sh
#
# Reorganizes PatchTSTSpike_Transformer_cloudburst_ERA5 into a structured
# directory layout. Run this from the ROOT of the repo (where README.md lives).
#
# Usage:
#   chmod +x reorganize_repo.sh
#   ./reorganize_repo.sh
#
# The script is safe to re-run: it only moves a file if it exists at the
# expected source path, and skips anything it can't find (printing a warning
# instead of failing), so partial repos won't blow up the whole run.
# ==============================================================================

set -uo pipefail

# Helper: move a file if it exists, otherwise warn and continue
safe_mv() {
  local src="$1"
  local dst="$2"
  if [ -f "$src" ]; then
    mv -v "$src" "$dst"
  else
    echo "  [skip] not found: $src"
  fi
}

echo "==> Creating directory structure..."

mkdir -p data/raw
mkdir -p data/processed
mkdir -p data/analysis
mkdir -p notebooks
mkdir -p src/models
mkdir -p results/figures/study_area
mkdir -p results/figures/eda
mkdir -p results/figures/model_results
mkdir -p results/figures/baseline_cnn_gru
mkdir -p report/figures

echo "==> Moving data files..."

safe_mv "verified_himalayan_cloudburst_events_1960_2024_geocoded.csv" "data/raw/"
safe_mv "verified_cloudburst_events_with_coords.csv"                  "data/processed/"
safe_mv "feature_selection_score.csv"                                 "data/analysis/"
safe_mv "lag_correlation_table.csv"                                   "data/analysis/"
safe_mv "mutual_info_table.csv"                                       "data/analysis/"
safe_mv "spike_vs_nonspike_effect_table.csv"                          "data/analysis/"

echo "==> Moving and numbering notebooks..."

safe_mv "EDA_himalayan_region_cloudburst_prediction.ipynb" \
        "notebooks/01_EDA_himalayan_region_cloudburst_prediction.ipynb"
safe_mv "Transformer_model_himalayan_region_cloudburst_prediction.ipynb" \
        "notebooks/02_Transformer_model_himalayan_region_cloudburst_prediction.ipynb"

echo "==> Moving figures (study area)..."

safe_mv "study_area_clean_legend.png" "results/figures/study_area/"

echo "==> Moving figures (EDA)..."

safe_mv "class_imbalance_train.png"                                      "results/figures/eda/"
safe_mv "Correlation Heatmap.png"                                        "results/figures/eda/"
safe_mv "correlation_heatmap_nonleaky_train.png"                         "results/figures/eda/"
safe_mv "feature_relevance_nonleaky_train.png"                           "results/figures/eda/"
safe_mv "boxplots_top_features_nonleaky_train.png"                       "results/figures/eda/"
safe_mv "Lead-Lag Correlation tp_max vs t2m.png"                         "results/figures/eda/"
safe_mv "Seasonal Decomposition.png"                                     "results/figures/eda/"
safe_mv "Fig_03_Monthly_Rainfall_Climatology.png"                        "results/figures/eda/"
safe_mv "Fig_05_Extreme_Rainfall_Frequency_P99.png"                      "results/figures/eda/"
safe_mv "daily regional max rainfall.png"                                "results/figures/eda/"
safe_mv "Distribution of Daily Regional Max Rainfall with Percentiles.png" "results/figures/eda/"
safe_mv "Yearly Count of P99 Extreme Rainfall Days.png"                  "results/figures/eda/"
safe_mv "Yearly Maximum Rainfall Intensity.png"                          "results/figures/eda/"
safe_mv "Yearly Maximum Rainfall Intensity 2.png"                        "results/figures/eda/"
safe_mv "timeseries_tp_region_max_with_spikes.png"                       "results/figures/eda/"
safe_mv "region mean max comparison.png"                                 "results/figures/eda/"

echo "==> Moving figures (model results)..."

safe_mv "roc_curve_nonleaky_L30_test.png"       "results/figures/model_results/"
safe_mv "pr_curve_nonleaky_L30_test.png"        "results/figures/model_results/"
safe_mv "window_length_comparison_nonleaky.png" "results/figures/model_results/"
safe_mv "best_vs_worst_diagnostics.png"         "results/figures/model_results/"

echo "==> Moving figures (CNN-GRU baseline)..."

safe_mv "uttarakhand_cnn_gru_loss.png"          "results/figures/baseline_cnn_gru/"
safe_mv "uttarakhand_cnn_gru_scatter.png"       "results/figures/baseline_cnn_gru/"
safe_mv "uttarakhand_cnn_gru_true_vs_pred.png"  "results/figures/baseline_cnn_gru/"

echo "==> Moving report files..."

safe_mv "main.tex"  "report/"
safe_mv "draft.tex" "report/"

echo "==> Leftover files still in root (review manually):"
find . -maxdepth 1 -type f ! -name "*.sh" ! -name "README.md" ! -name "LICENSE" \
  ! -name "requirements.txt" ! -name ".gitignore" -print

echo ""
echo "==> Done. Review the tree below:"
find . -not -path "./.git*" -print | sed -e 's;[^/]*/;  ;g'
