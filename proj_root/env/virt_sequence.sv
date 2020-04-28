`ifndef VIRT_SEQUENCE
`define VIRT_SEQUENCE
`include "crc_lib.sv"
class virt_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(virt_sequence)
	`uvm_declare_p_sequencer(sequencer)

  function new(string name = "virt_sequence");
		super.new(name);
	endfunction: new

	virtual task body();
		`uvm_info(this.get_name(), "BODY ENTER", UVM_LOW)
		`uvm_info(this.get_name(), "BODY EXIT", UVM_LOW)
	endtask: body

endclass: virt_sequence
`endif
