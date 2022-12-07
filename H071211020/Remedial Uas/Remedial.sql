use sakila;

show tables;

-- NO. 2 (#YUH0102)

select CONCAT(a.first_name, ' ', a.last_name) as nama, count(f.film_id) as jumlah_film, group_concat(f.title) as judul_film
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where c.name in ('Sports', 'Action', 'Drama')
group by a.actor_id
order by jumlah_film desc;

-- NO. 4 (#AZH0201)
select l.name as bahasa, count(f.film_id) as jumlah_film
from language l
join film f on l.language_id = f.language_id
group by l.language_id;

-- NO. 7 (#ALM0201)
select c.name as category_name, count(f.film_id) as total_movies
from category c
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
group by c.category_id;