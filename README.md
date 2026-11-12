# Project_AESminiSoC — Design Verification (UVM)

## 📁 Estrutura do Repositório
```text
Project_AESminiSoC/
├── README.md                                  # Documentação principal do projeto
├── tb_architecture.png                        # Diagrama da arquitetura do Testbench UVM
└── AULA10_Project_AESminiSoC/
    ├── Deliverables/                          # Documentação formal e entregáveis
    │   ├── CI-Expert_Fase2_Verification_Plan.docx        # Plano de verificação preenchido
    │   ├── CI-Expert_Fase2_Verification_Plan_BACKUP.docx # Backup do plano
    │   └── ...
    ├── DV_BlockGuide_MiniSoCAES_v1.0.0.pdf   # Guia e especificação de blocos do SoC
    └── minisoc-tag-v1.0.0/                    # Código-fonte
        └── minisoc-tag-v1.0/
            ├── frontend/rtl/                  # RTL do DUT (minisoc_top, aes, spi, pll, mem)
            └── verif/tb/                      # Ambiente de Verificação UVM
                ├── agents/                    # Agentes UVM
                │   ├── clock_agent/           # Agente de Clock UVM
                │   │   ├── clock_if.sv        # Interface física (2 GHz e 100 MHz)
                │   │   ├── clock_item.sv      # Transação de clock (uvm_sequence_item)
                │   │   ├── clock_agent_config.sv # Configuração do agente (Active/Passive)
                │   │   ├── clock_driver.sv    # Driver de oscilação contínua dos clocks
                │   │   ├── clock_monitor.sv   # Monitor de verificação de período ($realtime)
                │   │   ├── clock_sequencer.sv # Sequencer de clock
                │   │   └── clock_pkg.sv       # Package do clock_agent
                │   └── rst_agent/             # Agente de Reset UVM
                │       ├── rst_if.sv          # Interface física de reset (rst_n)
                │       ├── rst_item.sv        # Transação de reset
                │       ├── rst_agent_config.sv# Configuração do rst_agent
                │       ├── rst_driver.sv      # Driver de acionamento do reset
                │       ├── rst_sequencer.sv   # Sequencer de reset
                │       └── rst_pkg.sv         # Package do rst_agent
                ├── env/                       # Environment UVM
                │   ├── minisoc_env.sv         # Instanciação e amarração dos agentes
                │   └── env_pkg.sv             # Package do environment
                ├── sequences/                 # Biblioteca de Sequências UVM
                │   ├── minisoc_reset_seq.sv   # Sequência de inicialização e pulso de reset
                │   └── seq_pkg.sv             # Package de sequências
                ├── tests/                     # Suíte de Testes UVM
                │   ├── minisoc_base_test.sv   # Teste base com configuração de infraestrutura
                │   ├── minisoc_smoke_test.sv  # Smoke test de validação de Clock & Reset
                │   └── test_pkg.sv            # Package de testes
                ├── refmod/                    # Golden Model C/C++ (DPI-C)
                ├── top_assertions.sv          # Asserções SVA de protocolo
                ├── top_tb.sv                  # Top-level de simulação UVM com tie-offs
                └── Makefile                   # Scripts de compilação e execução
