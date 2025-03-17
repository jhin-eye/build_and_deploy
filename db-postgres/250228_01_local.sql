-- board name 추가
alter table post add column board_name_eng varchar(255) null;
-- 기존 post update
update post p set board_name_eng = b.board_name_eng
from board b
where p.board_id = b.board_id;

delete from post where board_name_eng is null;
--not null화
alter table post alter column board_name_eng set not null;

alter table board add column page_size int not null default 10;

delete from map_member_post m where m.post_id not in (select post_id from post);