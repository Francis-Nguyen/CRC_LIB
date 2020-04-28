`ifndef ENV
`define ENV
typedef class env;
`include "sequencer.sv"
class env extends uvm_env;
	sequencer								crc_sequencer;
	`uvm_component_utils_begin(env)
		`uvm_field_object(crc_sequencer, 	UVM_ALL_ON)
	`uvm_component_utils_end

	function new(string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction: new
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("ENV", "build phase entering.............", UVM_LOW);
		`uvm_info("ENV", "build phase exiting..............", UVM_LOW);
	endfunction: build_phase
	
	function void connect_phase(uvm_phase phase);
		`uvm_info("ENV", "connect phase entering.............", UVM_LOW);
		`uvm_info("ENV", "connect phase exiting..............", UVM_LOW);
	endfunction: connect_phase

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		`uvm_info("ENV", "run_phase phase entering.............", UVM_LOW);
	  #1ms;
		`uvm_info("ENV", "run_phase phase exiting.............", UVM_LOW);
		phase.drop_objection(this);
	endtask: run_phase
		
endclass: env
`endif
