package test_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import clock_pkg::*;
  import rst_pkg::*;
  import seq_pkg::*;
  import env_pkg::*;

  `include "minisoc_base_test.sv"
  `include "minisoc_smoke_test.sv"

endpackage : test_pkg