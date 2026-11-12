


class clock_driver extends uvm_driver #(clock_item);
`uvm_component_utils(clock_driver)

virtual clock_if vif;

function new(string name = "clock_driver", uvm_component parent = null);
    super.new(name,parent);
endfunction

  task run_phase(uvm_phase phase);
    clock_item item;

    // Checagem defensiva: garante que o agente conectou a interface
    if (vif == null) begin
      `uvm_fatal("CLK_DRV", "Interface virtual 'clock_if' não foi conectada pelo clock_agent!")
    end

    // Estado inicial de repouso
    vif.clk = 1'b0;

  // Aguarda a sequence de clock dar o start
    seq_item_port.get_next_item(item);
    seq_item_port.item_done();
    `uvm_info("CLK_DRV", $sformatf("Iniciando geração de clock contínuo: ref_clk half_period=%0d ps (2 GHz)", item.clk_half_period_ps), UVM_LOW)

    // Oscilação contínua do clock de 2 GHz
    forever begin
      #(item.clk_half_period_ps * 1ps);
      vif.clk = ~vif.clk;
    end
  endtask

endclass : clock_driver