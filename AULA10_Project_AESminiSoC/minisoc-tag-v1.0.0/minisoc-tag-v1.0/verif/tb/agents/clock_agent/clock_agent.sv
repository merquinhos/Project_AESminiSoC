

class clock_agent extends uvm_agent;
`uvm_component_utils(clock_agent)

clock_agent_config cfg;
clock_driver driver;
clock_monitor monitor;
clock_sequencer sequencer;

function new(string name = "clock_agent", uvm_component parent = null);
    super.new(name, parent);
endfunction


function void build_phase(uvm_phase phase);
super.build_phase(phase);

if (!uvm_config_db#(clock_agent_config)::get(this, "", "cfg", cfg)) begin
    cfg = clock_agent_config::type_id::create("cfg");
    end

monitor = clock_monitor::type_id::create("monitor", this);

if (cfg.is_active == UVM_ACTIVE) begin
    driver    = clock_driver::type_id::create("driver", this);
    sequencer = clock_sequencer::type_id::create("sequencer", this);
    end
endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (cfg.is_active == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction

endclass