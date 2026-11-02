

class minisoc_reset_seq extends uvm_sequence #(rst_item);
 `uvm_object_utils(minisoc_reset_seq)

  rand int unsigned duration_ns;

  constraint c_dur {
    duration_ns == 20; // 20 ns de pulso de reset
  }

  function new(string name = "minisoc_reset_seq");
    super.new(name);
    duration_ns = 20;
  endfunction

task body();
    rst_item item;
    `uvm_info("RESET_SEQ", $sformatf("Iniciando sequence de reset (duração = %0d ns)...", duration_ns), UVM_LOW)
    
    item = rst_item::type_id::create("item"); 
    start_item(item);
    item.duration_ns  = duration_ns;
    item.assert_reset = 1'b1;
    finish_item(item);

    `uvm_info("RESET_SEQ", "Sequence de reset concluída!", UVM_LOW)
  endtask


endclass : minisoc_reset_seq