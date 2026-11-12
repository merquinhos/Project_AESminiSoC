

class minisoc_clock_seq extends uvm_sequence #(clock_item);
  `uvm_object_utils(minisoc_clock_seq)

  time clk_half_period_ps;

  function new(string name = "minisoc_clock_seq");
    super.new(name);
    clk_half_period_ps = 250; // 250 ps (2 GHz)
  endfunction

  task body();
    clock_item item;
    `uvm_info("CLK_SEQ", $sformatf("Disparando início do clock via sequence (half_period = %0d ps)...", clk_half_period_ps), UVM_LOW)

    item = clock_item::type_id::create("item");
    start_item(item);
    item.clk_half_period_ps = clk_half_period_ps;
    item.enable_clk = 1'b1;
    finish_item(item);

    `uvm_info("CLK_SEQ", "Clock iniciado com sucesso pelo driver!", UVM_LOW)
  endtask

endclass : minisoc_clock_seq
