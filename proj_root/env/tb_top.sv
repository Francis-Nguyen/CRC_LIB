import uvm_pkg::*;
`include "uvm_macros.svh"
`include "test.sv"
`include "dut_wrapper.sv"
module tb_top();

	dut_wrapper dut_wrapper();

	initial begin
		run_test("test");
	end

endmodule
