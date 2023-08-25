### variable : 변수 ###

# 변수의 특징
# : MySQL 워크벤치를 재시작할 때까지는 유지
# : 종료하면 없어지는 데이터, 임시로 사용.

# 변수의 선언 및 값 대입
# : set @변수이름 = 변수의 값; 

# 변수의 값 출력
# : select @변수이름

use market_db;
set @myVar1 = 5;
set @myVar2 = 4.25;

select @myVar1;
select @myVar1 + @myVar2;

set @txt = '가수 이름 >>>';
set @height = 166;
select @txt, mem_name from members where height > @height;



