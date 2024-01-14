use zillow;
select * from propertylandusetype;
select fips, sum(fips) cnt from properties_2017
group by fips;
select fips, sum(fips) cnt from properties_2017
group by fips;
select
	bedroomcnt, bathroomcnt,calculatedfinishedsquarefeet, taxvaluedollarcnt,
	yearbuilt, taxamount, fips, garagecarcnt, poolcnt
    from properties_2017
    join propertylandusetype using (propertylandusetypeid)
    where propertylandusedesc in ('Single Family Residential') 
	and bedroomcnt > 0 and bathroomcnt > 0
    ;
    
select storydesc, count(storydesc) from storytype
join properties_2017 using (storytypeid)
join propertylandusetype using (propertylandusetypeid)
where propertylandusedesc in ('Single Family Residential')
	group by storydesc;
    
select fireplaceflag from properties_2017;

select fireplaceflag, count(fireplaceflag) cnt, 
	avg(taxvaluedollarcnt) cost  from properties_2017
	group by fireplaceflag;

select hashottuborspa, count(hashottuborspa) cnt, 
	avg(taxvaluedollarcnt) cost from properties_2017
	group by hashottuborspa;
select count(yardbuildingsqft17) cnt, yardbuildingsqft17 from properties_2017
	group by yardbuildingsqft17;
select latitude, longitude from properties_2017;
select * from properties_2017;
select bathroomcnt, calculatedfinishedsquarefeet from properties_2017
	where bathroomcnt > 0
    order by bathroomcnt;

