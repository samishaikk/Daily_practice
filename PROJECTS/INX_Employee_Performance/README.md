# INX Future Inc — Employee Performance Analysis
**IABAC Certified Data Scientist | Project Code: 10281**

---

## Project Overview

INX Future Inc., a top-20 employer in data analytics, has seen declining employee performance and an 8-point drop in client satisfaction. This project performs a full data science analysis to identify root causes, build a performance prediction model, and deliver actionable recommendations — without blanket penalization of employees.

---

## Project Structure

```
INX_Employee_Performance/
│
├── Project_Summary/
│   ├── Requirement/
│   │   └── Project_Requirement.md       ← Business context & deliverables
│   ├── Analysis/
│   │   └── Project_Analysis.md          ← Technical choices & methodology
│   └── Summary/
│       └── Project_Summary.md           ← Full results & recommendations
│
├── data/
│   ├── raw/
│   │   └── INX_Future_Inc_Employee_Performance_CDS_Project2_Data_V1_8.xls
│   ├── processed/
│   │   ├── INX_Employee_Processed.csv   ← Cleaned, encoded, scaled dataset
│   │   ├── best_model_rf.pkl            ← Trained Random Forest model
│   │   ├── scaler.pkl                   ← StandardScaler for new data
│   │   ├── feature_columns.pkl          ← Feature column names
│   │   └── fig_*.png                    ← All generated charts
│   └── external/                        ← (empty — no external data used)
│
├── src/
│   ├── Data_Processing/
│   │   ├── data_processing.ipynb        ← Cleaning, encoding, scaling
│   │   └── data_exploratory_analysis.ipynb ← EDA, correlations, distributions
│   ├── models/
│   │   ├── train_model.ipynb            ← Model training, comparison, tuning
│   │   └── predict_model.ipynb          ← Prediction pipeline for new employees
│   └── visualization/
│       └── visualize.ipynb              ← Business insight dashboards
│
└── references/
    └── Data_Dictionary.md               ← Column descriptions & value ranges
```

---

## How to Run

### Prerequisites
```bash
pip install pandas numpy matplotlib seaborn scikit-learn imbalanced-learn jupyter xlrd
```

### Execution Order
Run notebooks in this exact order:

1. `src/Data_Processing/data_processing.ipynb` — Processes raw data → saves to `data/processed/`
2. `src/Data_Processing/data_exploratory_analysis.ipynb` — EDA on raw data
3. `src/models/train_model.ipynb` — Trains & saves the best model
4. `src/models/predict_model.ipynb` — Demonstrates hiring prediction pipeline
5. `src/visualization/visualize.ipynb` — Business insight dashboards

---

## Key Results

| Metric | Value |
|--------|-------|
| Model | Random Forest Classifier |
| Test Accuracy | **92.5%** |
| Weighted F1 Score | **0.9221** |
| Top Factor #1 | EmpLastSalaryHikePercent (19.87%) |
| Top Factor #2 | EmpEnvironmentSatisfaction (19.19%) |
| Top Factor #3 | YearsSinceLastPromotion (9.21%) |
| Best Department | Development / Data Science |
| Needs Attention | Human Resources / Finance |

---

## Business Deliverables Addressed

| # | Requirement | Status |
|---|-------------|--------|
| 1 | Department-wise performance analysis | ✅ Complete |
| 2 | Top 3 factors affecting performance | ✅ Complete |
| 3 | Trained prediction model for hiring | ✅ Complete |
| 4 | Recommendations to improve performance | ✅ Complete |
