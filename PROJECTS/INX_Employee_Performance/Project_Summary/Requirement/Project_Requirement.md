# Project Requirement
## INX Future Inc — Employee Performance Analysis
**Project Code:** 10281 | **IABAC Certified Data Scientist**

---

## Business Context

INX Future Inc. is a leading data analytics and automation solutions provider with over 15 years of global presence, consistently rated among the top 20 best employers for 5 consecutive years.

**Problem Statement:** Employee performance indexes have been declining in recent years. Service delivery escalations have increased and client satisfaction has dropped by 8 percentage points. The CEO, Mr. Brain, wants data-driven insights to identify root causes without resorting to blanket penalization that could harm overall employee morale.

---

## Dataset

- **Source:** INX Future Inc. internal HR data
- **Records:** 1,200 employees
- **Features:** 28 columns (27 predictors + 1 target)
- **Target Variable:** `PerformanceRating` (2 = Low, 3 = Good, 4 = Excellent)
- **Missing Values:** None
- **Duplicates:** None

### Feature Categories

| Category | Features |
|----------|----------|
| Demographics | Age, Gender, MaritalStatus, EducationBackground |
| Job Info | EmpDepartment, EmpJobRole, EmpJobLevel, BusinessTravelFrequency |
| Satisfaction Scores | EmpEnvironmentSatisfaction, EmpJobSatisfaction, EmpRelationshipSatisfaction, EmpWorkLifeBalance, EmpJobInvolvement |
| Compensation | EmpHourlyRate, EmpLastSalaryHikePercent |
| Experience | TotalWorkExperienceInYears, ExperienceYearsAtThisCompany, ExperienceYearsInCurrentRole, NumCompaniesWorked |
| Career | YearsSinceLastPromotion, YearsWithCurrManager, EmpEducationLevel |
| Work Conditions | OverTime, DistanceFromHome, TrainingTimesLastYear, Attrition |

---

## Required Deliverables

1. **Department-wise Performance Analysis** — Identify which departments are performing well and which need intervention
2. **Top 3 Important Factors** — Identify the most influential features affecting performance
3. **Trained Prediction Model** — A model that predicts employee performance rating; to be used in hiring
4. **Recommendations** — Actionable insights to improve employee performance company-wide
