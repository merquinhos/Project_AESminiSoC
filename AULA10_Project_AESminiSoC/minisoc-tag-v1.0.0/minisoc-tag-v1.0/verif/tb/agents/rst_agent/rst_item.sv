

class rst_item extends uvm_sequence_item;
`uvm_object_utils(rst_item)
rand int unsigned duration_ns;
rand bit assert_reset;

constraint c_default_rst {
duration_ns inside {[10:50]};
assert_reset == 1'b1;

}

function new(string name = "rst_item");
    super.new(name);
    duration_ns  = 20;
    assert_reset = 1'b1;
  endfunction

endclass : rst_item