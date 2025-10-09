class my_agent extends uvm_agent;
    `uvm_component_utils(my_agent)

    seqcr my_seq;
    driver my_driver;
    monitor my_monitor;

    function new(input string name="my_agent", uvm_component parent = NULL);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        my_seq = seqcr::type_id::create("my_seq", this);
        my_driver = driver::type_id::create("my_driver", this);
        my_monitor = monitor::type_id::create("my_monitor", this);

    endfunction

    virtual function void connect_phase(uvm_phase);
        super.connect_phase(phase);
        my_driver.seq_item_port.connect(my_seqr.seq_item_export);

    endfunction

endclass