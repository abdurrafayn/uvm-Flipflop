class monitor extends uvm_monitor;

    virtual add_if intf;
    base_seq tr;

    uvm_analysis_port #(base_seq) mon_analysis_port;

    `uvm_component_utils(monitor)

    function new(input string name="monitor", uvm_component parent = NULL);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase)
        super.build_phase(phase);

        mon_analysis_port = new ("mon_analysis_port", this);
        tr = base_seq::type_id::create("tr");

        if (! uvm_config_db #(virtual add_if) :: get (this, "", "intf", intf)) begin
            `uvm_error (get_type_name (), "Didn't get handle to virtual interface intf")
        end

    endfunction

    task run_phase(uvm_phase phase)

    forever begin
        `uvm_info (get_type_name (), $sformatf ("Waiting for data from DUT"), UVM_LOW)
        repeat(2) @(posedge intf.clk)
            tr.rst <= intf.rst;
            tr.din <= intf.din;
            tr.dout <= intf.dout;
        `uvm_info("monitor", $sformatf("rst : %0b  din : %0b  dout : %0b", tr.rst, tr.din, tr.dout), UVM_NONE);
        mon_analysis_port.write(tr);

    end

    endtask

endclass