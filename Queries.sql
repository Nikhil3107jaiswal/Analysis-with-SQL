-- 3. Select only the names of all Bands from the songs table
SELECT 
     distinct b.name
FROM
    bands b
        JOIN
    albums a ON b.id = a.band_id
        JOIN
    songs s ON a.id = s.album_id;
    
-- 4. Select the oldest album.
SELECT 
    name, release_year
FROM
    albums
WHERE
    release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;

-- 5. Get all the bands that have albums
SELECT DISTINCT
    b.name
FROM
    bands b
        JOIN
    albums a ON b.id = a.band_id;
    
-- 6. Get all the bands that have no albums
SELECT b.name
FROM
    bands b
        left JOIN
    albums a ON b.id = a.band_id
    where a.band_id is null;
    
-- 7. Get the longest album
SELECT 
    a.name, SUM(s.length) AS total_duration
FROM
    albums a
        JOIN
    songs s ON a.id = s.album_id
GROUP BY a.name
ORDER BY total_duration DESC
LIMIT 1;
    
-- 8. Insert a record for your favorite Band and one of their Albums
INSERT INTO songs(name,length,album_id) VALUES('The DEMO',6+(48/60),2);

-- 9. Delete the Band and Album you added in previous question.
delete from songs where id= 183;

-- 10. get the Average length of all songs
SELECT 
    AVG(length) AS AVg_Lenghth
FROM
    songs;
    
-- 11. Select the longest song of each album
SELECT a.name AS album_name,
    s.name AS song_name, s.length
    FROM
albums a join 
    songs s on a.id = s.album_id
    where s.length = (SELECT 
    max(s1.length)
FROM songs s1
where s1.album_id = a.id)
order by a.name;

-- 12. Get the number of songs for each band
select b.name, count(s.name) as total_songs
from bands b 
join albums a on b.id = a.band_id
join songs s on a.id = s.album_id
group by b.name;

-- 13. Create a decade column with dividing the year // 10 *10.
select (release_year div 10) * 10 as decade from albums;

-- 14. Filter the Albums which start with the word 'The'
select  * from albums where name like 'The%';

-- 15. Find the album which released in 2008 to 2013.
select * from albums where release_year >= 2008 and release_year <= 2013;