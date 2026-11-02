
`timescale 1ps/1ps
interface  rst_if;
    
    logic rst_n;


    initial begin
        
        rst_n = 1'b0; //chip nasce em reset
    end

endinterface : rst_if