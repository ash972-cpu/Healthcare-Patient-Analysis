create database healthcare;
use healthcare;

create table Diagnosis(
DiagnosisID int primary key,
DiagnosisName VARCHAR (255)
);
create table Outcomes(
OutcomeID int primary key,
OutcomeName VARCHAR(255)
);
create table Patients(
PatientID int primary key,
Name varchar(255),
Age int,
Gender char(1),
DiagnosisID int,
AdmissionDate Date,
DischargeDate date,
OutcomeID int,
TreatmentCost decimal(10,2),
foreign key (DiagnosisID) references Diagnosis(DiagnosisID),
foreign key (OutcomeID) references Outcomes(OutcomeID));

create table Labs(
LabID int primary key,
PatientID int,
TestName VARCHAR(255),
Result decimal(10,2),
NormalRange varchar(255),
foreign key (patientID) references Patients(PatientID)
);
select * from patients;
select * from diagnosis;
select * from outcomes;
select * from labs;

-- Retrieve Detailed patient lab history
select p.patientID,p.name,d.diagnosisname,o.outcomename,l.testname,l.result,l.normalrange
from patients p
join diagnosis d on p.diagnosisid = d.diagnosisid
join outcomes o on p.outcomeid = o.outcomeid
join labs l on p.patientid = l.patientid
order by p.patientid , l.testname;  

-- Average lab results by diagnosis
select d.diagnosisname,l.testname,avg(l.result)  as AvgResult
from patients p
join diagnosis d on p.diagnosisid = d.diagnosisid
join labs l on p.patientid = l.patientid
group by d.diagnosisname,l.testname;

select p.patientid,p.name, count(*) as Abnormalcount
from patients p
join labs on p.patientid = l.patientid
where (l.testname = "Blood Sugar" and l.result >120)or
(l.testname = "Cholesterol" and l.result > 200) or
(l.testname = "Hemoglobin" and l.result < 13) 
group by p.patientid , p.name
order by Abnormalcount desc;

-- diagnosis with highest treatment cost
select d.diagnosisname, sum(p.treatmentcost) as totalcost
from patients p
join diagnosis d on p.diagnosisid = d.diagnosisid
group by d.diagnosisname 
order by TotalCost Desc;

-- Patients at risk by age and gender 
select p.patientid, p.name, p.age , d.diagnosisname, o.outcomename 
from patients p
join diagnosis d on p.diagnosisid = d.diagnosisid
join outcomes o on p.outcomeid = o.outcomeid
where p.age >65 and o.outcomename != 'Recovered';

-- lab trends over time for a specific patient 
select l.TestName , l.Result , p.AdmissionDate
from Labs  l 
join patients p on l.patientid = p.patientid
where p.patientid in (2,4,6,7,8,9)
order by p.admissiondate ;

-- Distribution of Outcome by diagnosis 
select d.diagnosisname, o.outcomename , count(*) as Outcomecount
from patients p
join diagnosis d on p.diagnosisid = d.diagnosisid
join outcomes o on p.outcomeid = o.outcomeid
group by d.diagnosisname , o.outcomename
order by d.diagnosisname , o.outcomename desc ;


