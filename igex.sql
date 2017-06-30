Select username 
from users
left join photos
    on users.id = photos.user_id
    where photos.image_url is null;
    
--most pop photo
select image_url, count(likes) from photos
join likes 
    on photos.id = likes.photo_id;
    
--avgposts
select count(distinct users.id), count(image_url) from users
left join photos
    on users.id = photos.user_id;
    
--5 most pop hashtags
select tag_id, count(photo_id), tag_name
from photo_tags
join tags
    on photo_tags.tag_id = tags.id
group by tags.id
order by count(photo_id) desc
limit 5;

select username 
from users
join likes
    on users.id = likes.user_id
    ;
