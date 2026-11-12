
class clock_item extends uvm_sequence_item;
 `uvm_object_utils(clock_item)

rand time clk_half_period_ps; // Meio-período do clock de 2 GHz em picosegundos
rand bit enable_clk; // 1 = liga o clock de 2 GHz, 0 = desliga

constraint c_default_clk {
clk_half_period_ps == 250;  // 250 ps (gera 2 GHz)
enable_clk == 1'b1 ;
}   

function new(string name = "clock_item");
    super.new(name);
    clk_half_period_ps = 250;  
    enable_clk = 1'b1 ;
endfunction
endclass : clock_item
