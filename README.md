# Project_AESminiSoC — Design Verification (UVM)

## 📁 Estrutura do Repositório
```text
Project_AESminiSoC/
├── README.md                                  # Documentação principal e guia de uso do projeto
├── tb_architecture_4agents.png                        # Diagrama da arquitetura do Testbench UVM
└── AULA10_Project_AESminiSoC/
    ├── Deliverables/                          # Documentação formal e entregáveis do projeto
    │   ├── CI-Expert_Fase2_Verification_Plan.docx   # Plano de verificação formal (VPLAN)
    ├── DV_BlockGuide_MiniSoCAES_v1.0.0.pdf   # Guia e especificação de blocos do SoC
    └── minisoc-tag-v1.0.0/                    # Base de código
        └── minisoc-tag-v1.0/
            ├── frontend/rtl/                  # RTL do DUT (minisoc_top, aes, spi, pll, mem)
            └── verif/tb/                      # Ambiente de Verificação UVM
                ├── agents/                    # Agentes UVM (VIPs)
                │   ├── clock_agent/           # Agente de Clock de Referência (2 GHz)
                │   │   ├── clock_if.sv              # Interface física passiva de clock (clk - 2 GHz)
                │   │   ├── clock_item.sv            # Transação de clock (uvm_sequence_item)
                │   │   ├── clock_agent_config.sv    # Configuração do agente (Active/Passive)
                │   │   ├── clock_driver.sv          # Driver de oscilação contínua (250 ps)
                │   │   ├── clock_monitor.sv         # Monitor de medição de período ($realtime)
                │   │   ├── clock_sequencer.sv       # Sequencer de clock
                │   │   └── clock_pkg.sv             # Package do clock_agent
                │   ├── rst_agent/             # Agente de Reset do Sistema (rst_n)
                │   │   ├── rst_if.sv                # Interface física passiva de reset (rst_n)
                │   │   ├── rst_item.sv              # Transação de reset com constraints
                │   │   ├── rst_agent_config.sv      # Configuração do rst_agent
                │   │   ├── rst_driver.sv            # Driver de acionamento do reset
                │   │   ├── rst_monitor.sv           # Monitor de pulso e transições do reset [NOVO]
                │   │   ├── rst_sequencer.sv         # Sequencer de reset
                │   │   └── rst_pkg.sv               # Package do rst_agent
                │   └── spi_agent/             # Agente SPI Slave [NOVO - Checkpoint 2]
                │       ├── spi_if.sv                # Interface física SPI (sclk, cs_n, mosi, miso)
                │       └── spi_item.sv              # Transação de frame SPI (40 bits)
                ├── env/                       # Environment UVM
                │   ├── minisoc_env.sv               # Instanciação e amarração dos agentes
                │   └── env_pkg.sv                   # Package do environment
                ├── sequences/                 # Biblioteca de Sequências UVM
                │   ├── minisoc_clock_seq.sv         # Sequência de inicialização do clock [NOVA]
                │   ├── minisoc_reset_seq.sv         # Sequência de inicialização e pulso de reset
                │   └── seq_pkg.sv                   # Package de sequências
                ├── tests/                     # Suíte de Testes UVM
                │   ├── minisoc_base_test.sv         # Teste base com timeout e infraestrutura
                │   ├── minisoc_smoke_test.sv        # Smoke test de validação de Clock & Reset
                │   └── test_pkg.sv                  # Package de testes
                ├── refmod/                    # Golden Model C/C++ (DPI-C)
                ├── top_assertions.sv          # Asserções SVA de protocolo
                ├── top_tb.sv                  # Top-level de simulação com tie-offs e config_db
                └── Makefile                   # Scripts de compilação e execução Synopsys VCS
