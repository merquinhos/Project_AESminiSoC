

class rst_agent extends uvm_agent;
`uvm_component_utils(rst_agent)


virtual rst_if vif;
rst_agent_config cfg;
rst_driver driver;
rst_sequencer sequencer;
rst_monitor monitor;

function new(string name = "rst_agent", uvm_component parent = null);
    super.new(name, parent);
endfunction

 function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // 1. O Agente obtém a interface física da gaveta
    if (!uvm_config_db#(virtual rst_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("RST_AGT", "Não foi possível obter a interface virtual 'rst_if' do uvm_config_db")
    end

    // 2. Obtém ou cria a configuração
    if (!uvm_config_db#(rst_agent_config)::get(this, "", "cfg", cfg)) begin
      cfg = rst_agent_config::type_id::create("cfg");
    end

    // 3. Monitor é sempre instanciado
    monitor = rst_monitor::type_id::create("monitor", this);

    // 4. Instancia driver e sequencer se o agente for ativo
    if (cfg.is_active == UVM_ACTIVE) begin
      driver    = rst_driver::type_id::create("driver", this);
      sequencer = rst_sequencer::type_id::create("sequencer", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // Conecta a interface física diretamente no Monitor
    monitor.vif = this.vif;

    // Se ativo, conecta o TLM e entrega a interface física ao Driver
    if (cfg.is_active == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
      driver.vif = this.vif;
    end
  endfunction
endclass : rst_agent