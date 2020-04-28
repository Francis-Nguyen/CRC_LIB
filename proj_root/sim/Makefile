TB_TOP  = $(PROJ_ROOT)/env

UVM_INC = +incdir+$(PROJ_ROOT)/uvm-1.2/src \
					$(PROJ_ROOT)/uvm-1.2/src/uvm.sv
CRC_LIB	= +incdir+$(PROJ_ROOT)/CRC_lib

ENV_INC	= +incdir+$(PROJ_ROOT)/env \
					+incdir+$(PROJ_ROOT)/env/interface \
					+incdir+$(PROJ_ROOT)/env/lib

RTL_INC	= +incdir+$(PROJ_ROOT)/rtl

SVA_INC = -f $(PROJ_ROOT)/sva/sva_list.f

COV_INC = -f $(PROJ_ROOT)/cov/cov_list.f

TEST_INC = +incdir+$(PROJ_ROOT)/env/tests

TEST_NAME = default

comp:
	mkdir run_data;
	vlib work
	vlog +define+UVM_NO_DPI \
				$(UVM_INC) \
				$(CRC_LIB) \
				$(ENV_INC) \
				$(RTL_INC) \
				$(SVA_INC) \
				$(COV_INC) \
				$(TEST_INC) \
				+define+$(TEST_NAME) \
				$(TB_TOP)/tb_top.sv
sim:	comp
	vsim -c tb_top -l run_data/sim.log -do \
	"add wave -r /*; view wave; view structure; view signals; run -all; quit"
all:	sim
clean:
	rm -rf work
	rm -rf run_data
	rm -rf vsim.wlf
