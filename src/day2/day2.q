// https://adventofcode.com/2025/day/2
// https://www.timestored.com/kdb-guides/kdb-string-functions
test: "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,",
"1698522-1698528,446443-446449,38593856-38593862,565653-565659,",
"824824821-824824827,2121212118-2121212124";

parse_input:{"J"$"-" vs'"," vs x};

tbl:([] a:"J"$"-" vs'"," vs first read0 `$"src/day2/input1.txt");
//tbl:([] a:"J"$"-" vs'"," vs test);
tbl:update s:first each a,e: last each a from tbl;
//tbl:`m xdesc update m:e-s from tbl;

match:{x:string x;cc:count x;$[1=cc mod 2;0b;all{first[x]=last[x]}(cc div 2) cut x]};
//where match 11 12
tbl: update l:{[x;y] {pos:where match each x;x[pos]} x+til (1+y-x)}'[s;e] from tbl;

select sum raze l from tbl

