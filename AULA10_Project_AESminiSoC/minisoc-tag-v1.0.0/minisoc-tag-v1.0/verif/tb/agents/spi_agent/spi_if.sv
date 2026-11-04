interface spi_if;

//sinais físicos do barramento SPI

logic sclk; //Clock serial SPI (frequência máxima: 25 MHz)
logic cs_n;//Chip Select ativo em nível baixo (0 = selecionado, 1 = idle)
logic mosi;//Master Out Slave In (Testbench -> DUT)
logic miso; //Master In Slave Out (DUT -> Testbench)
      
endinterface : spi_if







