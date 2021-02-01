delete ImageLevelDescription;

insert into ImageLevelDescription (ImageLevel, Attribute, Description) values
(0, 'ImageLevel_0', 'No images'),
(1, 'ImageLevel_1', 'Dominant image (images >= 1)'),
(3, 'ImageLevel_3', 'Images >= 3'),
(5, 'ImageLevel_5', 'Images >= 5'),
(10, 'ImageLevel_10', 'Images >= 10')
