

package clock_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

//segue uma ordem
`include "clock_item.sv"
`include "clock_agent_config.sv"
`include "clock_sequencer.sv"
`include "clock_driver.sv"
`include "clock_monitor.sv"
`include "clock_agent.sv"

endpackage