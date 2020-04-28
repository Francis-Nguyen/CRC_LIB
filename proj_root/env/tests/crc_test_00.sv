class crc_test_00 extends virt_sequence;
  `uvm_object_utils(crc_test_00)

  function new(string name = "crc_test_00");
		super.new(name);
	endfunction: new

	virtual task body();
		begin
		`uvm_info(this.get_name(), "BODY ENTER", UVM_LOW)
		`uvm_info(this.get_name(), "BODY EXIT", UVM_LOW)
		end
	endtask: body

endclass: crc_test_00
