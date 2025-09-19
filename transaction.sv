class base_seq extends uvm_sequence_item;
`uvm_object_utils(base_seq)

function new(input string name = "base_seq");
super.new(name);
endfunction

rand bit rst;
rand bit din;
    bit dout;



endclass