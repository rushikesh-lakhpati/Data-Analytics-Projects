Create database Bank_loan;
use Bank_loan;
show tables;
Select *from finance_2;
Select *from finance_1;

/*1. KPI1. Year wise loan amount Stats*/

show columns from finance_1;  /*To determine the datatype of a column in SQL*/


/*Before altering the data type, update the existing date values to the correct 'YYYY-MM-DD' format.
 we can use the STR_TO_DATE function*/
UPDATE finance_1
SET issue_d = STR_TO_DATE(issue_d, '%m-%d-%Y'); 

/*change the data type of the 'issue_d' column to DATE*/
ALTER TABLE finance_1
MODIFY COLUMN issue_d DATE;

SELECT issue_d,
    DATE_FORMAT(issue_d, '%Y-%m-%d') AS formatted_issue_d,
    loan_amnt
FROM
    finance_1;
    
select  distinct year(issue_d) from finance_1;

select Year(issue_d) AS loan_year,
	   count(id) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    AVG(loan_amnt) AS avg_loan_amount,
    MAX(loan_amnt) AS max_loan_amount,
    MIN(loan_amnt) AS min_loan_amount
FROM
    Finance_1
GROUP BY
    loan_year
ORDER BY 
    loan_year;
    
/*2. KPI2. Grade and sub grade wise revol_bal*/

SELECT
    f1.grade,
    f1.sub_grade,
    SUM(f2.revol_bal) AS total_revol_bal
FROM
    finance_1 AS f1
JOIN
    finance_2 AS f2 ON f1.Id = f2.Id
GROUP BY
    f1.grade,
    f1.sub_grade
ORDER BY
    f1.grade,
    f1.sub_grade;
       
/*3. KPI3.Total Payment for Verified Status Vs Total Payment for Non Verified Status*/   
    
SELECT
	f1.verification_status, 
    round(sum(total_pymnt),2)
FROM
    finance_1  AS f1
JOIN 
    finance_2 AS f2 ON f1.id = f2.id
GROUP BY
   f1.verification_status
ORDER BY
   f1.verification_status;


/*4. KPI4 State wise and last_credit_pull_d wise loan status*/
SELECT
    f1.addr_state,
    f1.loan_status,
    f2.last_credit_pull_d,
    COUNT(*) AS loan_count
FROM
    finance_1 AS f1
JOIN
    finance_2 AS f2 ON f1.Id = f2.Id
GROUP BY
    f1.addr_state,
    f1.loan_status,
    f2.last_credit_pull_d
ORDER BY
    f1.addr_state,
    f1.loan_status,
    f2.last_credit_pull_d;
    
  /*5. KPI5 Home ownership Vs last payment date stats*/  
    
SELECT
	f1.home_ownership, 
    COUNT(last_pymnt_d)
FROM 
	finance_1 AS f1
JOIN 
    finance_2 AS f2 ON f1.id = f2.id
GROUP BY
    f1.home_ownership
ORDER BY 
	f1.home_ownership;