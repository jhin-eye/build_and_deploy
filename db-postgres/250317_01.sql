-- post 요청시 헤더 필요하면 넣는 컬럼 추가
alter table post add column header_parameters text null;
