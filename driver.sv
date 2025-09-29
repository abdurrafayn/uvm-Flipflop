class driver extends uvm_driver#(base_seq);
virtual add_if intf;
base_seq tr;

`uvm_object_utils(driver)

    function new(input string name="driver", uvm_component parent = NULL);
        super.new(name,parent);
    endfunction


  	virtual function void build_phase (uvm_phase phase);
  		super.build_phase (phase);
     	if (! uvm_config_db #(virtual add_if) :: get (this, "", "intf", intf)) begin
        	`uvm_fatal (get_type_name (), "Didn't get handle to virtual interface intf")
     	end
    endfunction

    task run_phase (uvm_phase phase);
    tr = base_seq::type_id::create("tr");
      super.run_phase (phase);

      forever begin

         `uvm_info (get_type_name (), $sformatf ("Waiting for data from sequencer"), UVM_LOW)
         seq_item_port.get_next_item(tr);
         intf.rst <= tr.rst;
         intf.din <= tr.din;
         `uvm_info("DRV", $sformatf("rst : %0b  din : %0b  dout : %0b", tr.rst, tr.din, tr.dout), UVM_NONE);
         seq_item_port.item_done();
         repeat(2) @(posedge intf.clk);
      end
   endtask
endclass