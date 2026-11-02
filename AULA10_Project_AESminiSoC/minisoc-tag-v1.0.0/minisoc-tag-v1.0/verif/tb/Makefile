# ==============================================================================
# Makefile para Simulação UVM do MiniSoC AES (Synopsys VCS)
# ==============================================================================

TEST ?= minisoc_smoke_test
VERBOSITY ?= UVM_LOW
SEED ?= random

# Caminhos dos arquivos RTL
RTL_DIR = ../../frontend/rtl
RTL_FILES = \
	$(RTL_DIR)/minisoc_aes/minisoc_aes_dp.sv \
	$(RTL_DIR)/minisoc_aes/minisoc_aes_key_exp.sv \
	$(RTL_DIR)/minisoc_aes/minisoc_aes_top.sv \
	$(RTL_DIR)/minisoc_mem/minisoc_memory.sv \
	$(RTL_DIR)/minisoc_pll/minisoc_pll_mock.sv \
	$(RTL_DIR)/minisoc_spi/minisoc_spi.sv \
	$(RTL_DIR)/minisoc_top.sv

# Caminhos e pacotes do Testbench UVM
TB_INCDIRS = \
	+incdir+./agents/clock_agent \
	+incdir+./agents/rst_agent \
	+incdir+./env \
	$(TB_INCDIRS_EXTRA) \
	+incdir+./sequences \
	+incdir+./tests

TB_FILES = \
	./agents/clock_agent/clock_if.sv \
	./agents/clock_agent/clock_pkg.sv \
	./agents/rst_agent/rst_if.sv \
	./agents/rst_agent/rst_pkg.sv \
	./env/env_pkg.sv \
	./sequences/seq_pkg.sv \
	./tests/test_pkg.sv \
	./top_tb.sv

# Flags de Compilação do VCS
VCS_FLAGS = \
	-full64 \
	-sverilog \
	-ntb_opts uvm \
	-timescale=1ps/1ps \
	-debug_access+all \
	-kdb \
	-l vcs_compile.log \
	$(TB_INCDIRS)

# Targets principais
compile:
	vcs $(VCS_FLAGS) $(RTL_FILES) $(TB_FILES)

sim:
	./simv +UVM_TESTNAME=$(TEST) +UVM_VERBOSITY=$(VERBOSITY) +ntb_random_seed=$(SEED) -l sim_$(TEST).log

gui:
	./simv -gui +UVM_TESTNAME=$(TEST) +UVM_VERBOSITY=$(VERBOSITY) &

clean:
	rm -rf csrc simv simv.daidir *.log *.key *.vpd ucli.key DVEfiles verdiLog *.fsdb novas.* dump.vcd

help:
	@echo "Targets disponíveis:"
	@echo "  make compile                - Compila o RTL e o ambiente UVM com VCS"
	@echo "  make sim TEST=<nome_teste>  - Executa a simulação (padrão: minisoc_smoke_test)"
	@echo "  make gui TEST=<nome_teste>  - Executa com interface gráfica (Verdi)"
	@echo "  make clean                  - Remove arquivos temporários de compilação"
