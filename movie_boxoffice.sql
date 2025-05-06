create  database boxoffice;
use boxoffice;
select * from  movie_com;
select * from  movie_det;

/* Show the list of movies released in 2020 */
select movie_name , release_date
from movie_det
where str_to_date(release_date , '%d-%b-%y')  between '2020-01-01' and '2020-12-31';

/* List the top 5 movies which grossed the highest collections across all years */
select movie_name , movie_total_worldwide
from movie_com
order by  movie_total_worldwide desc
limit 5;

/* List the name of the producers who has produced comedy movies in 2019 */

select  producer , movie_genre 
from movie_det
where movie_genre = "comedy" and year(str_to_date(release_date , '%d-%b-%y')) =  '2019';


/* Which movie in 2020 had the shortest duration */
select movie_name , runtime 
from movie_det
where year(str_to_date(release_date,'%d-%b-%y')) = '2020'
order by runtime  asc
limit 1;

/*  List the movie with the highest opening weekend.
 Is this the same movie which had the highest overall collection */
 
 select movie_name , movie_weekend
 from movie_com
 order by movie_opening desc
 limit 1;
 
  select movie_name ,  movie_total_worldwide
 from movie_com
 order by movie_total desc
 limit 1;
 
 /*it can be seen that movie with  total_worldwide and  movie_weekend are not same  */
 /* list the movies which had the weekend collection same as the first week collection */
 select movie_name  , movie_weekend ,movie_total_worldwide
 from movie_com
 where movie_total_worldwide = movie_weekend
 ;
 
 
/* List the top 3 movies with the highest foreign collection */
select movie_name , movie_total_worldwide
from movie_com
order by movie_total_worldwide desc
limit 3;


/* List the movies that were released on a non-weekend day */
select movie_name , dayname(str_to_date(release_date , '%d-%b-%y')) <> "saturday" or dayname(release_date) <> "sunday"  as new_dates
from movie_det
where dayname(str_to_date(release_date , '%d-%b-%y')) <> "saturday" or dayname(release_date) <> "sunday" 
;


/* List the movies by Reliance Entertainment which were non comedy */
select movie_name , banner , movie_genre
from movie_det
where banner = "Reliance Entertainment" and movie_genre <> "comedy";































