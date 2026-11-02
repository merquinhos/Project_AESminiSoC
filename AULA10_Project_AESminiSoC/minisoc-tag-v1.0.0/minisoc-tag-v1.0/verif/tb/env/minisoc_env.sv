

class minisoc_env extends uvm_env;
`uvm_component_utils(minisoc_env)

clock_agent clk_agt;
rst_agent rst_agt;

function new(string name = "minisoc_env", uvm_component parent = null);
    super.new(name, parent);
endfunction    

function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    `uvm_info("ENV", "Instanciando clock_agent e rst_agent...", UVM_LOW)
    clk_agt = clock_agent::type_id::create("clk_agt", this);
    rst_agt = rst_agent::type_id::create("rst_agt", this);
endfunction

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction



endclass : minisoc_env

