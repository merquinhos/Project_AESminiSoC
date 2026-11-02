

 //Description: Driver UVM para geração contínua dos clocks clk e mem_clk.
class clock_driver extends uvm_driver #(clock_item);
`uvm_component_utils(clock_driver)

virtual clock_if vif;
clock_agent_config cfg;

time clk_half_period_ps;
time mem_half_period_ps;

function new(string name = "clock_driver", uvm_component parent = null);
    super.new(name,parent);
    
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual clock_if) :: get(this, "", "vif", vif))begin
        `uvm_fatal("CLK_DRV", "Não foi possível obter a interface virtual 'clock_if' do uvm_config_db")

    end

    if(!uvm_config_db#(clock_agent_config)::get(this, "", "cfg", cfg)) begin
        cfg = clock_agent_config::type_id::create("cfg");
    end

    clk_half_period_ps = cfg.clk_half_period_ps;
    mem_half_period_ps = cfg.mem_half_period_ps;
endfunction

task run_phase(uvm_phase phase);
    `uvm_info("Ckl_DRV", $sformatf("Iniciando geração de clock: ref_clk half_period=%0d ps (2 GHz), mem_clk_half_period=%0d ps (100 MHz)" , clk_half_period_ps, mem_half_period_ps), UVM_LOW)
    fork
      generate_ref_clk();
      generate_mem_clk();
      get_items_loop();
    join
endtask //automatic

 task generate_ref_clk();
    vif.clk = 1'b0;
    forever begin
      #(clk_half_period_ps * 1ps);
      vif.clk = ~vif.clk;
    end
  endtask

  task generate_mem_clk();
    vif.mem_clk = 1'b0;
    forever begin
      #(mem_half_period_ps * 1ps);
      vif.mem_clk = ~vif.mem_clk;
    end
  endtask

  task get_items_loop();
    clock_item item;
    forever begin
      seq_item_port.get_next_item(item);
      if (item.clk_half_period_ps > 0)
        clk_half_period_ps = item.clk_half_period_ps;
      if (item.mem_half_period_ps > 0)
        mem_half_period_ps = item.mem_half_period_ps;
      seq_item_port.item_done();
    end
  endtask
endclass : clock_driver