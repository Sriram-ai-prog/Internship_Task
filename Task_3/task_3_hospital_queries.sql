-- ******************************************************
-- ** Alabs Internship - Task 3: SQL Analysis
-- ** Analyst: Tadishetty Sriram
-- ** Database: PostgreSQL
-- ** Dataset: Hospital Operations
-- ******************************************************

-- === CATEGORY 1: BED CAPACITY & OPERATIONS (The "Big Picture") ===

-- Q1: What is the overall bed utilization and patient refusal rate?
-- (Demonstrates: Aggregates, Math, Type Casting)
SELECT 
    (SUM(patients_admitted)::decimal / SUM(available_beds)) * 100 AS bed_utilization_rate_pct,
    (SUM(patients_refused)::decimal / SUM(patients_request)) * 100 AS patient_refusal_rate_pct,
    SUM(patients_refused) AS total_patients_refused
FROM services_weekly;

-- Q2: Which services are under the most pressure?
-- (Demonstrates: GROUP BY, ORDER BY, Aggregates)
SELECT
    service,
    AVG(patient_satisfaction) AS avg_patient_satisfaction,
    (SUM(patients_refused)::decimal / SUM(patients_request)) * 100 AS refusal_rate_pct
FROM services_weekly
GROUP BY service
ORDER BY refusal_rate_pct DESC, avg_patient_satisfaction ASC;


-- === CATEGORY 2: PATIENT ANALYSIS ===

-- Q3: What is the average length of stay (in days) per service?
-- (Demonstrates: Date Functions, AVG, WHERE...IS NOT NULL)
SELECT 
    service,
    AVG(departure_date - arrival_date) AS avg_length_of_stay_days
FROM patients
WHERE departure_date IS NOT NULL
GROUP BY service
ORDER BY avg_length_of_stay_days DESC;

-- Q4: What is the correlation between satisfaction and length of stay?
-- (Demonstrates: JOIN, AVG, GROUP BY)
SELECT
    p.service,
    AVG(p.satisfaction) AS avg_patient_satisfaction,
    AVG(p.departure_date - p.arrival_date) AS avg_los_days
FROM patients p
WHERE p.departure_date IS NOT NULL
GROUP BY p.service;


-- === CATEGORY 3: STAFFING & MORALE ANALYSIS ===

-- Q5: What is the average staff morale per service?
-- (Demonstrates: GROUP BY, ORDER BY)
SELECT
    service,
    AVG(staff_morale) AS avg_staff_morale
FROM services_weekly
GROUP BY service
ORDER BY avg_staff_morale ASC;

-- Q6: How many of each role (Nurse, Doctor) were present in the most recent week?
-- (Demonstrates: Subquery in WHERE, GROUP BY)
SELECT 
    role,
    COUNT(staff_id) AS staff_present_count
FROM staff_schedule
WHERE present = 1
AND week = (SELECT MAX(week) FROM staff_schedule)
GROUP BY role;

-- Q7: What "Events" have the worst impact on patient satisfaction?
-- (Demonstrates: WHERE...IS NOT NULL, GROUP BY, ORDER BY)
SELECT
    event,
    AVG(patient_satisfaction) AS avg_satisfaction_during_event
FROM services_weekly
WHERE event IS NOT NULL
GROUP BY event
ORDER BY avg_satisfaction_during_event ASC;


-- === CATEGORY 4: ADVANCED SQL (VIEWS) ===

-- Q8: Create a View for a manager's weekly performance dashboard
-- (Demonstrates: CREATE VIEW, Joins, Subqueries)
CREATE VIEW V_Weekly_Performance_Dashboard AS
SELECT
    sw.week,
    sw.month,
    sw.service,
    sw.available_beds,
    sw.patients_admitted,
    sw.patients_refused,
    (sw.patients_refused::decimal / sw.patients_request) * 100 AS refusal_rate_pct,
    sw.patient_satisfaction,
    sw.staff_morale,
    COALESCE(staffing.staff_present_count, 0) AS staff_present_count
FROM services_weekly sw
LEFT JOIN (
    SELECT 
        week, 
        service, 
        COUNT(staff_id) AS staff_present_count
    FROM staff_schedule
    WHERE present = 1
    GROUP BY week, service
) AS staffing ON sw.week = staffing.week AND sw.service = staffing.service;

-- Displaying the created view 
SELECT * FROM V_Weekly_Performance_Dashboard;

-- Q9: Query the View to find all weeks where any service had > 10% refusal rate
-- (Demonstrates: Using a VIEW)
SELECT 
    service,
    week,
    refusal_rate_pct,
    patient_satisfaction,
    staff_present_count
FROM V_Weekly_Performance_Dashboard
WHERE refusal_rate_pct > 10
ORDER BY week, refusal_rate_pct DESC;