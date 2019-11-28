CREATE TABLE squirrels(
	X_Coordinate numeric(16,13),
	Y_Coordinate numeric(16,13),
	Squirrel_ID varchar(14),
	Hectare varchar(3),
	Shift varchar(2),
	Date Date,
	Hectare_Squirrel_No smallint,
	Age varchar(8),
	Primary_Fur_Color varchar(8),
	Secondary_Fur_Color varchar(8),
	Combination_Fur_Color varchar(17),
	Color_Notes varchar(200),
	Location varchar(12),
	Above_Ground_Sighter_Measurement varchar(5),
	Specific_Location varchar(200),
	Running varchar(5),
	Chasing varchar(5),
	Climbing varchar(5),
	Eating varchar(5),
	Foraging varchar(5),
	Other_Activities varchar(200),
	Kuks varchar(5),
	Quaas varchar(5),
	Moans varchar(5),
	Tail_Flags varchar(5),
	Tail_Twitches varchar(5),
	Approaches varchar(5),
	Indifferent varchar(5),
	Runs_From varchar(5),
	Other_Interactions varchar(200),
	Lat_Long varchar(40),
	zipcodes varchar(5),
	Community_Districts varchar(3),
	Borough_Boundaries varchar(3),
	City_Council_Districts varchar(3), 
	Police_Precients varchar(3)

);


# Some of the data in the data source were entered strangely so things had to be altered, these strange data types will be cleaned up.
ALTER TABLE squirrels
ALTER COLUMN Date TYPE  varchar(8);

ALTER TABLE squirrels
ALTER COLUMN lat_long TYPE  varchar(45);

ALTER TABLE squirrels
ALTER COLUMN secondary_fur_color TYPE  varchar(30);

ALTER TABLE squirrels
ALTER COLUMN combination_fur_color TYPE  varchar(30);

ALTER TABLE squirrels
ALTER COLUMN zipcodes TYPE  varchar(6);

COPY squirrels(
	X_Coordinate,
	Y_Coordinate,
	Squirrel_ID,
	Hectare,
	Shift,
	Date,
	Hectare_Squirrel_No,
	Age,
	Primary_Fur_Color,
	Secondary_Fur_Color,
	Combination_Fur_Color,
	Color_Notes,
	Location,
	Above_Ground_Sighter_Measurement,
	Specific_Location,
	Running,
	Chasing,
	Climbing,
	Eating,
	Foraging,
	Other_Activities,
	Kuks,
	Quaas,
	Moans,
	Tail_Flags,
	Tail_Twitches,
	Approaches,
	Indifferent,
	Runs_From,
	Other_Interactions,
	Lat_Long,
	zipcodes,
	Community_Districts,
	Borough_Boundaries,
	City_Council_Districts, 
	Police_Precients
)
FROM '/Users/stephanie/Downloads/2018_Central_Park_Squirrel_Census_-_Squirrel_Data.csv' DELIMITER ',' CSV HEADER;

# Convert string type to date type
ALTER TABLE squirrels 
ALTER COLUMN date TYPE DATE using to_date(date, 'MMDDYYYY');

/* Deleted some columns because they weren't really needed.
All of the community districts, borough boundaries, city council district, and police precients ended up being the same value (19,4,19,13 respectively)
so I omitted them.
I also like to delete columns one by one so I can pinpoint any mistake I've made.
*/
ALTER TABLE squirrels
DROP COLUMN color_notes;


ALTER TABLE squirrels
DROP COLUMN Community_Districts;


ALTER TABLE squirrels
DROP COLUMN Borough_Boundaries;

ALTER TABLE squirrels
DROP COLUMN City_Council_Districts;

ALTER TABLE squirrels
DROP COLUMN police_precients;

# Done with our editing, let's export the data and move onto Tableau!

COPY squirrels
TO '/Users/stephanie/Downloads/squirrels.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');
