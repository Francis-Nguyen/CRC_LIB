`ifndef SEQUENCER
`define SEQUENCER
class sequencer extends uvm_sequencer;
	`uvm_object_utils(sequencer)

	function new(string name = "sequencer", uvm_component parent = null);
	  super.new(name, parent);
	endfunction: new

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(this.get_name(), "RUN PHASE ENTER", UVM_LOW)
		`uvm_info(this.get_name(), "RUN PHASE EXIT", UVM_LOW)
	endtask: run_phase

endclass: sequencer
`endif
