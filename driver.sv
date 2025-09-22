class driver extends uvm_driver#(base_seq);
virtual add_if intf;

`uvm_object_utils(driver)

function new(input string name="driver", uvm_component parent = NULL);
    super.new(name,parent);
endfunction




endclass