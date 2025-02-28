-- Es 1
SELECT COUNT(*) AS TotaleVerbali FROM VERBALE;

-- Es 2
SELECT idanagrafica, COUNT(*) AS TotaleVerbali FROM VERBALE GROUP BY idanagrafica;

-- Es 3
SELECT idviolazione, COUNT(*) AS TotaleVerbali FROM VERBALE GROUP BY idviolazione;

-- Es 4
SELECT idanagrafica, SUM(DecurtamentoPunti) AS TotalePuntiDecurtati FROM VERBALE GROUP BY idanagrafica;

-- Es 5
SELECT A.Cognome, A.Nome, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.DecurtamentoPunti 
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE A.Citta = 'Palermo';

-- Es 6
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti 
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE V.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31';

-- Es 7
SELECT idanagrafica, SUM(Importo) AS TotaleImporto FROM VERBALE GROUP BY idanagrafica;

-- Es 8
SELECT * FROM ANAGRAFICA WHERE Citta = 'Palermo';

-- Es 9
SELECT DataViolazione, Importo, DecurtamentoPunti FROM VERBALE WHERE DataViolazione = '2025-02-01';

-- Es 10
SELECT Nominativo_Agente, COUNT(*) AS TotaleViolazioni FROM VERBALE GROUP BY Nominativo_Agente;

-- Es 11
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti 
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE V.DecurtamentoPunti > 5;

-- Es 12
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti 
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE V.Importo > 400;

-- Es 13
SELECT Nominativo_Agente, COUNT(*) AS NumeroVerbali, SUM(Importo) AS ImportoTotale 
FROM VERBALE 
GROUP BY Nominativo_Agente;

-- Es 14
SELECT idviolazione, AVG(Importo) AS MediaImporto 
FROM VERBALE 
GROUP BY idviolazione;