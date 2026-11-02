


`timescale 1ps/1ps

interface clock_if;

logic clk;   // O driver UVM oscila com período de 500 ps (2 GHz)
logic mem_clk;  // O driver UVM oscila com período de 10.000 ps (100 MHz)

initial begin
    clk = 1'b0;
    mem_clk = 1'b0;

end


endinterface