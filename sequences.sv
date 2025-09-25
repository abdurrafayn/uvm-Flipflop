class sequences extends uvm_sequence#(base_seq);
    `uvm_object_utils(sequences)

    function new(input string name = "sequences");
        super.new(name);
    endfunction

    base_seq tr;

    virtual task body();
        repeat(15)
            tr = base_seq::type_id::create("tr");
            start_item(tr);
            assert (tr.randomize());
            tr.rst = 1'b0;
            //uvm_info -> a message (id, message, verbosity)
            `uvm_info("sequences", $sformatf("rst = %0b | din = %0b | dout = %0b", tr.rst,tr.din,tr.dout), UVM_NONE)
            finish_item(tr);
    endtask
endclass

class rst_on extends uvm_sequence#(base_seq);
`uvm_object_utils(rst_on)

function new(input string name = "rst_on");
    super.new(name);
endfunction

base_seq tr;

    virtual task body();
        repeat(15)
        tr = base_seq::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize());
        tr.rst = 1'b1;
        `uvm_info("sequences", $sformatf("rst = %0b | din = %0b | dout = %0b" tr.rst, tr.din, tr.dout), UVM_NONE)
        finish_item(tr);
    endtask
endclass

class normal_seq extends uvm_sequence#(base_seq);
`uvm_object_utils(normal_seq)

function new(input string namer ="normal_seq");
super.new(name);
endfunction

base_seq tr;

virtual task body();
    repeat(15)
    tr = base_seq::type_id::create("tr");
    start_item(tr);
    assert (tr.randomize()); 
    `uvm_info("sequences", %sformatf("rst = %0b | din = %0b | dout = %0b",tr.rst, tr.din, tr.dout), UVM_NONE)
    finish_item(tr);
endtask
endclass