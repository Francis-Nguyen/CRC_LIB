typedef class test;
`include "env.sv"
`include "virt_sequence.sv"
`include "crc_test_00.sv"
`include "crc_test_01.sv"
class test extends uvm_test;
	env crc_env;
	crc_test_00	test_00;
	crc_test_01	test_01;
	`uvm_component_utils_begin(test)
			`uvm_field_object(crc_env, UVM_ALL_ON)
			`uvm_field_object(test_00, UVM_ALL_ON)
	`uvm_component_utils_end

	function new(string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TEST", "build phase entering.................", UVM_LOW);
			crc_env = env::type_id::create("crc_env", this);
		`uvm_info("TEST", "build phase exiting.................", UVM_LOW);
	endfunction: build_phase		

	task run_phase(uvm_phase phase);
		`uvm_info("TEST", "run phase entering.................", UVM_LOW);
		`ifdef crc_test_00
			begin
				test_00	= crc_test_00::type_id::create("crc_test_00", this);
				test_00.start(this.crc_env.crc_sequencer);
			end
			`endif
		`ifdef crc_test_01
			begin
				test_01	= crc_test_01::type_id::create("crc_test_01", this);
				test_01.start(this.crc_env.crc_sequencer);
			end
			`endif
		`uvm_info("TEST", "run phase exiting.................", UVM_LOW);

	endtask: run_phase 

endclass: test
