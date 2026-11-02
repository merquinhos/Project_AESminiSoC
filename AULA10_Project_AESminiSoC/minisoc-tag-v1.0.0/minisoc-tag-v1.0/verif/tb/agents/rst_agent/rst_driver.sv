
class rst_driver extends uvm_driver#(rst_item);
`uvm_component_utils(rst_driver)

virtual rst_if vif;
rst_agent_config cfg;

function new(string name = "rst_driver", uvm_component parent = null);
    super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual rst_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("RST_DRV", "Não foi possível obter a interface virtual 'rst_if' do uvm_config_db")
    end

    if (!uvm_config_db#(rst_agent_config)::get(this, "", "cfg", cfg)) begin
      cfg = rst_agent_config::type_id::create("cfg");
    end
endfunction

task run_phase(uvm_phase phase);
    rst_item item;

    // Garante que liga em reset
    vif.rst_n = 1'b0;

    forever begin
      seq_item_port.get_next_item(item);

      if (item.assert_reset) begin
        `uvm_info("RST_DRV", $sformatf("Aplicando reset rst_n = 0 por %0d ns", item.duration_ns), UVM_LOW)
        vif.rst_n = 1'b0;
        #(item.duration_ns * 1ns);
        vif.rst_n = 1'b1;
        `uvm_info("RST_DRV", "Reset desativado: rst_n = 1 (DUT em operação normal)", UVM_LOW)
      end

      seq_item_port.item_done();
    end
endtask
endclass :  rst_driver