`timescale 1ps/1ps

module clock_simple_tb;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import clock_pkg::*; // Importa seu driver, monitor, item, etc.

  // 1. Instancia a interface física com os fios
  clock_if clk_if();

  initial begin
    // 2. Coloca o controle remoto dos fios (vif) na caixa postal do UVM
    uvm_config_db#(virtual clock_if)::set(null, "*", "vif", clk_if);

    // 3. Habilita a gravação de ondas para ver no visualizador
    $dumpfile("clock_dump.vcd");
    $dumpvars(0, clock_simple_tb);

    // 4. Inicia o teste UVM!
    run_test("clock_test");
  end

endmodule


class clock_test extends uvm_test;
  `uvm_component_utils(clock_test)
  clock_driver  drv;
  clock_monitor mon;
  function new(string name = "clock_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = clock_driver::type_id::create("drv", this);
    mon = clock_monitor::type_id::create("mon", this);
  endfunction
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #20ns; // Deixa o clock bater por 20 nanossegundos
    `uvm_info("TEST", "Teste de Clock finalizado com SUCESSO!", UVM_LOW)
    phase.drop_objection(this);
  endtask
endclass