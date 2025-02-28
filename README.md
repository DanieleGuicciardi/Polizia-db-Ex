# Polizia-db-Ex

This project consists of an SQL database designed to manage police reports and fines issued by the Municipal Police. The database includes three main tables:

- **ANAGRAFICA**: Stores personal details of individuals fined.
- **TIPO_VIOLAZIONE**: Contains different types of traffic violations.
- **VERBALE**: Records fines issued, including details of the violation, the officer involved, and the penalty imposed.

## Features

- Proper use of primary and foreign keys to ensure data integrity.
- Constraints to enforce rules on values (e.g., penalty points cannot exceed 10).
- Preloaded data for testing and analysis.
- SQL queries to retrieve useful information, including:
  - Total fines issued.
  - Fines grouped by individual or violation type.
  - Total penalty points per individual.
  - Queries based on city, date range, and fine amount.
  - Aggregated data on fines issued by each officer.
  - Average fine amounts per violation type.

This database is implemented in SQL Server and can be executed in SSMS (SQL Server Management Studio).

