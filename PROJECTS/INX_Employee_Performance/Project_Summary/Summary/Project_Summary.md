# Project Summary
## INX Future Inc — Employee Performance Analysis
**Project Code:** 10281 | **IABAC Certified Data Scientist**

---

## Executive Summary

This project analyzed the employee performance data of INX Future Inc. (1,200 employees, 27 features) to identify root causes of declining performance and deliver a predictive model for use in hiring. A Random Forest Classifier was trained achieving **92.5% test accuracy** and **0.9221 weighted F1 score**, with SMOTE applied to handle class imbalance. The analysis directly answers all four business requirements raised by CEO Mr. Brain.

---

## Business Requirement 1 — Department-wise Performance

| Department | Avg Rating | Excellent % | Low % |
|------------|-----------|-------------|-------|
| Development | 3.08+ | Highest | Low |
| Data Science | 3.06+ | High | Low |
| Research & Development | ~3.0 | Moderate | Moderate |
| Sales | ~2.95 | Moderate | Moderate |
| Finance | ~2.85 | Low | High |
| Human Resources | ~2.80 | Lowest | Highest |

**Key Finding:** Development and Data Science departments are the best performing. Human Resources and Finance are the most concerning, with the highest proportions of Low (Rating 2) performers. Targeted intervention should start with HR and Finance departments.

---

## Business Requirement 2 — Top 3 Factors Affecting Employee Performance

### Factor 1: EmpLastSalaryHikePercent (19.87% importance)
Employees with higher salary hike percentages consistently achieve higher performance ratings. The data shows a strong positive relationship: Excellent (Rating 4) employees receive significantly higher hikes than Low (Rating 2) employees. **Reward drives performance.**

### Factor 2: EmpEnvironmentSatisfaction (19.19% importance)
Employee satisfaction with the work environment is the second strongest predictor. Employees with low environment satisfaction (score 1-2) are predominantly in the Low performance category, while those with score 3-4 dominate the Excellent category. **A satisfying work environment is a prerequisite for high performance.**

### Factor 3: YearsSinceLastPromotion (9.21% importance)
The longer an employee goes without a promotion, the lower their performance rating tends to be. This stagnation effect is measurable — employees not promoted for 4+ years are disproportionately in the Low performance tier. **Career stagnation directly erodes performance.**

---

## Business Requirement 3 — Trained Prediction Model

**Model:** Random Forest Classifier (tuned via 5-fold GridSearchCV)

| Parameter | Value |
|-----------|-------|
| n_estimators | 200 |
| max_depth | None (full depth) |
| min_samples_split | 2 |
| min_samples_leaf | 1 |

| Metric | Result |
|--------|--------|
| Test Accuracy | **92.5%** |
| Weighted F1 | **0.9221** |
| Class Balancing | SMOTE (training set only) |

The model accepts 27 employee attributes and predicts performance rating (2/3/4) with confidence probabilities. It is saved at `data/processed/best_model_rf.pkl` and can be deployed in the hiring pipeline (see `src/models/predict_model.ipynb`).

---

## Business Requirement 4 — Recommendations

### 1. Reform the Salary Hike Structure
Link hike percentages explicitly to performance ratings. Suggested bands:
- Rating 4 (Excellent): 18–22% hike
- Rating 3 (Good): 13–17% hike
- Rating 2 (Low): 10–12% hike with a performance improvement plan

This directly addresses the top predictor of performance.

### 2. Improve Work Environment — Priority: HR & Finance
Conduct environment audits in the lowest-performing departments. Focus areas:
- Team dynamics and manager relationships
- Physical workspace and tooling quality
- Flexibility and remote work options
- Open feedback channels

### 3. Enforce Promotion Timelines
- Set a maximum stagnation cap of 2 years without promotion or role change
- Create structured career ladders visible to all employees
- Enroll employees with 2+ years in same role into career development plans

### 4. Standardize Training Investment
Excellent performers average more training sessions per year. Minimum standard: **3 training sessions per employee per year**, across all departments.

### 5. Reduce Compulsory Overtime
Overtime does not reliably produce better performance and risks burnout. Hire to reduce peak-load overtime, especially in Sales and Development.

### 6. Optimize Work-Life Balance
Score 3 (balanced) is associated with the best performance outcomes. Introduce:
- Flexible working hours
- Hybrid/remote options where applicable
- Mental health support programs

---

## Conclusion

The declining performance at INX Future Inc. is not a morale mystery — it has clear, measurable, addressable causes. By restructuring salary hike policies, improving the work environment, and eliminating career stagnation, the company can measurably improve performance without resorting to penalization. The trained model gives HR a scientific, objective tool to predict and screen performance during hiring, helping INX maintain its reputation as a top employer while recovering its service delivery standards.
