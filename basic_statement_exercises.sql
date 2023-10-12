use albums_db; describe albums;
-- What is the primary key for the albums table? id
-- What does the column named 'name' represent? album name
-- What do you think the sales column represents? Dollar amount of sales
select name, artist from albums; 
-- Find the name of all albums by Pink Floyd. The Wall, The Dark Side of the Moon
-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released? 1967
describe albums;
select name, release_date from albums;
-- What is the genre for the album Nevermind? Grunge, Alternative rock
select genre, name from albums;
select genre, name from albums where name = 'Nevermind';
-- Which albums were released in the 1990s?
-- 'The Bodyguard','1992'
-- 'Jagged Little Pill','1995'
-- 'Come On Over','1997'
-- 'Falling into You','1996'
-- 'Let\'s Talk About Love','1997'
-- 'Dangerous','1991'
-- 'The Immaculate Collection','1990'
-- 'Titanic: Music from the Motion Picture','1997'
-- 'Metallica','1991'
-- 'Nevermind','1991'
-- 'Supernatural','1999'
select name, release_date from albums where release_date between 1990 and 1999;
-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
-- Low Selling Albums
-- 'Grease: The Original Soundtrack from the Motion Picture','14.4'
-- 'Bad','19.3'
-- 'Sgt. Pepper\'s Lonely Hearts Club Band','13.1'
-- 'Dirty Dancing','17.9'
-- 'Let\'s Talk About Love','19.3'
-- 'Dangerous','16.3'
-- 'The Immaculate Collection','19.4'
-- 'Abbey Road','14.4'
-- 'Born in the U.S.A.','19.6'
-- 'Brothers in Arms','17.7'
-- 'Titanic: Music from the Motion Picture','18.1'
-- 'Nevermind','16.7'
-- 'The Wall','17.6'
select name as Low_Selling_Albums, sales from albums where sales < 20;
