-- limit
-- limit 절은 select 문의 결과 집합에서 반환할 행의 수를 제한하는데 사용된다.

SELECT
	*
FROM
	tbl_menu
ORDER BY
	menu_price DESC;
    
SELECT
	*
FROM tbl_menu
ORDER BY
	menu_price DESC
LIMIT 5;

-- limit [offset, ] row_count
-- offset : 시작할 행의 번호(인덱스 체계)
-- row_count : 이후 행 부터 반환 받을 행의 갯수

SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC
LIMIT 1, 4;