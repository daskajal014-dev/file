CREATE TABLE hospital_data (
    hospital_name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    department VARCHAR(50),
    doctors_count INT,
    patients_count INT,
    admission_date DATE,
    discharge_date DATE,
    medical_expenses NUMERIC(10,2)
);

select * from hospital_data;

--1. Total Number of Patients
-- Write an SQL query to find the total number of patients across all hospitals.
select sum(patients_count) as total_number_of_patients
from hospital_data;


--2. Average Number of Doctors per Hospital
--Retrieve the average count of doctors available in each hospital.
select hospital_name,
avg(doctors_count) as avg_count_dr
from hospital_data
group by hospital_name;

--3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.
select hospital_name, department,
sum(patients_count) as highst_number
from hospital_data
group by hospital_name, department
order by highst_number desc
limit 3;

--4. Hospital with the Maximum Medical Expenses
-- Identify the hospital that recorded the highest medical expenses.
select hospital_name,
sum(medical_expenses) as highest_expenses
from hospital_data
group by hospital_name
order by highest_expenses desc
limit 1;

--5. Daily Average Medical Expenses
--Calculate the average medical expenses per day for each hospital.
select distinct hospital_name,
avg(medical_expenses) as avg_per_day
from hospital_data
group by hospital_name;

--6. Longest Hospital Stay
--Find the patient with the longest stay by calculating the difference between
--Discharge Date and Admission Date.

select hospital_name, admission_date, discharge_date,
(discharge_date-admission_date) as longest_stay
from hospital_data
order by longest_stay desc
limit 1;

--7. Total Patients Treated Per City
-- Count the total number of patients treated in each city.
select location,
sum(patients_count) as total_number
from hospital_data
group by location;

--8. Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department.

select department,
avg(discharge_date - admission_date) as avg_date_spend
from hospital_data
group by department;

--9. Identify the Department with the Lowest Number of Patients
-- Find the department with the least number of patients.

select department,
sum(patients_count) as total_patients
from hospital_data
group by department
order by total_patients asc
limit 1;


--10. Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.

select date_trunc('month',admission_date) as month,
sum(medical_expenses) as each_moth
from hospital_data
group by date_trunc('month',admission_date)
order by month;











