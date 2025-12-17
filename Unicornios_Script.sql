ALTER TABLE dbo.ID_Continent
ADD CONSTRAINT PK_ID_Continent PRIMARY KEY (Id_Continent);

SELECT * FROM ID_Continent WHERE Id_Continent IS NULL;
SELECT Id_Continent, COUNT(*) 
FROM ID_Continent 
GROUP BY Id_Continent 
HAVING COUNT(*) > 1;

EXEC sp_columns 'ID_Continent';

aLTER TABLE dbo.ID_Continent
ALTER COLUMN Id_Continent INT NOT NULL;

ALTER TABLE dbo.ID_Continent
ADD CONSTRAINT PK_ID_Continent PRIMARY KEY (Id_Continent);
ALTER TABLE dbo.ID_Country
ALTER COLUMN Id_Country INT NOT NULL;
Alter table dbo.ID_Country
ADD CONSTRAINT PK_ID_COuntry PRIMARY KEY (ID_Country);
ALTER TABLE dbo.ID_City
ALTER COLUMN Id_City INT NOT NULL;
Alter table dbo.ID_City
ADD CONSTRAINT PK_ID_City PRIMARY KEY (ID_City);
ALTER TABLE dbo.ID_Industry
ALTER COLUMN Id_Industry INT NOT NULL;
Alter table dbo.ID_Industry
ADD CONSTRAINT PK_ID_Industry PRIMARY KEY (ID_Industry);

ALTER TABLE dbo.TB_Unicorns_2022
ADD CONSTRAINT FK_Unicorns_Continent
FOREIGN KEY (ID_Continent) REFERENCES dbo.ID_Continent(Id_Continent);

SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('TB_Unicorns_2022', 'ID_Continent', 'ID_Country', 'ID_City', 'ID_Industry')
  AND COLUMN_NAME LIKE 'ID_%'
ORDER BY TABLE_NAME, COLUMN_NAME;

ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_Continent INT NULL;
ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_Country   INT NULL;
ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_City      INT NULL;
ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_Industry  INT NULL;

ALTER TABLE dbo.TB_Unicorns_2022
ADD CONSTRAINT FK_Unicorns_Continent
FOREIGN KEY (ID_Continent) REFERENCES dbo.ID_Continent(Id_Continent);

ALTER TABLE dbo.TB_Unicorns_2022
ADD CONSTRAINT FK_Unicorns_Country
FOREIGN KEY (ID_Country) REFERENCES dbo.ID_Country(ID_Country);

ALTER TABLE dbo.TB_Unicorns_2022
ADD CONSTRAINT FK_Unicorns_City
FOREIGN KEY (ID_City) REFERENCES dbo.ID_City(ID_City);

ALTER TABLE dbo.TB_Unicorns_2022
ADD CONSTRAINT FK_Unicorns_Industry
FOREIGN KEY (ID_Industry) REFERENCES dbo.ID_Industry(ID_Industry);

SELECT 
    fk.name AS ForeignKey,
    OBJECT_NAME(fk.parent_object_id) AS TablaHija,
    c1.name AS ColumnaHija,
    OBJECT_NAME(fk.referenced_object_id) AS TablaPadre,
    c2.name AS ColumnaPadre
FROM 
    sys.foreign_keys fk
INNER JOIN 
    sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.columns c1 ON fkc.parent_column_id = c1.column_id AND fkc.parent_object_id = c1.object_id
INNER JOIN 
    sys.columns c2 ON fkc.referenced_column_id = c2.column_id AND fkc.referenced_object_id = c2.object_id
WHERE 
    OBJECT_NAME(fk.parent_object_id) = 'TB_Unicorns_2022';

    ALTER TABLE dbo.TB_Unicorns_2022 
DROP CONSTRAINT IF EXISTS FK_Unicorns_Industry;
ALTER TABLE dbo.TB_Unicorns_2022 
ALTER COLUMN ID_Industry INT NOT NULL;
ALTER TABLE dbo.TB_Unicorns_2022
ADD CONSTRAINT FK_Unicorns_Industry 
FOREIGN KEY (ID_Industry) REFERENCES dbo.ID_Industry(ID_Industry);

SELECT 
    TABLE_NAME, COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('ID_Continent', 'ID_Country', 'ID_City', 'ID_Industry')
  AND TABLE_NAME IN ('TB_Unicorns_2022', 'ID_Continent', 'ID_Country', 'ID_City', 'ID_Industry')
ORDER BY TABLE_NAME, COLUMN_NAME;

ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_Continent INT NOT NULL;
ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_Country   INT NOT NULL;
ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_City      INT NOT NULL;
ALTER TABLE dbo.TB_Unicorns_2022 ALTER COLUMN ID_Industry  INT NOT NULL;

ALTER TABLE dbo.TB_Unicorns_2022 DROP CONSTRAINT IF EXISTS FK_Unicorns_Continent;
ALTER TABLE dbo.TB_Unicorns_2022 DROP CONSTRAINT IF EXISTS FK_Unicorns_Country;
ALTER TABLE dbo.TB_Unicorns_2022 DROP CONSTRAINT IF EXISTS FK_Unicorns_City;
ALTER TABLE dbo.TB_Unicorns_2022 DROP CONSTRAINT IF EXISTS FK_Unicorns_Industry;

ALTER TABLE dbo.TB_Unicorns_2022 ADD CONSTRAINT FK_Unicorns_Continent 
    FOREIGN KEY (ID_Continent) REFERENCES dbo.ID_Continent(Id_Continent);

ALTER TABLE dbo.TB_Unicorns_2022 ADD CONSTRAINT FK_Unicorns_Country 
    FOREIGN KEY (ID_Country) REFERENCES dbo.ID_Country(ID_Country);

ALTER TABLE dbo.TB_Unicorns_2022 ADD CONSTRAINT FK_Unicorns_City 
    FOREIGN KEY (ID_City) REFERENCES dbo.ID_City(ID_City);

ALTER TABLE dbo.TB_Unicorns_2022 ADD CONSTRAINT FK_Unicorns_Industry 
    FOREIGN KEY (ID_Industry) REFERENCES dbo.ID_Industry(ID_Industry);