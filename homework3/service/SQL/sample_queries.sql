-- get all registered (not received) packages in the SE desk since November
SELECT * 
FROM Package 
WHERE EnteredTime > '2020-11-1 00:00:00' 
AND Building = 'SE'
AND State = 'Registered'
ORDER BY EnteredTime DESC;

-- get all received packages assigned to ajf34
SELECT *
FROM Package
WHERE Recipient = 'ajf34'
AND State = 'Received'
ORDER BY EnteredTime DESC;

-- get all Deskies
SELECT *
FROM PERSON
WHERE Role = 'Deskie'
OR Role = 'Both'
ORDER BY BuildingCode;

-- get all packages for Eldersveld
SELECT Recipient, emailPrefix, firstname, lastname, ResidentRoom
FROM Package, Person
WHERE ResidentHall = 'EL'
ORDER BY ReceivedTime;