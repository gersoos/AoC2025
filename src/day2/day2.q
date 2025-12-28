// https://adventofcode.com/2025/day/2
// https://www.timestored.com/kdb-guides/kdb-string-functions
test: "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,",
"1698522-1698528,446443-446449,38593856-38593862,565653-565659,",
"824824821-824824827,2121212118-2121212124";


tbl:([] a:"J"$"-" vs'"," vs first read0 `$"src/day2/input1.txt");
//tbl:([] a:"J"$"-" vs'"," vs test);
tbl:update s:first each a,e: last each a from tbl;
//tbl:`m xdesc update m:e-s from tbl;

match1:{x:string x;cc:count x;$[1=cc mod 2;0b;all{first[x]=last[x]}(cc div 2) cut x]};
//where match 11 12
//tbl: update l:{[x;y] {pos:where match1 each x;x[pos]} x+til (1+y-x)}'[s;e] from tbl;
//select sum raze l from tbl



// from 0 to 10 digits, lets list dividers
// select count string max e from tbl;
cc:(();();(1);(1);(1;2);(1);(1;2;3);(1);(1;2;4);(1;3);(1;2;5));
//cc:(();();(1);();(2);();(3);();(4);(1);(5));

sum raze
{[cc;x] 
    xx:string x;
    // 1111 is matched as 1-1-1-1 and 11-11
    distinct raze "J"$
    {[x;cc] 
    
    {
        // x if all substring is eaqual
        $[1=count x;();$[all {x~y}[first x] each x;enlist raze x;()]]   }
    
    cc cut x  }[xx]
    
     // bind xx try each possibledividers
     each cc[count xx]   
    }[cc] each
// (123123122)
// (1111 111 1212 12 17)
// (2200670)
 
raze exec {[x;y] x+til (1+y-x)}'[s;e] from tbl


// 34826702005
// 43287141963
