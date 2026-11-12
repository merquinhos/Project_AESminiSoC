
class rst_monitor extends uvm_monitor;
  `uvm_component_utils(rst_monitor)

  virtual rst_if vif;
  uvm_analysis_port #(rst_item) ap;

  function new(string name = "rst_monitor", uvm_component parent = null);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  task run_phase(uvm_phase phase);
  endtask
endclass