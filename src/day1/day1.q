// https://code.kx.com/q/ref/accumulators/

// improvement 1:
// if the list is long, we may include the (count where 0 =) to the state
// improvement 2:
// read0 / read1 --> load entire file into memory (good for small/medium files).
// hopen + hget --> stream file line-by-line (good for large files).
// You can pass the file handle to your function instead of the file name.
// This avoids the need to "read first, then apply" — you apply as you read.

test:(
"L68";
"L30";
"R48";
"L5";
"R60";
"L55";
"L1";
"L99";
"R14";
"L82"
);

fetch:read0;

decode: {("LR"!(-1;1))[first x]*"I"$1_x};
execute: {[state;command] 
       //show state;
    (state+decode[command]) mod 100};

//count where 0=execute\[50;test]
//fetch `$"src/day1/input1.txt"
count where 0=execute\[50;fetch `$"src/day1/input1.txt"]

