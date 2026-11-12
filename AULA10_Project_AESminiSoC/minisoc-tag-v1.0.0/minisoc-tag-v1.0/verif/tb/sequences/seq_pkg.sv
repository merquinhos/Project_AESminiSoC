package seq_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import clock_pkg::*;
  import rst_pkg::*;

  `include "minisoc_clock_seq.sv"
  `include "minisoc_reset_seq.sv"

endpackage : seq_pkg