SELECT 
O.Name as OrgName,
C.FullName as OrgCItyFullName,
C.Population as OrgCityPopulation,
C.Lat as OrgCityLat,
C.Lon as OrgCityLon,
CNRY.FullName as OrgCountryName,
CNRY.Climate as OrgCountryClimate,
CNRY.Population as ORgCountryPopulation,
CNRY.NetMigaration as OrgCountryNetMigration,
CNRY.DeathRate as OrgCountryDeathRate,
CNRY.BirthRate as OrgCountryBirthRate,
CNRY.IndustryRate as OrgCountryIndustryRate,
S.Sex as LaureateSex,
CAT.Name as WinningCategory,
Y.Year as WinningYear
FROM FTNoblePrizeWinners AS W 
LEFT JOIN DTOrganization AS O ON O.OrganizationID=W.OrganizationID
LEFT JOIN DTCity AS C ON O.CityID=C.CityID
LEFT JOIN DTCountry as CNRY ON C.CountryID=CNRY.CountryID
LEFT JOIN DTRegion as R ON R.RegionID=CNRY.RegionID
LEFT JOIN DTLaureate AS LRT ON W.LaureateID=LRT.LaureateID
LEFT JOIN DTSex AS S ON S.SexID=LRT.SexID
LEFT JOIN DTPrize as P on W.PrizeID=P.PrizeID
LEFT JOIN DTCategory AS CAT on CAT.CategoryID=P.CategoryID
LEFT JOIN DTYear as Y on Y.YearID=P.YearID;
