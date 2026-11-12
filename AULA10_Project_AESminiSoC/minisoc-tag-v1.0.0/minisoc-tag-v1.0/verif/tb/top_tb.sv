`timescale 1ps/1ps

module top_tb;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import clock_pkg::*;
  import rst_pkg::*;
  import env_pkg::*;
  import test_pkg::*;

  // --------------------------------------------------------------------------
  // Interfaces físicas de Clock e Reset
  // --------------------------------------------------------------------------
  clock_if clk_if();
  rst_if   rst_if();

 
 logic spi_sclk;
  logic spi_cs_n;
  logic spi_mosi;
  logic spi_miso;

  logic mem_clk;
  logic [31:0] mem_i_data;
  logic mem_i_wr_en;
  logic [9:0] mem_i_addr;
  logic [31:0] mem_o_data;

  assign spi_sclk = 1'b0;
  assign spi_cs_n = 1'b1; // Inativo
  assign spi_mosi = 1'b0;

  assign mem_clk = 1'b0; // mem_clk será controlado pelo mem_agent
  assign mem_i_data = 32'b0;
  assign mem_i_wr_en = 1'b0;
  assign mem_i_addr = 10'b0;

  // --------------------------------------------------------------------------
  // Instanciação do Design Under Test (DUT)
  // --------------------------------------------------------------------------
  minisoc_top dut (
    .clk(clk_if.clk),
    .rst_n(rst_if.rst_n),

    .spi_sclk(spi_sclk),
    .spi_cs_n(spi_cs_n),
    .spi_mosi(spi_mosi),
    .spi_miso(spi_miso),

    .mem_clk(mem_clk),
    .mem_i_data (mem_i_data),
    .mem_i_wr_en(mem_i_wr_en),
    .mem_i_addr (mem_i_addr),
    .mem_o_data (mem_o_data)
  );

  // --------------------------------------------------------------------------
  // Configuração UVM e disparo da simulação
  // --------------------------------------------------------------------------
  initial begin
    // Publica as interfaces virtuais no banco de dados de configuração UVM
    uvm_config_db#(virtual clock_if)::set(null, "*clk_agt*", "vif", clk_if);
    uvm_config_db#(virtual rst_if)::set(null, "*rst_agt*",   "vif", rst_if);

    // Habilita dump de ondas 
    if ($test$plusargs("DUMP")) begin
      $dumpfile("dump.vcd");
      $dumpvars(0, top_tb);
    end

    // Inicia a execução UVM
    run_test();
  end

endmodule : top_tb