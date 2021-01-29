remove AttributeImport;

insert into AttributeImport (Date, Attribute, AggCountValue, Region, Language, Category, Provider) values
('2020-12-15', 'Image', CAST(RAND(CHECKSUM(NEWID())) * 12 as int), 'us', 'en', 'retail', 'Tripadvisor')



