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
('Rossi', 'Mario', 'Via Roma 10', 'Milano', '20100', 'RSSMRA80A01F205X'),    --Dati creati da chatgpt
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
('Eccesso di velocità'),
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
(6, 6, '2025-02-18', 'Piazza Dante 9', 'Agente Russo', '2025-02-19', 250.00, 0),
(7, 7, '2025-02-20', 'Via Torino 7', 'Agente Colombo', '2025-02-21', 500.00, 10),
(8, 8, '2025-02-25', 'Viale Europa 22', 'Agente Moretti', '2025-02-26', 450.00, 8),
(9, 9, '2025-03-01', 'Via delle Rose 12', 'Agente Galli', '2025-03-02', 350.00, 7),
(10, 10, '2025-03-05', 'Corso Vittorio 8', 'Agente Fontana', '2025-03-06', 400.00, 5);
