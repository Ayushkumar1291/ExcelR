create database hr_analytics;
use hr_analytics;

-- KPI 1. Average Attrition rate for all Departments --

SELECT 
    Department,
    CONCAT(ROUND((COUNT(CASE 
    WHEN Attrition = 'Yes' THEN 1
	END) / COUNT(*)) * 100,0),' %') AS Attrition1
FROM
    exproject
GROUP BY department;

-- KPI 2. Average Hourly rate of Male Research Scientist --

select round(avg(HourlyRate), 2) as'Avg_Hourly_Rate_Of_Male_Research_Scientist'
from exproject
Where Gender = 'Male' and JobRole = 'Research Scientist';

-- KPI 3. Attrition rate Vs Monthly income stats --

SELECT Department,
       SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS No_of_attrition,
       ROUND(AVG(h2.MonthlyIncome),2) AS Average_monthly_income,
       ROUND(AVG(h1.JobSatisfaction),2) AS Average_job_satisfaction
FROM exproject as h1
JOIN hr2 as h2
on h1.EmployeeNumber = h2.`Employee ID`
GROUP BY Department;


-- KPI 4. Average working years for each Department --

SELECT 
    H1.Department,
    ROUND(AVG(H2.TotalWorkingYears), 2) AS Average_working_years
FROM exproject AS H1
        JOIN
    HR2 AS H2 ON H1.EmployeeNumber = H2.`Employee ID`
GROUP BY Department
Order BY Department, Average_working_years;


-- KPI 5. Job Role Vs Work life balance --

SELECT 
    H1.JobRole, ROUND(AVG(H2.WorkLifeBalance), 2) AS WorkLifeBal
FROM
    exproject AS H1
        JOIN
    hr2 AS H2 ON H1.EmployeeNumber = H2.`Employee ID`
GROUP BY H1.JobRole;