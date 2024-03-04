-- 09_set_operators

-- 두 개 이상의 select 문의 결과 집합을 결합하는데 사용한다.

-- union
-- 두개 이상의 select 문의 결과를 결합하여 중복된 레코드를 제거한 후 
-- 반환하는 sql 연산자이다.

-- 1
SELECT
	*
FROM
	tbl_menu
WHERE
	category_code = 10
UNION

-- 2 
SELECT
	*
FROM
	tbl_menu
WHERE
	menu_price < 9000;

-- union all
-- 두개 이상의 select 문의 결과를 결합하며 중복된 레코드를 제거하지 않고 모두 반환
-- 1
SELECT
	*
FROM
	tbl_menu
WHERE
	category_code = 10
UNION ALL

-- 2 
SELECT
	*
FROM
	tbl_menu
WHERE
	menu_price < 9000;
    
-- intersect
-- 두 select문의 결과 중 공통되는 레코드만 반환하는 sql 연산자이다.
-- mysql은 intersect를 제공하지 않음
-- inner join 또는 in 연산자를 활용해 구현 가능

-- innner join
-- 1 
SELECT
	menu_code,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu;

-- 2 
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price < 9000;
    
-- 결과
SELECT
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
FROM
	tbl_menu a
inner join
	(
    SELECT
		menu_code,
		menu_name,
		menu_price,
		category_code,
		orderable_status
	FROM
		tbl_menu
	WHERE
		menu_price < 9000
    ) b
	ON (a.menu_code = b.menu_code);