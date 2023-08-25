### data_type ###

# 데이터 형식
# : 숫자형, 문자형, 날짜형

# 1. 숫자 - 정수형
# : 소수점이 없는 숫자
# : 인원 수, 가격, 수량 등에 많이 사용

-- tinyint (1바이트) -128 ~ 127
-- smallint (2바이트) -32,768 ~ 32,767
-- int (4바이트) 약 -21억 ~ + 21억
-- bigint (8바이트) 약 -900경 ~ + 900경

create table int_table (
	tinyint_col tinyint,
    smallint_col smallint,
    int_col int,
    bigint_col bigint
);

insert into int_table values(127, 32767, 2147483647, 9000000000000000000);
# insert into int_table values(128, 32768, 2147483648, 90000000000000000000);
# Error: Out of range value for column




