class seqcr extends uvm_sequencer;
`uvm_object_utils_start(seqcr)
    `uvm_field_int(rst, UVM_ALL_ON)
    `uvm_field_int(din, UVM_ALL_ON)
`uvm_object_utils_end

function new(input string name = "seqcr", uvm_component parent);
    super.new(name,parent);
endfunction

endclass