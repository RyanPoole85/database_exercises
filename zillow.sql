use zillow;
select * from propertylandusetype;
select
	bedroomcnt, bathroomcnt,calculatedfinishedsquarefeet, taxvaluedollarcnt,
	yearbuilt, taxamount, fips, storydesc
    from properties_2017
    join propertylandusetype using (propertylandusetypeid)
    join storytype using (storytypeid)
    where propertylandusedesc in ('Single Family Residential')
    group by storydesc;
    
select storydesc, count(storydesc) from storytype
join properties_2017 using (storytypeid)
join propertylandusetype using (propertylandusetypeid)
where propertylandusedesc in ('Single Family Residential')
	group by storydesc;