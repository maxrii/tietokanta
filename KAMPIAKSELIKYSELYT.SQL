SELECT FirstName AS Etunimi,
       LastName AS Sukunimi
FROM CUSTOMER;



SELECT *
FROM VEHICLE
WHERE Brand = 'Audi'
   OR Brand = 'Tesla';


SELECT *
FROM APPOINTMENT
WHERE Status = 'VALMIS'
  AND ServiceType = 'VIKA-ARVIO';


SELECT COUNT(*) AS AsiakkaidenMaara
FROM CUSTOMER;


SELECT AVG(Cost) AS KeskimaarainenHuollonHinta
FROM SERVICE;


SELECT SUM(Cost) AS HuoltojenKokonaishinta
FROM SERVICE;


SELECT MAX(Cost) AS KalleinHuolto
FROM SERVICE;


SELECT Brand,
       COUNT(*) AS AutojenMaara
FROM VEHICLE
GROUP BY Brand;


SELECT *
FROM SERVICE
ORDER BY Cost DESC;


SELECT C.FirstName,
       C.LastName,
       V.Brand,
       V.Model
FROM CUSTOMER C
JOIN VEHICLE V
ON C.CustomerID = V.CustomerID;
