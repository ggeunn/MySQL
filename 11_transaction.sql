-- transaction
-- 트랜잭션이란?
-- 시작, 진행, 종료 단계를 가지며 만약 중간에 오류가 발생하면
-- rollback (시작 이전의 단계로 돌아가는 작업)을 수행하고
-- 데이터베이스에 제대로 반영하기 위해서는 commit을 진행한다.

-- MySQL 기본적으로 자동 커밋 설정이 되어 있다.
-- 따라서 rollback이 안된다.
-- rollback을 하기 위해서는 자동 커밋 설정을 off 해주어야 한다.

-- autocommit 활성화
SET autocommit = 1;
SET autocommit = ON;

-- autocommit 비활성화
SET autocommit = 0;

-- autocommit 을 비활성화 하면 transaction 을 명시적으로 commit
-- 해야하지만 변경한 사항이 데이터베이스에 영구적으로 반영이 된다.
-- START TRANSACTION 구문을 작성하고
-- dml(insert, delete, update)등 작업 수행 후 commit or rollback 을 하면된다.

START TRANSACTION;

SELECT * FROM tbl_menu;

INSERT INTO tbl_menu VALUES (null, '바나나해장국', 9000,4,'Y');
DELETE FROM tbl_menu;
UPDATE tbl_menu
SET 
	menu_name = '수정메뉴'
WHERE
	menu_code = 1;

COMMIT;
ROLLBACK;

