-- select 절은 MySQL 의 가장 기본적인 명령어로 특정 테이블에서 원하는 데이터를 조회할 수 있다.
SELECT
	menu_name
FROM tbl_menu;

SELECT 
	menu_code, 
    menu_name,
    menu_price
FROM tbl_menu;

SELECT
	menu_code,
    category_code,
    menu_price
FROM tbl_menu;

SELECT
	*
FROM tbl_menu;

SELECT now();

SELECT concat('이','','지은');

SELECT concat('이','지','은') as 내이름;
SELECT concat('이','지','은') as '내 이름';


