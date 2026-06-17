# Healthcare Patient Analysis

## Project Goal
Analyze healthcare patient records using SQL, Excel and Machine Learning.

## Project Workflow
1. Data Collection
2. Data Validation
3. Data Cleaning
4. Data Analysis
5. Visualization
6. Machine Learning
7. Deployment


## Datasets

### 1. Patients Dataset (`patients.csv`)

Contains information about patients and their hospital records.

| Column Name | Description |
|------------|-------------|
| PatientID | Unique patient identifier |
| Name | Patient name |
| Age | Patient age |
| Gender | Patient gender |
| DiagnosisID | Associated diagnosis identifier |
| AdmissionDate | Date of admission |
| DischargeDate | Date of discharge |
| OutcomeID | Treatment outcome identifier |
| TreatmentCost | Cost of treatment |

---

### 2. Laboratory Dataset (`lab.csv`)

Contains laboratory test records for patients.

| Column Name | Description |
|------------|-------------|
| LabID | Unique laboratory record identifier |
| PatientID | Patient identifier |
| TestName | Name of laboratory test |
| Result | Test result value |
| NormalRange | Expected normal range for the test |

---

### 3. Diagnosis Dataset (`diagnosis.csv`)

Contains diagnosis reference information.

| Column Name | Description |
|------------|-------------|
| DiagnosisID | Unique diagnosis identifier |
| DiagnosisName | Diagnosis description |

---

### 4. Outcome Dataset (`outcome.csv`)

Contains patient outcome reference information.

| Column Name | Description |
|------------|-------------|
| OutcomeID | Unique outcome identifier |
| OutcomeName | Outcome description |

Examples:
- Recovered
- Improved
- Under Treatment
- Deceased

---


