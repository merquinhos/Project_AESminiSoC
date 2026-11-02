


class clock_monitor extends uvm_monitor;
`uvm_component_utils(clock_monitor)


virtual clock_if vif;
uvm_analysis_port #(clock_item) ap;

function new(string name= "clock_monitor", uvm_component parent = null);
 super.new(name, parent);
 ap = new("ap", this);

endfunction

function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    if (!uvm_config_db#(virtual clock_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("CLK_MON", "Não foi possível obter a interface virtual 'clock_if' do uvm_config_db")
    end
endfunction

 task run_phase(uvm_phase phase);
    time t_rise_clk_1, t_rise_clk_2;
    clock_item item;

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