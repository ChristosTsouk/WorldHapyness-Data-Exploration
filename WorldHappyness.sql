--Looking at Freedom Data on a scale of 1-10 (1 least freedom - 10 most freedom)

Select year, country, human_freedom
From WorldHappyness..Freedom
Order by year desc, human_freedom desc


Select year, country, economic_freedom
From WorldHappyness..Freedom
Order by year desc, economic_freedom desc

Select year, AVG(human_freedom) as avg_human_freedom, AVG(economic_freedom) as avg_economic_freedom
From WorldHappyness..Freedom
Group by year
Order by year

Select country, AVG(human_freedom) as avg_human_freedom, AVG(economic_freedom) as avg_economic_freedom
From WorldHappyness..Freedom
Group by country
Order by avg_human_freedom desc





--Looking at Healthy Life Expectancy Data in years 

Select Location, Period, Gender, healthy_life_expectancy
From WorldHappyness..healthy_life_expectancy
Where Gender like 'Both sexes'
Order by Period desc, healthy_life_expectancy desc

--Time series HLE graph

Select Location, Period, healthy_life_expectancy
From WorldHappyness..healthy_life_expectancy
Where Gender like 'Both sexes'
Order by Period desc, healthy_life_expectancy desc


--Gender HLE graph

Select Location, Period, Gender, healthy_life_expectancy
From WorldHappyness..healthy_life_expectancy
Where Gender not like 'Both sexes'
Order by Period desc, healthy_life_expectancy desc

--Global stats(HLE time series)

Select Period, AVG(healthy_life_expectancy)
From WorldHappyness..healthy_life_expectancy
Where Gender like 'Both sexes'
Group by period
Order by period

--Global stats(by Gender)

Select Gender, AVG(healthy_life_expectancy)
From WorldHappyness..healthy_life_expectancy
Where Gender not like 'Both sexes'
Group by Gender


--Looking at Perceived Corruption Data from a scale of 0-100 (0 highly corrupted - 100 clean)

Select country, AVG(CPI) as avg_world_corruption
From WorldHappyness..Corruption
Group by country
Order by AVG(CPI) 

Select year, AVG(CPI) as avg_world_corruption
From WorldHappyness..Corruption
Group by year
Order by year


--Looking at Real GDP per capita 

Select country, AVG(real_gdp_per_capita) as avg_productivity_country
From WorldHappyness..real_gdp_per_capita
Group by country
Order by avg_productivity_country desc


Select year, AVG(real_gdp_per_capita) as avg_productivity_world
From WorldHappyness..real_gdp_per_capita
Group by year
Order by year desc




--Freedom vs HLE

Select fre.year, hle.location, fre.human_freedom, fre.economic_freedom, hle.healthy_life_expectancy, hle.gender
From WorldHappyness..Freedom fre
Join WorldHappyness..healthy_life_expectancy hle
		On hle.period = fre.year
		and hle.location = fre.country
Where Gender like 'Both sexes'
Order by fre.year desc, hle.location