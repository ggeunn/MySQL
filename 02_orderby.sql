-- order by
-- 결과 집합을 특정 열이나 열들의 값에 따라 정렬하는데 사용

SELECT
	menu_code,
    menu_name,
    menu_price
FROM 
	tbl_menu
ORDER BY		 -- asc 기본값
	menu_price;  -- asc 는 오름차순, desc 는 내림차순 
    

SELECT
	menu_code,
    menu_name,
    menu_price
FROM 
	tbl_menu
ORDER BY		
	menu_price DESC;
    
SELECT
	menu_code,
    menu_name,
	menu_price
FROM tbl_menu
ORDER BY  menu_name DESC;

SELECT
	menu_code,
    menu_name,
    menu_price
FROM 
	tbl_menu
ORDER by
	menu_price desc,
    menu_name asc;
    
-- order by 절을 사용하여 연산 결과로 결과 집합 정렬
SELECT
	menu_code,
    menu_price,
    menu_code * menu_price as 연산결과
FROM 
	tbl_menu
ORDER BY
	menu_code * menu_price DESC;
    
 -- 맨 왼쪽값이 2번째 인자 이후의 값과 일치하면 해당 위치 값을 반환
 SELECT field('c','a','b','c');
 
 SELECT 
	field(orderable_status, 'N', 'Y')
FROM 
	tbl_menu;

-- tbl_menu 테이블에서 메뉴이름, 판매상태를 조회하는데 판매상태가 N인 친구들이 위로 오게
SELECT
	menu_name, 
    orderable_status
FROM 
    tbl_menu
order by 
	field(orderable_status , 'N','Y');
    
-- null 값이 있는 컬럼에 대한 정렬
SELECT
	*
FROM
	tbl_category;
    
-- 오름차순 시 null 값이 처음으로(default)
SELECT
	category_code,
    category_name,
    ref_category_code
FROM tbl_category
ORDER BY
	ref_category_code;

-- 오름차순 시 null 값을 마지막으로 (IS NULL ASC)
SELECT
	category_code,
    category_name,
    ref_category_code
FROM tbl_category
ORDER BY
	ref_category_code IS NULL ASC;

	
	




    