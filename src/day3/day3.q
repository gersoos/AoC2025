test:("987654321111111";
    "811111111111119";
    "234234234234278";
    "818181911112111");


//sum "J"$
//{[str]
// f:max -1_str;
// f,max 1_first[ss[str;f]]_str
//} 
//each test
//each read0 `$"src/day3/input1.txt"




fm:{[str;rest]
 if[0=rest;:""];
 f:max (-1*(rest-1))_str;
 f,fm[1_first[ss[str;f]]_str;rest-1]
};
//sum "J"$fm[;12]
sum "J"$fm[;2]  
//each test
each read0 `$"src/day3/input1.txt"

// 17443
// 172167155440541
