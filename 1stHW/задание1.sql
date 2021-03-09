/* Creating tables
   Acronyms:
   > DT - Dimension Table
   > FT - Fact Table */


Create Table DTSex(
    SexID INTEGER PRIMARY KEY AUTOINCREMENT,
    Sex varchar
);

Create Table DTYear(
    YearID INTEGER PRIMARY KEY AUTOINCREMENT, 
    Year date
);

Create Table DTCategory(
    CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name date
);

Create Table DTRegion(
    RegionID INTEGER PRIMARY KEY AUTOINCREMENT,  
    FullName varchar,
    ShortName varchar
);

Create Table DTCountry(
    CountryID INTEGER PRIMARY KEY AUTOINCREMENT,
    FullName varchar,
    ShortName varchar,
    Population float,
    GDPPerCap float,
    NetMigaration float,
    Climate int,
    BirthRate float,
    Deathrate float,
    PhonesPer1000 float,
    IndustryRate float,
    RegionID int  REFERENCES DTRegion(RegionID)
);

Create Table DTOrganization(
  OrganizationID INTEGER PRIMARY KEY AUTOINCREMENT,
  Name varchar,
  CityID int  REFERENCES DTCity(CityID)
);

Create Table FTNoblePrizeWinners(
  LaureateID INTEGER NOT NULL,
  PrizeID INTEGER NOT NULL,
  OrganizationID INTEGER NOT NULL,
  PRIMARY KEY (LaureateID,PrizeID,OrganizationID), 
  FOREIGN KEY (LaureateID) REFERENCES DTLaureate(LaureateID),  
  FOREIGN KEY (PrizeID) REFERENCES DTPrize(PrizeID),  
  FOREIGN KEY (OrganizationID) REFERENCES DTOrganization(OrganizationID)  

);

Create Table DTLaureate(
  LaureateID INTEGER PRIMARY KEY AUTOINCREMENT,  
  FullName varchar,
  BirthDate date,
  DeathDate date,
  SexID int NOT NULL,
  BirthCityID int NOT NULL,
  FOREIGN KEY (SexID) REFERENCES DTSex(SexID),
  FOREIGN KEY (BirthCityID) REFERENCES DTCity(CityID)
);

Create Table DTPrize(
    PrizeID INTEGER PRIMARY KEY AUTOINCREMENT,
    PrizeName varchar,
    Motivation varchar,
    PrizeShare varchar,
    YearID int,
    CategoryID int,
    FOREIGN KEY (YearID) REFERENCES DTYear(YearID),
    FOREIGN KEY (CategoryID) REFERENCES DTCategory(CategoryID)
);

Create Table DTCity(
    CityID INTEGER PRIMARY KEY AUTOINCREMENT, 
    FullName varchar,
    ShortName varchar,
    Population float,
    Lat float,
    Lon float,
    CountryID int,
    FOREIGN KEY (CountryID) REFERENCES DTCountry(CountryID)
);


