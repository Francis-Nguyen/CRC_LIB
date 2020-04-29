class crc_test_01 extends virt_sequence;
  `uvm_object_utils(crc_test_01)

  function new(string name = "crc_test_01");
		super.new(name);
	endfunction: new

	virtual task body();
		logic [7:0]	data[$];
		bit result;
		crc_lib#(8, 16) _crc16_obj;
		crc_lib#(8, 16) _crc16_obj1;
		begin
		`uvm_info(this.get_name(), "BODY ENTER", UVM_LOW)
			_crc16_obj = crc_lib#(8, 16)::type_id::create("_crc16_obj");
			_crc16_obj1 = crc_lib#(8, 16)::type_id::create("_crc16_obj1");
			for(int i=0; i<16; i++)
				begin
					data.push_back($random());		
				end

			// Generate CRC
			_crc16_obj.data_buffer = data;
			_crc16_obj.crc16_calculate();
			_crc16_obj.print();
			// Generate CRC
			_crc16_obj1.data_buffer = data;
			_crc16_obj1.data_buffer[1][5] = ~_crc16_obj1.data_buffer[1][5];
			_crc16_obj1.crc16_calculate();
			_crc16_obj1.print();
			// Change 1 bit and check CRC again
			result = _crc16_obj1.crc_check(_crc16_obj);
			_crc16_obj1.delete_buff();
			_crc16_obj.delete_buff();
		`uvm_info(this.get_name(), "BODY EXIT", UVM_LOW)
		end
	endtask: body

endclass: crc_test_01
