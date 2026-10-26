//tasks of sequence_item class
//1) packet of all dut signels
//2) can containt the contraints
//3) can containt the display statments

class sequence_item;            //  transaction fields
  rand logic [7:0] A;
  rand logic [7:0] B;
  typedef enum logic [2:0]{ADD     =3'B000,
                           SUB     =3'B001,
                           MUL    = 3'b010,
                           INV    = 3'b011,
                           AND_OP = 3'b100,
                           OR_OP  = 3'b101,
                           XOR_OP = 3'b110,
                           SLL    = 3'b111
                          } OP_T;
   rand OP_T OP;
   logic [15:0] result;
  
//  static  int tx_count;
  // int tx_id;
  
  constraint  sub_c{ if (OP== SUB) A>B ;}
 // divison 
  
 // function new();//constructor field // method call unique transaction numbering
   // tx_id=tx_count;
    //tx_count++;
 // endfunction
  
  function void display();     // display method
    $display("{time::%0t} {sq_item}A=%0d B=%0d OP=%0s result=%0d ",$time,A,B,OP.name(),result);
  endfunction
  
endclass