

class clock_monitor extends uvm_monitor;
`uvm_component_utils(clock_monitor)


virtual clock_if vif;
uvm_analysis_port #(clock_item) ap;

function new(string name= "clock_monitor", uvm_component parent = null);
 super.new(name, parent);
 ap = new("ap", this);

endfunction

 task run_phase(uvm_phase phase);
    time t_rise_clk_1, t_rise_clk_2;
    clock_item item;

// Checagem defensiva: garante que o agente conectou a interface
    if (vif == null) begin
      `uvm_fatal("CLK_MON", "Interface virtual 'clock_if' não foi conectada pelo clock_agent!")
    end

    // Aguarda e mede o período do primeiro ciclo de clk (2 GHz)
    @(posedge vif.clk);
    t_rise_clk_1 = $realtime;
    @(posedge vif.clk);
    t_rise_clk_2 = $realtime;

    item = clock_item::type_id::create("item");
    item.clk_half_period_ps = (t_rise_clk_2 - t_rise_clk_1) / 2;
    `uvm_info("CLK_MON", $sformatf("Clock de referência (clk) detectado: período medido = %0t", (t_rise_clk_2 - t_rise_clk_1)), UVM_HIGH)
    ap.write(item);
  endtask




endclass : clock_monitor