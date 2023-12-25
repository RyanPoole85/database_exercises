use zillow;
select * from propertylandusetype;
select fips, sum(fips) cnt from properties_2017
group by fips;
select fips, sum(fips) cnt from properties_2017
group by fips;
select
	bedroomcnt, bathroomcnt,calculatedfinishedsquarefeet, taxvaluedollarcnt,
	yearbuilt, taxamount, fips, numberofstories, garagecarcnt, poolcnt
    from properties_2017
    join propertylandusetype using (propertylandusetypeid)
    where propertylandusedesc in ('Single Family Residential') 
	and bedroomcnt > 0 and bathroomcnt > 0 and fips in ('6037')
    ;
    
select storydesc, count(storydesc) from storytype
join properties_2017 using (storytypeid)
join propertylandusetype using (propertylandusetypeid)
where propertylandusedesc in ('Single Family Residential')
	group by storydesc;
