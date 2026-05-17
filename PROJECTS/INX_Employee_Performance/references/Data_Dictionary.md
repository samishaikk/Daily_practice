# Data Dictionary
## INX Future Inc — Employee Performance Dataset
**Version:** V1.8 | **Records:** 1,200 | **Features:** 28

---

| Column | Type | Description | Values / Range |
|--------|------|-------------|----------------|
| EmpNumber | String | Unique employee identifier | E1001000 – E... |
| Age | Integer | Employee age in years | 18–60 |
| Gender | String | Employee gender | Male, Female |
| EducationBackground | String | Field of education | Life Sciences, Medical, Marketing, Technical Degree, Human Resources, Other |
| MaritalStatus | String | Marital status | Single, Married, Divorced |
| EmpDepartment | String | Department employee belongs to | Sales, Human Resources, Development, Data Science, Research & Development, Finance |
| EmpJobRole | String | Specific job role | Sales Executive, Manager, Developer, Data Scientist, etc. |
| BusinessTravelFrequency | String | Travel requirement | Non-Travel, Travel_Rarely, Travel_Frequently |
| DistanceFromHome | Integer | Distance from home to office (km) | 1–29 |
| EmpEducationLevel | Integer | Education level (ordinal) | 1=Below College, 2=College, 3=Bachelor, 4=Master, 5=Doctor |
| EmpEnvironmentSatisfaction | Integer | Satisfaction with work environment | 1=Low, 2=Medium, 3=High, 4=Very High |
| EmpHourlyRate | Integer | Hourly pay rate | 30–100 |
| EmpJobInvolvement | Integer | Level of job involvement | 1=Low, 2=Medium, 3=High, 4=Very High |
| EmpJobLevel | Integer | Job seniority level | 1–5 |
| EmpJobSatisfaction | Integer | Satisfaction with job | 1=Low, 2=Medium, 3=High, 4=Very High |
| NumCompaniesWorked | Integer | Number of previous employers | 0–9 |
| OverTime | String | Whether employee works overtime | Yes, No |
| EmpLastSalaryHikePercent | Integer | Last salary increment percentage | 11–25 |
| EmpRelationshipSatisfaction | Integer | Satisfaction with work relationships | 1=Low, 2=Medium, 3=High, 4=Very High |
| TotalWorkExperienceInYears | Integer | Total years of work experience | 0–40 |
| TrainingTimesLastYear | Integer | Number of training sessions in last year | 0–6 |
| EmpWorkLifeBalance | Integer | Work-life balance rating | 1=Bad, 2=Good, 3=Better, 4=Best |
| ExperienceYearsAtThisCompany | Integer | Years at INX Future Inc. | 0–40 |
| ExperienceYearsInCurrentRole | Integer | Years in current role | 0–18 |
| YearsSinceLastPromotion | Integer | Years since last promotion | 0–15 |
| YearsWithCurrManager | Integer | Years under current manager | 0–17 |
| Attrition | String | Whether employee left the company | Yes, No |
| **PerformanceRating** | **Integer** | **TARGET: Employee performance rating** | **2=Low, 3=Good, 4=Excellent** |

---

## Target Variable Distribution

| Rating | Label | Count | % |
|--------|-------|-------|---|
| 2 | Low | 194 | 16.2% |
| 3 | Good | 874 | 72.8% |
| 4 | Excellent | 132 | 11.0% |

---

## Notes
- No missing values in any column
- No duplicate records
- `EmpNumber` is dropped before modeling (ID column)
- Class imbalance handled via SMOTE during model training
