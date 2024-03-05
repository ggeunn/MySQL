-- DDL(Data Definition Language)
-- DDL 은 데이터베이스의 스키마(테이블)를 정의하거나 수정하는데 사용되는
-- SQL의 한 부분이다.

-- 1-1 create
-- 테이블 생성을 위한 구문
-- if not exists 를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정 방법
-- 컬럼이름 데이터타입(길이) [not null][default value][auto_increment] colum-contraint;

-- tb1 예시 테이블 생성하기

CREATE TABLE IF NOT EXISTS tb1 (
	pk INT PRIMARY KEY,
    fk INT,
    col1 varchar(255),
    CHECK(col1 in ('Y','N'))
) ENGINE = INNODB ;

-- ENGINE = INNODB : 테이블을 innodb 라고 불리는 스토리지 엔진으로 생성하겠다는 의미(mysql에서 가장 많이 쓰임)

DESCRIBE tb1;

INSERT INTO tb1 VALUES(1, 10, 'Y');

SELECT * FROM tb1;

-- auto_increment
-- insert 시 primary 키의 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.

CREATE TABLE IF NOT EXISTS tb2 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 varchar(255),
    CHECK(col1 in ('Y','N'))
) ENGINE = INNODB ;
 
 DESCRIBE tb2;
 
 INSERT INTO tb2 values(null, 10, 'Y');
 INSERT INTO tb2 values(null, 10, 'Y');
 
 SELECT * FROM tb2;
 
 -- ALTER
 -- 테이블의 추가/변경/수정/삭제 하는 모든것은 ALTER 명령어를 사용하여 적용한다.
 
 -- 열 추가
 -- ALTER TABLE 테이블명 ADD 컬럼명 컬럼 정의
 -- tb2 테이블에 col2 라는 컬럼 추가(int 형, not null 제약조건 존재)
 
ALTER TABLE tb2 
ADD col2 INT NOT NULL ;
DESCRIBE tb2;

-- 열 삭제
-- ALTER TABLE 테이블명 DROP column 컬럼명

ALTER TABLE tb2 
DROP column col2;

-- 열 이름 및 데이터 형식 변경
-- ALTER TABLE 테이블명 change column 기존컬럼명 바꿀컬럼명 컬럼정의

ALTER TABLE tb2 
change column fk change_fk INT NOT NULL;

-- 열 제약 조건 추가 및 삭제
-- ALTER TABLE 테이블명 DROP 제약조건

ALTER TABLE tb2 DROP PRIMARY KEY;

-- auto_increment 가 걸려 있는 컬럼은 primary key 제거가 안된다.
-- 따라서 modify 명령어로 제거한다.

ALTER TABLE tb2
MODIFY pk INT;

ALTER TABLE tb2 ADD PRIMARY KEY(pk);

-- 컬럼 여러개 추가하기
ALTER TABLE tb2
ADD col3 DATE NOT NULL,
ADD col4 TINYINT NOT NULL;

-- 데이터 형이 추가가 안되는 것은 MySQL 이 5.7버전 이후 0으로 채워진 date 컬럼이 존재하면 안 되기 떄문이다.

SELECT @@global.sql_mode;

DESCRIBE tb2;

-- drop
-- 테이블 삭제하기 위한 구문

CREATE TABLE IF NOT EXISTS tb3 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 varchar(255),
    CHECK(col1 in ('Y','N'))
) ENGINE = INNODB ;

-- drop table tb3
DROP TABLE IF EXISTS tb3;

DROP TABLE IF EXISTS tb1, tb2;

-- truncate
-- 논리적으로 where절이 없는 delete 구문과 큰 차이는 없다.
-- 어차피 데이트를 다 삭제할 경우 행마다 하나씩 지워지는 delete 보다
-- drop 이후 바로 테이블을 재생성해주는 truncate 가 훨씬 요육적으로 한번에 테이블을 초기화 시켜준다.

CREATE TABLE IF NOT EXISTS tb1 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 varchar(255),
    CHECK(col1 in ('Y','N'))
) ENGINE = INNODB ;

INSERT INTO tb1 VALUES(null, 30 , 'Y');
INSERT INTO tb1 VALUES(null, 40 , 'Y');

SELECT * FROM tb1;

-- 테이블 초기화
-- truncate table tb1;
truncate tb1; -- table 키워드 생략 가능