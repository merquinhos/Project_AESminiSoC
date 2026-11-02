class rst_agent_config extends uvm_object;
`uvm_object_utils(rst_agent_config)

uvm_active_passive_enum is_active = UVM_ACTIVE;
int unsigned default_duration_ns  = 20;

function new(string name = "rst_agent_config");
    super.new(name);
endfunction

endclass : rst_agent_config







