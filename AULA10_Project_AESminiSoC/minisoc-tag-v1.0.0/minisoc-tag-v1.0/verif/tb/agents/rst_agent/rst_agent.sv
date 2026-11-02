

class rst_agent extends uvm_agent;
`uvm_component_utils(rst_agent)


rst_agent_config cfg;
rst_driver driver;
rst_sequencer sequencer;

function new(string name = "rst_agent", uvm_component parent = null);
    super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(rst_agent_config)::get(this, "", "cfg", cfg)) begin
      cfg = rst_agent_config::type_id::create("cfg");
    end

    if (cfg.is_active == UVM_ACTIVE) begin
      driver    = rst_driver::type_id::create("driver", this);
      sequencer = rst_sequencer::type_id::create("sequencer", this);
    end
endfunction

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (cfg.is_active == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
endfunction

endclass : rst_agent