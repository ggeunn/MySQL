-- WHERE
-- WHERE 절은 특정 조건에 맞는 레코드만 선택하는데 사용되며,
-- 다양한 방법으로 조건을 설정할 수 있다.

SELECT 
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE 
	orderable_status = 'Y';
    
SELECT
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price = 13000;
    
SELECT 
	menu_code,
    menu_name,
    orderable_status
FROM
	tbl_menu
WHERE
				-- (!=, <>) 부정
	orderable_status != 'Y';
    
SELECT 
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_price > 20000;

SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	10000 <= menu_price AND menu_price<= 20000;
    
-- AND / OR 연산자
-- WHERE절과 함꼐 사용
-- (or) : 둘 다 null 이 아니면서 하나라도 0이 아닌 값이 있을경우 1을 반환한다.

SELECT 1 OR 1, 1 OR 0, 0 OR 1, 0 OR 0;

SELECT
	menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status = 'Y' OR category_code = 10
ORDER BY 
	category_code;
    
SELECT 
	*
FROM
	tbl_menu
WHERE
	menu_price > 5000 
    OR category_code = 10;

-- (AND) 연산자
-- WHERE절과 함께 AND연산자 사용

SELECT 1 AND 1;
SELECT 1 AND 0, 0 AND 1, 0 AND 0;

SELECT
	*
FROM
	tbl_menu
WHERE
	orderable_status = 'Y' 
    AND category_code = 10;

-- AND 와 OR 의 우선순위
-- AND 가 OR 보다 우선순위가 높다.
-- 따라서 OR의 우선순위를 높이려면 소괄호를 사용한다.
SELECT
	*
FROM
	tbl_menu
WHERE
	category_code = 4
    OR
    menu_price = 9000
    AND
    menu_code > 10;
    
-- BETWEEN 연산자랑 WHERE
SELECT
	menu_name,
    menu_price,
    category_code
FROM
	tbl_menu
WHERE
	menu_price BETWEEN 10000 AND 20000;
    
-- 부정 BETWEEN
SELECT
	*
FROM
	tbl_menu
WHERE
	category_code = 4
    OR
    menu_price = 9000
    AND
    menu_code > 10;
    
-- BETWEEN 연산자랑 WHERE
SELECT
	menu_name,
    menu_price,
    category_code
FROM
	tbl_menu
WHERE
	menu_price NOT BETWEEN 10000 AND 20000;
    
-- like 연산자
SELECT
	menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_name LIKE '%마늘%';
    
SELECT
	*
FROM
	tbl_menu
WHERE
	menu_price > 5000
    AND
    category_code = 10
    AND
    menu_name LIKE '%갈치%';
    
-- IN 연산자
SELECT
	menu_name,
    category_code
FROM
	tbl_menu
WHERE
	category_code IN (4,5,6);
    
-- IS NULL 연산자 활용
SELECT
	category_code,
    category_name,
    ref_category_codetbl_paymenttbl_payment
FROM
	tbl_category
WHERE
	ref_category_code IS NULL;