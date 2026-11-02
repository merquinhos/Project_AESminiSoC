

class clock_agent_config extends uvm_object;
`uvm_object_utils(clock_agent_config)

uvm_active_passive_enum is_active = UVM_ACTIVE;

 time clk_half_period_ps = 250;   // 2 GHz (500 ps)
time mem_half_period_ps = 5000;  // 100 MHz (10 ns)

function new(string name = "clock_agent_config");
super.new(name);
endfunction

endclass : clock_agent_config