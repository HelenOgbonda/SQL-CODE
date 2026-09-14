
CREATE TABLE Visits ( 
Visit_ID VARCHAR(50),
Visit_Date DATE,
Patient_ID	VARCHAR(50),
Doctor_ID	VARCHAR(50),
Location_ID	VARCHAR(50),
Visit_Type	VARCHAR(50),
Department	VARCHAR(50),
Diagnosis	VARCHAR(50),
Waiting_Time_Min	INT,
Consultation_Duration_Min INT,
Bill_Amount	DECIMAL NOT NULL,
Payment_Method	VARCHAR(50),
Visit_Status	VARCHAR(50),
Bill_Amount_Outlier_Flagged VARCHAR(50),
Patient_ID_Exist	VARCHAR(50),
Doctor_ID_Exist VARCHAR(50),
Location_ID_Exist	VARCHAR(50),
Waiting_Time_Category	VARCHAR(50),
Visit_Year_Month	VARCHAR(50),
Diagnosis_Related_To_Department VARCHAR(50)
);
CREATE TABLE patients (
    patient_id          VARCHAR(10) PRIMARY KEY,
    first_name          VARCHAR(50),
    last_name           VARCHAR(50),
    gender              VARCHAR(10),
    age                 INTEGER,
    registration_date   DATE,
    state               VARCHAR(30),
    region              VARCHAR(30),
    patient_category    VARCHAR(20),
	Age_Group           VARCHAR(20)
);

CREATE TABLE doctors ( 
Doctor_ID	VARCHAR(20) PRIMARY KEY,
Doctor_Name	VARCHAR (20),
Specialty	VARCHAR(50),
State	VARCHAR(20),
Region	VARCHAR(20),
Level	VARCHAR(20),
Years_Experience INT
);

CREATE TABLE locations (
Location_ID	VARCHAR(20) PRIMARY KEY,
Location_Name	VARCHAR(50),
Facility_Type	VARCHAR(50),
State	VARCHAR(50),
Region	VARCHAR(50),
Area_Type VARCHAR(50)
);


--BUSINESS QUESTIONS
SELECT * FROM visits;
SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM locations;

--QUES 1:(Patients demographics) What is the total number of patients under each gender?
SELECT 
    gender,
    COUNT(patient_id) AS total_patients
FROM patients
GROUP BY gender
ORDER BY total_patients DESC;

--QUES 2: Which department has the highest visit volume?
SELECT
    department AS department_name,
    COUNT(*) AS total_visits,
    ROUND(SUM(bill_amount), 2) AS total_revenue
FROM visits
GROUP BY department
ORDER BY total_visits DESC;

--QUES 3: Which departments generated the highest revenue?
SELECT
    department AS department_name,
    ROUND(SUM(bill_amount), 2) AS total_revenue
FROM visits
GROUP BY department
ORDER BY total_revenue DESC;

--QUES 4: Which payment methods generated the most revenue?
SELECT
    payment_method,
    COUNT(*) AS transactions,
    ROUND(SUM(bill_amount), 2) AS total_revenue,
    ROUND(AVG(bill_amount), 2) AS average_bill
FROM visits
GROUP BY payment_method
ORDER BY total_revenue DESC;

--QUES 5: How many unique patients and visits are associated with each state?
SELECT
    p.state,
    COUNT(DISTINCT p.patient_id) AS unique_patients,
    COUNT(v.visit_id) AS total_visits
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY p.state
ORDER BY unique_patients DESC;

--QUES 6: Revenue and visit count by doctors’ specialty and facility type?
SELECT
    d.specialty,
    l.facility_type,
    COUNT(v.visit_id) AS total_visits,
    ROUND(SUM(v.bill_amount), 2) AS total_revenue
FROM visits v
JOIN doctors d ON v.doctor_id = d.doctor_id
JOIN locations l ON v.location_id = l.location_id
GROUP BY d.specialty, l.facility_type
ORDER BY total_revenue DESC;

--QUES 7: Top 10 doctors that generated more revenue than the average doctor?
SELECT
    d.doctor_id,
    d.doctor_name,
    ROUND(SUM(v.bill_amount), 2) AS doctor_revenue
FROM doctors d
JOIN visits v ON d.doctor_id = v.doctor_id
GROUP BY d.doctor_id, d.doctor_name
HAVING SUM(v.bill_amount) > (
    SELECT AVG(doctor_revenue)
    FROM (
        SELECT SUM(bill_amount) AS doctor_revenue
        FROM visits
        GROUP BY doctor_id
    ) x
)
ORDER BY doctor_revenue DESC
LIMIT 10;

--QUES 8: Top 20 patients that had more visits than the average patient?
SELECT
    patient_id,
    COUNT(*) AS total_visits
FROM visits
GROUP BY patient_id
HAVING COUNT(*) > (
    SELECT AVG(patient_visit_count)
    FROM (
        SELECT COUNT(*) AS patient_visit_count
        FROM visits
        GROUP BY patient_id
    ) x
)
ORDER BY total_visits DESC
LIMIT 20;

--QUES 9: . Top 10 year-month periods that generated the highest revenue?
SELECT
    visit_year_month,
    COUNT(*) AS total_visits,
    ROUND(SUM(bill_amount), 2) AS total_revenue
FROM visits
WHERE visit_year_month IS NOT NULL
GROUP BY visit_year_month
ORDER BY total_revenue DESC
LIMIT 10;

--QUES 10: Which patient category contributes the most revenue?
SELECT
    p.patient_category,
    COUNT(v.visit_id) AS total_visits,
    ROUND(SUM(v.bill_amount), 2) AS total_revenue,
    ROUND(AVG(v.bill_amount), 2) AS average_bill
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY p.patient_category
ORDER BY total_revenue DESC;

--QUES 11: Which facility types generate the most revenue?
SELECT
    l.facility_type,
    COUNT(v.visit_id) AS total_visits,
    ROUND(SUM(v.bill_amount), 2) AS total_revenue
FROM locations l
JOIN visits v ON l.location_id = v.location_id
GROUP BY l.facility_type
ORDER BY total_revenue DESC;

--QUES 12: Which diagnoses generate the most revenue?
SELECT
    diagnosis,
    COUNT(*) AS total_visits,
    ROUND(SUM(bill_amount), 2) AS total_revenue
FROM visits
GROUP BY diagnosis
ORDER BY total_revenue DESC;

--QUES 13: What are the total visits, total revenue and average bill amount?
SELECT
    COUNT(*) AS total_visits,
    SUM(bill_amount) AS total_revenue,
    ROUND(AVG(bill_amount), 2) AS average_bill
FROM visits;

--QUES 14: Top 10 doctors that have treated more than 100 individual patients?
SELECT 
    d.doctor_id,
    d.doctor_name,
    d.specialty,
    COUNT(DISTINCT a.patient_id) AS distinct_patients_treated
FROM doctors d
JOIN visits a 
    ON d.doctor_id = a.doctor_id
GROUP BY 
    d.doctor_id, 
    d.doctor_name, 
    d.specialty
HAVING COUNT(DISTINCT a.patient_id) > 100
ORDER BY distinct_patients_treated DESC;

--QUES 15: What is the total and average spent across patients categorized by age brackets (Senior, Adult, Youth)?
SELECT 
    P.age_group AS age_group,
    COUNT(v.visit_id) AS total_visits,
    ROUND(AVG(v.bill_amount), 2) AS avg_charge,
    SUM(v.bill_amount) AS gross_revenue
FROM patients p
JOIN visits v 
    ON p.patient_id = v.patient_id
GROUP BY p.age_group
ORDER BY gross_revenue DESC;
