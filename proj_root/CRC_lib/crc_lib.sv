`ifndef CRC_LIB
class crc_lib#(parameter int DWITH=8, int CRC=16) extends uvm_object;
		
		logic [DWITH-1:0] data_buffer[$];
		logic	[CRC-1:0] crc_data;

		`uvm_object_param_utils(crc_lib#(DWITH, CRC))


		function new(string name="crc_lib");
			super.new(name);
		endfunction: new

		// CRC32 used for PCIE
		virtual function void crc32_calculate();
			logic [CRC-1:0] polymial = {CRC{1'b1}};
			logic [DWITH-1:0]	data_in;
			if(this.data_buffer.size() == 0)
				begin
					`uvm_error(this.get_name(), "BUFFER SIZE IS 0");	
				end
			else
				begin
					foreach(this.data_buffer[i])
						begin
							data_in = this.data_buffer[i];
							this.crc_data[0] = polymial[24] ^ polymial[30] ^ data_in[0] ^ data_in[6];
    					this.crc_data[1] = polymial[24] ^ polymial[25] ^ polymial[30] ^ polymial[31] ^ data_in[0] ^ data_in[1] ^ data_in[6] ^ data_in[7];
    					this.crc_data[2] = polymial[24] ^ polymial[25] ^ polymial[26] ^ polymial[30] ^ polymial[31] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[6] ^ data_in[7];
    					this.crc_data[3] = polymial[25] ^ polymial[26] ^ polymial[27] ^ polymial[31] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[7];
    					this.crc_data[4] = polymial[24] ^ polymial[26] ^ polymial[27] ^ polymial[28] ^ polymial[30] ^ data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[6];
    					this.crc_data[5] = polymial[24] ^ polymial[25] ^ polymial[27] ^ polymial[28] ^ polymial[29] ^ polymial[30] ^ polymial[31] ^ data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    					this.crc_data[6] = polymial[25] ^ polymial[26] ^ polymial[28] ^ polymial[29] ^ polymial[30] ^ polymial[31] ^ data_in[1] ^ data_in[2] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    					this.crc_data[7] = polymial[24] ^ polymial[26] ^ polymial[27] ^ polymial[29] ^ polymial[31] ^ data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[7];
    					this.crc_data[8] = polymial[0] ^ polymial[24] ^ polymial[25] ^ polymial[27] ^ polymial[28] ^ data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4];
    					this.crc_data[9] = polymial[1] ^ polymial[25] ^ polymial[26] ^ polymial[28] ^ polymial[29] ^ data_in[1] ^ data_in[2] ^ data_in[4] ^ data_in[5];
    					this.crc_data[10] = polymial[2] ^ polymial[24] ^ polymial[26] ^ polymial[27] ^ polymial[29] ^ data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5];
    					this.crc_data[11] = polymial[3] ^ polymial[24] ^ polymial[25] ^ polymial[27] ^ polymial[28] ^ data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4];
    					this.crc_data[12] = polymial[4] ^ polymial[24] ^ polymial[25] ^ polymial[26] ^ polymial[28] ^ polymial[29] ^ polymial[30] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[4] ^ data_in[5] ^ data_in[6];
    					this.crc_data[13] = polymial[5] ^ polymial[25] ^ polymial[26] ^ polymial[27] ^ polymial[29] ^ polymial[30] ^ polymial[31] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    					this.crc_data[14] = polymial[6] ^ polymial[26] ^ polymial[27] ^ polymial[28] ^ polymial[30] ^ polymial[31] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[6] ^ data_in[7];
    					this.crc_data[15] = polymial[7] ^ polymial[27] ^ polymial[28] ^ polymial[29] ^ polymial[31] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[7];
    					this.crc_data[16] = polymial[8] ^ polymial[24] ^ polymial[28] ^ polymial[29] ^ data_in[0] ^ data_in[4] ^ data_in[5];
    					this.crc_data[17] = polymial[9] ^ polymial[25] ^ polymial[29] ^ polymial[30] ^ data_in[1] ^ data_in[5] ^ data_in[6];
    					this.crc_data[18] = polymial[10] ^ polymial[26] ^ polymial[30] ^ polymial[31] ^ data_in[2] ^ data_in[6] ^ data_in[7];
    					this.crc_data[19] = polymial[11] ^ polymial[27] ^ polymial[31] ^ data_in[3] ^ data_in[7];
    					this.crc_data[20] = polymial[12] ^ polymial[28] ^ data_in[4];
    					this.crc_data[21] = polymial[13] ^ polymial[29] ^ data_in[5];
    					this.crc_data[22] = polymial[14] ^ polymial[24] ^ data_in[0];
    					this.crc_data[23] = polymial[15] ^ polymial[24] ^ polymial[25] ^ polymial[30] ^ data_in[0] ^ data_in[1] ^ data_in[6];
    					this.crc_data[24] = polymial[16] ^ polymial[25] ^ polymial[26] ^ polymial[31] ^ data_in[1] ^ data_in[2] ^ data_in[7];
    					this.crc_data[25] = polymial[17] ^ polymial[26] ^ polymial[27] ^ data_in[2] ^ data_in[3];
    					this.crc_data[26] = polymial[18] ^ polymial[24] ^ polymial[27] ^ polymial[28] ^ polymial[30] ^ data_in[0] ^ data_in[3] ^ data_in[4] ^ data_in[6];
    					this.crc_data[27] = polymial[19] ^ polymial[25] ^ polymial[28] ^ polymial[29] ^ polymial[31] ^ data_in[1] ^ data_in[4] ^ data_in[5] ^ data_in[7];
    					this.crc_data[28] = polymial[20] ^ polymial[26] ^ polymial[29] ^ polymial[30] ^ data_in[2] ^ data_in[5] ^ data_in[6];
    					this.crc_data[29] = polymial[21] ^ polymial[27] ^ polymial[30] ^ polymial[31] ^ data_in[3] ^ data_in[6] ^ data_in[7];
    					this.crc_data[30] = polymial[22] ^ polymial[28] ^ polymial[31] ^ data_in[4] ^ data_in[7];
    					this.crc_data[31] = polymial[23] ^ polymial[29] ^ data_in[5];
						end
				end
		endfunction: crc32_calculate

		// CRC16 used for USB
		virtual function void crc16_calculate();
			begin
				logic [CRC-1:0] polymial = {CRC{1'b1}};
				logic [DWITH-1:0]	data_in;
				if(this.data_buffer.size() == 0)
					begin
						`uvm_error(this.get_name(), "BUFFER SIZE IS 0");	
					end
				else
					begin
						foreach(this.data_buffer[i])
							begin
								data_in = this.data_buffer[i];
								this.crc_data[0] = polymial[8] ^ polymial[9] ^ polymial[10] ^ polymial[11] ^ polymial[12] ^ polymial[13] ^ polymial[14] ^ polymial[15] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    						this.crc_data[1] = polymial[9] ^ polymial[10] ^ polymial[11] ^ polymial[12] ^ polymial[13] ^ polymial[14] ^ polymial[15] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    						this.crc_data[2] = polymial[8] ^ polymial[9] ^ data_in[0] ^ data_in[1];
    						this.crc_data[3] = polymial[9] ^ polymial[10] ^ data_in[1] ^ data_in[2];
    						this.crc_data[4] = polymial[10] ^ polymial[11] ^ data_in[2] ^ data_in[3];
    						this.crc_data[5] = polymial[11] ^ polymial[12] ^ data_in[3] ^ data_in[4];
    						this.crc_data[6] = polymial[12] ^ polymial[13] ^ data_in[4] ^ data_in[5];
    						this.crc_data[7] = polymial[13] ^ polymial[14] ^ data_in[5] ^ data_in[6];
    						this.crc_data[8] = polymial[0] ^ polymial[14] ^ polymial[15] ^ data_in[6] ^ data_in[7];
    						this.crc_data[9] = polymial[1] ^ polymial[15] ^ data_in[7];
    						this.crc_data[10] = polymial[2];
    						this.crc_data[11] = polymial[3];
    						this.crc_data[12] = polymial[4];
    						this.crc_data[13] = polymial[5];
    						this.crc_data[14] = polymial[6];
    						this.crc_data[15] = polymial[7] ^ polymial[8] ^ polymial[9] ^ polymial[10] ^ polymial[11] ^ polymial[12] ^ polymial[13] ^ polymial[14] ^ polymial[15] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
							end
					end
			end
		endfunction: crc16_calculate

		virtual function void delete_buff();
				this.data_buffer = {};
		endfunction: delete_buff

endclass: crc_lib
`endif
