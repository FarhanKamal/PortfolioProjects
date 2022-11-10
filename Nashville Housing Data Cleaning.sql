/*

Cleaning Data in SQL Queries

*/

--Standardize Date Format

select SaleDate, CONVERT(date,saledate)
from PortfolioProject..NashvilleHousing

use PortfolioProject

Update NashvilleHousing
set SaleDate = CONVERT(Date,SaleDate)

alter table nashvillehousing
add SaleDateConverted Date;

Update NashvilleHousing
set SaleDateConverted = CONVERT(date,SaleDate)

select *
from NashvilleHousing


--Populate Property Address data

select * 
from PortfolioProject..NashvilleHousing
--where PropertyAddress is null
order by ParcelID

select a.parcelid, a.propertyaddress, b.parcelid, b.propertyaddress, isnull(a.propertyaddress,b.propertyaddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
	on a.parcelid = b.parcelid
	and a.[uniqueid ] <> b.[uniqueid ]
where a.PropertyAddress is null

update a 
set propertyaddress = ISNULL(a.propertyaddress,b.propertyaddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
	on a.parcelid = b.parcelid
	and a.[uniqueid ] <> b.[uniqueid ]
where a.PropertyAddress is null

--Breaking out Address into Individual Columns (Address, City, State)

select PropertyAddress 
from PortfolioProject..NashvilleHousing

select 
SUBSTRING(propertyaddress, 1, charindex(',', propertyaddress)) as Addresss
from PortfolioProject..NashvilleHousing

/* 

--Just shows that the charindex in just a value


select 
SUBSTRING(propertyaddress, 1, charindex(',', propertyaddress)) as Addresss,
charindex(',', propertyaddress)
from PortfolioProject..NashvilleHousing

*/

select 
SUBSTRING(PropertyAddress, 1, charindex(',', PropertyAddress) -1) as Addresss,
SUBSTRING(PropertyAddress, charindex(',', PropertyAddress) +1, len(PropertyAddress)) as City
from PortfolioProject..NashvilleHousing


alter table NashvilleHousing
add PropertyStreetAddress nvarchar(255);

update NashvilleHousing
set PropertyStreetAddress = SUBSTRING(PropertyAddress, 1, charindex(',', PropertyAddress) -1)

alter table NashvilleHousing
add PropertyCityAddress nvarchar(255);

update NashvilleHousing
set PropertyCityAddress = SUBSTRING(PropertyAddress, charindex(',', PropertyAddress) +1, len(PropertyAddress))

select *
from PortfolioProject..NashvilleHousing

/*

--Deleting and Organizing Unnecessary Columns

alter table NashvilleHousing
drop column propertysplitcity;

alter table NashvilleHousing
drop column propertysplitaddress;

alter table NashvilleHousing
drop column PropertyCity;
*/


select OwnerAddress
from PortfolioProject..NashvilleHousing


select 
PARSENAME(replace(owneraddress, ',', '.'), 3),
PARSENAME(replace(owneraddress, ',', '.'), 2),
PARSENAME(replace(owneraddress, ',', '.'), 1)
from PortfolioProject..NashvilleHousing

use PortfolioProject

alter table NashvilleHousing
add OwnerStreetAddress nvarchar(255);

update NashvilleHousing
set OwnerStreetAddress = PARSENAME(replace(owneraddress, ',', '.'), 3)

alter table NashvilleHousing
add OwnerCity nvarchar(255);

update NashvilleHousing
set OwnerCity = PARSENAME(replace(owneraddress, ',', '.'), 2)

alter table NashvilleHousing
add OwnerState nvarchar(255);

update NashvilleHousing
set OwnerState = PARSENAME(replace(owneraddress, ',', '.'), 1)

select *
from PortfolioProject..NashvilleHousing

alter table nashvillehousing
drop column ownercityaddress

-- Change Y and N to Yes and No in "Sold as Vacant" field

select distinct(SoldAsVacant), count(soldasvacant)
from PortfolioProject..NashvilleHousing
group by SoldAsVacant
order by 2

select SoldAsVacant,
case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end
from PortfolioProject..NashvilleHousing

update NashvilleHousing
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end

-- Remove Duplicates


with rownumcte as(
select *,
	ROW_NUMBER() over (
	partition by parcelid,
				 propertyaddress,
				 saleprice,
				 saledate,
				 legalreference
				 order by
					uniqueid)
					row_num
from PortfolioProject..NashvilleHousing
--order by ParcelID
)
select *
from rownumcte
where row_num > 1
order by PropertyAddress





with rownumcte as(
select *,
	ROW_NUMBER() over (
	partition by parcelid,
				 propertyaddress,
				 saleprice,
				 saledate,
				 legalreference
				 order by
					uniqueid)
					row_num
from PortfolioProject..NashvilleHousing
--order by ParcelID
)
delete 
from rownumcte
where row_num > 1
--order by PropertyAddress

select *
from NashvilleHousing


-- Deleting Unused Columns

alter table NashvilleHousing
drop column owneraddress, taxdistrict, Propertyaddress, saledate