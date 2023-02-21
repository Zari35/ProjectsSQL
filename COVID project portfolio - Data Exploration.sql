SELECT 
  * 
FROM 
  [PortfolioProject]..[CovidDeaths] 
  
  -- Select data that we are going to be using
SELECT 
  Location, 
  date, 
  total_cases, 
  new_cases, 
  total_deaths, 
  population 
FROM 
  [PortfolioProject]..[CovidDeaths] 
WHERE 
  continent is not null 
ORDER BY 
  Location, 
  date 
  
  -- Looking at Total Cases vs Total deaths
  -- Shows likelihood of dying if you contract Covid in your country
SELECT 
  [Location], 
  [date], 
  total_cases, 
  total_deaths, 
  (total_deaths / total_cases)* 100 as DeathPercentage 
FROM 
  [PortfolioProject]..[CovidDeaths] 
WHERE 
  [Location] = 'Denmark' 
ORDER BY 
  [Location], 
  [date] DESC 
  
  -- Looking at the Total cases vs Population
  -- Shows what percentage of population got Covid
SELECT 
  [Location], 
  [date], 
  total_cases, 
  [population], 
  (total_cases / [population])* 100 as PercentagePopulationInfected 
FROM 
  [PortfolioProject]..[CovidDeaths] 
WHERE 
  [Location] = 'Denmark' 
ORDER BY 
  [Location], 
  [date] DESC 
  
  -- Looking at Countries with Highest Infection Rate compared to Population
SELECT 
  [Location], 
  [population], 
  MAX(total_cases) as HighestInfection, 
  Max(
    (total_cases / [population])* 100
  ) as PercentagePopulationInfected 
FROM 
  [PortfolioProject]..[CovidDeaths] 
GROUP BY 
  [Location], 
  [population] 
ORDER BY 
  PercentagePopulationInfected DESC 
  
  -- Showing Countries with Highest Death Count per Population
SELECT 
  [Location], 
  MAX(
    cast(total_deaths as int)
  ) as TotaltDeathCount 
FROM 
  [PortfolioProject]..[CovidDeaths] 
WHERE 
  continent is not null 
GROUP BY 
  [Location] 
ORDER BY 
  TotaltDeathCount DESC 
  
  -- Break things down by continent 

  -- Showing continents with the highest death count per population
SELECT 
  continent, 
  MAX(
    cast(total_deaths as int)
  ) as TotaltDeathCount 
FROM 
  [PortfolioProject]..[CovidDeaths] 
WHERE 
  continent is not null 
GROUP BY 
  continent 
ORDER BY 
  TotaltDeathCount DESC 
  
  -- Global numbers
SELECT 
  SUM(new_cases) as TotalCases, 
  SUM(
    cast(new_deaths as float)
  ) as TotalDeaths, 
  (
    SUM(
      cast(new_deaths as float)
    )/ SUM(new_cases)
  )* 100 as DeathsPercentage 
FROM 
  [PortfolioProject]..[CovidDeaths] 
WHERE 
  continent is not null 
ORDER BY 
  DeathsPercentage DESC 

  /**/
  
  -- Looking at Total Population vs Vaccinations
SELECT 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(
    CONVERT(float, vac.new_vaccinations)
  ) OVER (
    Partition by dea.location 
    ORDER BY 
      dea.location, 
      dea.date
  ) as RollingPeopleVaccinated 
FROM 
  [PortfolioProject]..[CovidDeaths] dea 
  JOIN [PortfolioProject]..[CovidVaccinations] vac ON dea.location = vac.location 
  AND dea.date = vac.date 
WHERE 
  dea.continent is not null 
ORDER BY 
  Location, 
  date 
  
  -- USE CTE:
  WITH PopvsVac (
    Continent, Location, Date, Population, 
    new_vaccinations, RollingPeopleVaccinated
  ) as (
    SELECT 
      dea.continent, 
      dea.location, 
      dea.date, 
      dea.population, 
      vac.new_vaccinations, 
      SUM(
        CONVERT(float, vac.new_vaccinations)
      ) OVER (
        Partition by dea.location 
        ORDER BY 
          dea.location, 
          dea.date
      ) as RollingPeopleVaccinated 
    FROM 
      [PortfolioProject]..[CovidDeaths] dea 
      JOIN [PortfolioProject]..[CovidVaccinations] vac ON dea.location = vac.location 
      AND dea.date = vac.date 
    WHERE 
      dea.continent is not null
  ) 
SELECT 
  *, 
  (
    RollingPeopleVaccinated / population
  )* 100 AS PercentPopulationVaccinated 
FROM 
  PopvsVac 
  
  -- Using Temp Table to perform Calculation on Partition By in previous query:
DROP 
  Table if exists #PercentPopulationVaccinated
  Create Table #PercentPopulationVaccinated
  (
    Continent nvarchar(255), 
    Location nvarchar(255), 
    Date datetime, 
    Population numeric, 
    New_vaccinations numeric, 
    RollingPeopleVaccinated numeric
  ) Insert into #PercentPopulationVaccinated
Select 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(
    CONVERT(float, vac.new_vaccinations)
  ) OVER (
    Partition by dea.Location 
    Order by 
      dea.location, 
      dea.Date
  ) as RollingPeopleVaccinated 
From 
  PortfolioProject..CovidDeaths dea 
  Join PortfolioProject..CovidVaccinations vac On dea.location = vac.location 
  and dea.date = vac.date 
where 
  dea.continent is not null 
Select 
  *, 
  (
    RollingPeopleVaccinated / Population
  )* 100 AS PercentPopulationVaccinated 
From 
  #PercentPopulationVaccinated
 
  -- Creating View to store data for later visualizations
  Create View PercentPopulationVaccinated as 
Select 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(
    CONVERT(float, vac.new_vaccinations)
  ) OVER (
    Partition by dea.Location 
    Order by 
      dea.location, 
      dea.Date
  ) as RollingPeopleVaccinated
From 
  PortfolioProject..CovidDeaths dea 
  Join PortfolioProject..CovidVaccinations vac On dea.location = vac.location 
  and dea.date = vac.date 
where 
  dea.continent is not null 
SELECT 
  * 
FROM 
  PercentPopulationVaccinated