select *
from portfolioproject..CovidDeaths
where continent is not null
order by 3,4

--select *
--from portfolioproject..CovidVaccinations
--order by 3,4

select location, date, total_cases, new_cases, Total_deaths, population
from PortfolioProject..CovidDeaths
order by 1,2

--Looking at Total Cases vs Total Deaths
--Shows likelihood of dying if you contract covid in your country
select location, date, total_cases, Total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2

-- Looking at Total Cases vs Population
select location, date, population, Total_cases, (total_cases/population)*100 as CasesPercentage
from PortfolioProject..CovidDeaths
--where location like '%states%'
order by 1,2


-- Looking at Countries with Highest Infection Rate compared to Population
select location, population, max(Total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopultionInfected
from PortfolioProject..CovidDeaths
--where location like '%states%'
group by location, population 
order by PercentPopultionInfected desc


-- Showing Countries with the Highest Death Count per Population
select location, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not null
group by location 
order by TotalDeathCount desc

-- Showing Continent with the Highest Death Count per Population
select continent, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not null
group by continent 
order by TotalDeathCount desc


-- Global Numbers

select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not null
group by date
order by 1,2

select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not null
--group by date
order by 1,2


-- Looking at Total Population vs. Vaccinations

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as current_vaccinations
--(current_vaccinations/population)*100
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

--Use CTE

with PopvsVac (continent, location, date, population, New_Vaccinations, current_vaccinations) 
as
(select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as current_vaccinations
--(current_vaccinations/population)*100
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select *, (current_vaccinations/population)*100 as VaccinationsPercentage
From PopvsVac

--Temp Table
drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
current_vaccinations numeric,
)

insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as current_vaccinations
--(current_vaccinations/population)*100
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null
--order by 2,3

Select *, (current_vaccinations/population)*100 as VaccinationsPercentage
From #PercentPopulationVaccinated

-- Creating view to store data for later vizualizations

create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as current_vaccinations
--(current_vaccinations/population)*100
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as current_vaccinations
--(current_vaccinations/population)*100
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

select *
from PercentPopulationVaccinated