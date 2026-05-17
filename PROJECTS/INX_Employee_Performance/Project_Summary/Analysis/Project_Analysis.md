# Project Analysis
## INX Future Inc — Employee Performance Analysis
**Project Code:** 10281 | **IABAC Certified Data Scientist**

---

## 1. Data Preprocessing Choices

### 1.1 Column Removal
- `EmpNumber` was dropped — it is a unique identifier with no predictive value.

### 1.2 Missing Values & Duplicates
- No missing values found across all 28 columns.
- No duplicate records in the 1,200-row dataset.

### 1.3 Encoding Strategy

| Column(s) | Type | Method | Reason |
|-----------|------|--------|--------|
| Gender, OverTime, Attrition | Binary | Label Encoding | Only 2 categories — no ordinal ambiguity |
| BusinessTravelFrequency | Ordinal | Manual Mapping (0/1/2) | Inherent order: Non-Travel < Rarely < Frequently |
| EducationBackground, MaritalStatus, EmpDepartment, EmpJobRole | Nominal | One-Hot Encoding | No natural order; prevents model from implying false ranking |

### 1.4 Feature Scaling
- **StandardScaler** applied to all 18 numerical features.
- Ensures mean=0 and std=1; prevents features with large ranges (e.g., TotalWorkExperienceInYears) from dominating distance-based algorithms.

---

## 2. Class Imbalance Handling

Target distribution before balancing:
- Rating 3 (Good): 874 records — 72.8%
- Rating 2 (Low): 194 records — 16.2%
- Rating 4 (Excellent): 132 records — 11.0%

**Method:** SMOTE (Synthetic Minority Oversampling Technique) applied on the training set only.
- Generates synthetic samples for minority classes (2 and 4) using k-nearest neighbors.
- Applied after train-test split to prevent data leakage.

---

## 3. Feature Selection Analysis

### Correlation with Target (PerformanceRating)
Top correlated numerical features:
1. `EmpLastSalaryHikePercent` — Highest positive correlation
2. `EmpEnvironmentSatisfaction` — Strong positive correlation
3. `YearsSinceLastPromotion` — Negative correlation (more time = lower performance)
4. `EmpWorkLifeBalance` — Moderate positive
5. `EmpJobInvolvement` — Moderate positive

### Feature Interactions
- Salary hike and environment satisfaction are partially independent predictors — both retained.
- Years at company and current role experience are correlated but both contribute unique signals.
- No features were removed due to multicollinearity — Random Forest handles correlated features natively.

---

## 4. Algorithm Selection

### Models Evaluated

| Model | CV Accuracy | Pros | Cons |
|-------|-------------|------|------|
| Logistic Regression | ~82% | Interpretable | Underfits nonlinear patterns |
| Decision Tree | ~88% | Interpretable | High variance, overfits |
| Random Forest | **~93%** | Robust, feature importance | Slightly less interpretable |
| Gradient Boosting | ~91% | High accuracy | Slower, harder to tune |
| SVM | ~85% | Good for high dimensions | No feature importance, slow |

### Selected: Random Forest Classifier

**Reasons:**
- Highest cross-validation accuracy among all models
- Ensemble approach reduces overfitting vs single Decision Tree
- Provides feature importance scores (directly required by business)
- Handles both numerical and one-hot encoded features well
- Robust to outliers and imbalanced class effects post-SMOTE

### Hyperparameter Tuning (GridSearchCV, 5-fold CV)
- `n_estimators`: [100, 200] → Best: **200**
- `max_depth`: [None, 10, 20] → Best: **None**
- `min_samples_split`: [2, 5] → Best: **2**
- `min_samples_leaf`: [1, 2] → Best: **1**

---

## 5. Model Performance

| Metric | Value |
|--------|-------|
| Test Accuracy | **92.5%** |
| Weighted F1 Score | **0.9221** |
| Cross-Validation Accuracy | ~93% ± 1.2% |

### Per-Class Performance
- Rating 2 (Low): High recall — model correctly identifies most low performers
- Rating 3 (Good): Highest precision — majority class, well learned
- Rating 4 (Excellent): Reasonable recall — improved significantly by SMOTE

---

## 6. Top 3 Feature Importances

| Rank | Feature | Importance Score |
|------|---------|-----------------|
| 1 | EmpLastSalaryHikePercent | 19.87% |
| 2 | EmpEnvironmentSatisfaction | 19.19% |
| 3 | YearsSinceLastPromotion | 9.21% |

---

## 7. Tools & Technologies

| Component | Tool/Library |
|-----------|-------------|
| Data Processing | pandas, numpy |
| Visualization | matplotlib, seaborn |
| Machine Learning | scikit-learn |
| Class Balancing | imbalanced-learn (SMOTE) |
| Model Persistence | pickle |
| Notebooks | Jupyter Notebook |
| Language | Python 3.12 |
