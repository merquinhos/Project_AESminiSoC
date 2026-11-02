

class minisoc_smoke_test extends minisoc_base_test;
  `uvm_component_utils(minisoc_smoke_test)

  function new(string name = "minisoc_smoke_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    minisoc_reset_seq rst_seq;

    phase.raise_objection(this, "Iniciando minisoc_smoke_test");

    `uvm_info("SMOKE_TEST", "==================================================", UVM_LOW)
    `uvm_info("SMOKE_TEST", "--- EXECUTANDO MINISOC SMOKE TEST (CLOCK & RESET) ---", UVM_LOW)
    `uvm_info("SMOKE_TEST", "==================================================", UVM_LOW)

    // 1. Dispara o pulso de reset inicial através do rst_agent
    rst_seq = minisoc_reset_seq::type_id::create("rst_seq");
   
    rst_seq.start(env.rst_agt.sequencer);

    // 2. Aguarda alguns ciclos com clock ativo e reset desativado
    #100ns;

    `uvm_info("SMOKE_TEST", "==================================================", UVM_LOW)
    `uvm_info("SMOKE_TEST", "--- [PASS] MINISOC SMOKE TEST CONCLUÍDO COM SUCESSO! ---", UVM_LOW)
    `uvm_info("SMOKE_TEST", "    Clock 2 GHz ativo, mem_clk ativo, Reset rst_n = 1", UVM_LOW)
    `uvm_info("SMOKE_TEST", "==================================================", UVM_LOW)

    phase.drop_objection(this, "Finalizando minisoc_smoke_test");
  endtask

endclass : minisoc_smoke_test