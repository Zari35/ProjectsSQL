USE [PortfolioProject]
GO
/****** Object:  Table [dbo].[CovidDeaths]    Script Date: 2/21/2023 12:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CovidDeaths](
	[iso_code] [nvarchar](255) NULL,
	[continent] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[population] [float] NULL,
	[total_cases] [float] NULL,
	[new_cases] [float] NULL,
	[new_cases_smoothed] [float] NULL,
	[total_deaths] [nvarchar](255) NULL,
	[new_deaths] [nvarchar](255) NULL,
	[new_deaths_smoothed] [nvarchar](255) NULL,
	[total_cases_per_million] [float] NULL,
	[new_cases_per_million] [float] NULL,
	[new_cases_smoothed_per_million] [float] NULL,
	[total_deaths_per_million] [nvarchar](255) NULL,
	[new_deaths_per_million] [nvarchar](255) NULL,
	[new_deaths_smoothed_per_million] [nvarchar](255) NULL,
	[reproduction_rate] [nvarchar](255) NULL,
	[icu_patients] [nvarchar](255) NULL,
	[icu_patients_per_million] [nvarchar](255) NULL,
	[hosp_patients] [nvarchar](255) NULL,
	[hosp_patients_per_million] [nvarchar](255) NULL,
	[weekly_icu_admissions] [nvarchar](255) NULL,
	[weekly_icu_admissions_per_million] [nvarchar](255) NULL,
	[weekly_hosp_admissions] [nvarchar](255) NULL,
	[weekly_hosp_admissions_per_million] [nvarchar](255) NULL,
	[total_tests] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CovidVaccinations]    Script Date: 2/21/2023 12:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CovidVaccinations](
	[iso_code] [nvarchar](255) NULL,
	[continent] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[total_cases] [float] NULL,
	[new_tests] [nvarchar](255) NULL,
	[total_tests_per_thousand] [nvarchar](255) NULL,
	[new_tests_per_thousand] [nvarchar](255) NULL,
	[new_tests_smoothed] [nvarchar](255) NULL,
	[new_tests_smoothed_per_thousand] [nvarchar](255) NULL,
	[positive_rate] [nvarchar](255) NULL,
	[tests_per_case] [nvarchar](255) NULL,
	[tests_units] [nvarchar](255) NULL,
	[total_vaccinations] [nvarchar](255) NULL,
	[people_vaccinated] [nvarchar](255) NULL,
	[people_fully_vaccinated] [nvarchar](255) NULL,
	[total_boosters] [nvarchar](255) NULL,
	[new_vaccinations] [nvarchar](255) NULL,
	[new_vaccinations_smoothed] [nvarchar](255) NULL,
	[total_vaccinations_per_hundred] [nvarchar](255) NULL,
	[people_vaccinated_per_hundred] [nvarchar](255) NULL,
	[people_fully_vaccinated_per_hundred] [nvarchar](255) NULL,
	[total_boosters_per_hundred] [nvarchar](255) NULL,
	[new_vaccinations_smoothed_per_million] [nvarchar](255) NULL,
	[new_people_vaccinated_smoothed] [nvarchar](255) NULL,
	[new_people_vaccinated_smoothed_per_hundred] [nvarchar](255) NULL,
	[stringency_index] [float] NULL,
	[population_density] [float] NULL,
	[median_age] [float] NULL,
	[aged_65_older] [float] NULL,
	[aged_70_older] [float] NULL,
	[gdp_per_capita] [float] NULL,
	[extreme_poverty] [nvarchar](255) NULL,
	[cardiovasc_death_rate] [float] NULL,
	[diabetes_prevalence] [float] NULL,
	[female_smokers] [nvarchar](255) NULL,
	[male_smokers] [nvarchar](255) NULL,
	[handwashing_facilities] [float] NULL,
	[hospital_beds_per_thousand] [float] NULL,
	[life_expectancy] [float] NULL,
	[human_development_index] [float] NULL,
	[excess_mortality_cumulative_absolute] [nvarchar](255) NULL,
	[excess_mortality_cumulative] [nvarchar](255) NULL,
	[excess_mortality] [nvarchar](255) NULL,
	[excess_mortality_cumulative_per_million] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NashvilleHousing]    Script Date: 2/21/2023 12:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NashvilleHousing](
	[UniqueID ] [float] NULL,
	[ParcelID] [nvarchar](255) NULL,
	[LandUse] [nvarchar](255) NULL,
	[SalePrice] [float] NULL,
	[LegalReference] [nvarchar](255) NULL,
	[SoldAsVacant] [nvarchar](255) NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Acreage] [float] NULL,
	[LandValue] [float] NULL,
	[BuildingValue] [float] NULL,
	[TotalValue] [float] NULL,
	[YearBuilt] [float] NULL,
	[Bedrooms] [float] NULL,
	[FullBath] [float] NULL,
	[HalfBath] [float] NULL,
	[SaleDateConverted] [date] NULL,
	[PropertySplitAddress] [nvarchar](255) NULL,
	[PropertySplitCity] [nvarchar](255) NULL,
	[OwnerSplitAddress] [nvarchar](255) NULL,
	[OwnerSplitCity] [nvarchar](255) NULL,
	[OwnerSplitState] [nvarchar](255) NULL
) ON [PRIMARY]
GO
