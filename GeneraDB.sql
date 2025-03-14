CREATE DATABASE PoliziaMunicipale;
GO

USE PoliziaMunicipale;
GO

CREATE TABLE ANAGRAFICA (
    idanagrafica INT IDENTITY(1,1) PRIMARY KEY,
    Cognome VARCHAR(50) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Indirizzo VARCHAR(100) NOT NULL,
    Citta VARCHAR(50) NOT NULL,
    CAP CHAR(5) NOT NULL,
    Cod_Fisc CHAR(16) UNIQUE NOT NULL
);

CREATE TABLE TIPO_VIOLAZIONE (
    idviolazione INT IDENTITY(1,1) PRIMARY KEY,
    descrizione VARCHAR(255) NOT NULL
);

CREATE TABLE VERBALE (
    idverbale INT IDENTITY(1,1) PRIMARY KEY,
    idanagrafica INT NOT NULL,
    idviolazione INT NOT NULL,
    DataViolazione DATE NOT NULL,
    IndirizzoViolazione VARCHAR(100) NOT NULL,
    Nominativo_Agente VARCHAR(100) NOT NULL,
    DataTrascrizioneVerbale DATE NOT NULL,
    Importo DECIMAL(10,2) NOT NULL,
    DecurtamentoPunti INT CHECK (DecurtamentoPunti >= 0 AND DecurtamentoPunti <= 10),
    FOREIGN KEY (idanagrafica) REFERENCES ANAGRAFICA(idanagrafica) ON DELETE CASCADE,
    FOREIGN KEY (idviolazione) REFERENCES TIPO_VIOLAZIONE(idviolazione) ON DELETE CASCADE
);

INSERT INTO ANAGRAFICA (Cognome, Nome, Indirizzo, Citta, CAP, Cod_Fisc) VALUES
('Rossi', 'Mario', 'Via Roma 10', 'Milano', '20100', 'RSSMRA80A01F205X'),
('Bianchi', 'Luigi', 'Via Milano 20', 'Torino', '10100', 'BNCLGU75B02L219X'),
('Verdi', 'Anna', 'Viale Italia 5', 'Napoli', '80100', 'VRDANN85C03N220Y'),
('Esposito', 'Giovanni', 'Corso Garibaldi 3', 'Roma', '00100', 'ESPJGV79D04H501W'),
('Ferrari', 'Marco', 'Via Veneto 45', 'Firenze', '50100', 'FRRMRC90E12L219Z'),
('Russo', 'Paolo', 'Piazza Dante 9', 'Genova', '16100', 'RSSPLV85H17G273Y'),
('Colombo', 'Sara', 'Via Torino 7', 'Bologna', '40100', 'CLMSRA92L08B202Y'),
('Moretti', 'Elena', 'Viale Europa 22', 'Venezia', '30100', 'MRTLNE88F09V256X'),
('Galli', 'Francesco', 'Via delle Rose 12', 'Bari', '70100', 'GLLFNC78D15B123Y'),
('Fontana', 'Giorgia', 'Corso Vittorio 8', 'Palermo', '90100', 'FNTGRG81L22P567X');

INSERT INTO TIPO_VIOLAZIONE (descrizione) VALUES
('Eccesso di velocit�'),
('Divieto di sosta'),
('Guida senza cintura'),
('Semaforo rosso'),
('Utilizzo del cellulare alla guida'),
('Mancata revisione del veicolo'),
('Guida in stato di ebbrezza'),
('Assenza di assicurazione'),
('Circolazione contromano'),
('Mancato rispetto della distanza di sicurezza');

INSERT INTO VERBALE (idanagrafica, idviolazione, DataViolazione, IndirizzoViolazione, Nominativo_Agente, DataTrascrizioneVerbale, Importo, DecurtamentoPunti) VALUES
(1, 1, '2025-02-01', 'Via Roma 15', 'Agente Galli', '2025-02-02', 150.00, 3),
(2, 2, '2025-02-05', 'Via Milano 30', 'Agente Bianchi', '2025-02-06', 80.00, 0),
(3, 3, '2025-02-10', 'Viale Italia 8', 'Agente Rossi', '2025-02-11', 100.00, 5),
(4, 4, '2025-02-12', 'Corso Garibaldi 3', 'Agente Esposito', '2025-02-13', 200.00, 4),
(5, 5, '2025-02-15', 'Via Veneto 45', 'Agente Ferrari', '2025-02-16', 300.00, 6),
(6, 6, '2009-03-10', 'Piazza Dante 9', 'Agente Russo', '2009-03-11', 250.00, 2),
(7, 7, '2009-05-20', 'Via Torino 7', 'Agente Colombo', '2009-05-21', 500.00, 8),
(8, 8, '2009-06-15', 'Viale Europa 22', 'Agente Moretti', '2009-06-16', 450.00, 5),
(9, 9, '2009-07-01', 'Via delle Rose 12', 'Agente Galli', '2009-07-02', 350.00, 4),
(10, 10, '2009-02-05', 'Corso Vittorio 8', 'Agente Fontana', '2009-02-06', 400.00, 3),
(1, 1, '2009-04-12', 'Via Roma 15', 'Agente Galli', '2009-04-13', 120.00, 2),
(2, 2, '2009-05-22', 'Via Milano 30', 'Agente Bianchi', '2009-05-23', 90.00, 1),
(3, 3, '2009-06-10', 'Viale Italia 8', 'Agente Rossi', '2009-06-11', 110.00, 4),
(4, 4, '2009-07-25', 'Corso Garibaldi 3', 'Agente Esposito', '2009-07-26', 200.00, 3),
(5, 5, '2009-02-28', 'Via Veneto 45', 'Agente Ferrari', '2009-03-01', 310.00, 5);
