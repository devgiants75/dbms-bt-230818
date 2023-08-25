### data_type ###

# 데이터 형식
# : 숫자형, 문자형, 날짜형

# 1. 숫자 - 정수형
# : 소수점이 없는 숫자
# : 인원 수, 가격, 수량 등에 많이 사용

-- tinyint (1바이트) -128 ~ 127
-- tinyint unsigned 0 ~ 255

-- smallint (2바이트) -32,768 ~ 32,767 
-- smallint unsigned 0 ~ 65535

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

# tinyint: -127 ~ 128 (256개 표시)
# 데이터형식 unsigned
# : 데이터 시작값을 0으로 지정 (0 ~ 255)
# : 키에 대한 데이터타입 smallint (X)
# tinyint unsigned

# 2. 문자형
# : 글자를 저장하기 위해 사용
# : 입력할 최대 글자의 개수를 지정해야 한다.

# char(개수): 1 ~ 255 바이트 
# character의 약자, 고정길이 문자형
# EX) char(10) - '가나다' -- 7자리 공간은 비어진 채로 할당

# varchar(개수): 1 ~ 16383 바이트
# 가변길이 문자형
# EX) varchar(10) - '가나다' -- 3자리만 사용하고 7자리는 삭제

# varchar가 char보다 공간을 효율적으로 운영
# MySQL 내부적으로 성능(속도)면에서는 char로 설정하는 것이 좋다.

# 전화번호를 문자형으로 지정하는 이유
# : 정수형으로 전화번호를 지정하는 경우 제일 앞에 사용되는 0이 자동 생략

# 숫자형으로 데이터 형식을 지정하는 경우
# - 더하기/빼기 등의 연산이 필요한 데이터인 경우
# - 크다/작다 또는 순서에 영향이 필요한 경우

# 3. 대량의 데이터 형식
# create table big_table (
#	 data1 char(256),
#    data2 varchar(16384)
#);
# Error: Column length too big

# text형식
# - text: 1 ~ 65535
# - longtext: 1 ~ 4294967295

# blob 형식
# : binary long object약자
# : 글자가 아닌 이미지, 동영상 등의 데이터
# - blob: 1 ~ 65535
# - longblob: 1 ~ 4294967295

# 4. 실수형
# : 소수점이 있는 숫자를 저장할 때 사용
# float (4바이트) 소수점 아래 7자리까지 표현
# double (8바이트) 소수점 아래 15자리까지 표현
# 주로 float사용
# 과학 기술용 데이터와 같이 정밀 계산이 필요한 경우에는 double 사용

# 5. 날짜형
# : 날짜 및 시간을 저장할 때 사용
# date (3바이트) YYYY-MM-DD
# time (3바이트) HH:MM:SS
# datetime (8바이트) YYYY-MM-DD HH:MM:SS

