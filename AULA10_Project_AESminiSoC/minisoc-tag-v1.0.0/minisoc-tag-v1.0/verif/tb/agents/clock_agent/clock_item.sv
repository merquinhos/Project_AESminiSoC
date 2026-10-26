
  //Description: Item de transação para controle de parâmetros de clock.

class clock_item extends uvm_sequence_item;
 'uvm_object_utils(clock_item)

rand time clk_half_period_ps; // Meio-período do clock de 2 GHz em picosegundos
rand time mem_half_period_ps; // Meio-período do clock da memória em picosegund

rand bit enable_clk; // 1 = liga o clock de 2 GHz, 0 = desliga
rand bit enable_mem_clk; // 1 = liga o clock de memória, 0 = desliga

constraint c_default_clk {
clk_half_period_ps == 250;  // 250 ps (gera 2 GHz)
mem_half_period_ps ==  5000 // 5000 ps = 5 ns (gera 100 MHz)
enable_clk == 1'b1 ;
enable_mem_clk == 1'b1;
}   

function new(string name = "clock_item");
    super.new(name);
    clk_half_period_ps == 250;  
    mem_half_period_ps ==  5000 
    enable_clk == 1'b1 ;
    enable_mem_clk == 1'b1;


endclass : clock_item
