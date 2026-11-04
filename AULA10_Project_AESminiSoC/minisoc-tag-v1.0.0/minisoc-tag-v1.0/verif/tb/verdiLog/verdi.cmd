simSetSimulator "-vcssv" -exec "./simv" -args \
           "+UVM_TESTNAME=minisoc_smoke_test +UVM_VERBOSITY=UVM_LOW" -uvmDebug \
           on -simDelim
debImport "-i" "-simflow" "-dbdir" "./simv.daidir"
srcTBInvokeSim
verdiSetActWin -dock widgetDock_<Member>
verdiWindowResize -win $_Verdi_1 "601" "117" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_InteractiveConsole_2
verdiWindowResize -win $_Verdi_1 "646" "91" "900" "700"
srcHBSelect "top_tb.dut" -win $_nTrace1
srcSetScope "top_tb.dut" -delim "." -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top_tb.dut" -win $_nTrace1
srcSetScope "top_tb.dut" -delim "." -win $_nTrace1
srcHBSelect "top_tb" -win $_nTrace1
srcSetScope "top_tb" -delim "." -win $_nTrace1
srcHBSelect "top_tb.dut" -win $_nTrace1
srcSetScope "top_tb.dut" -delim "." -win $_nTrace1
wvCreateWindow
verdiSetActWin -win $_nWave3
srcHBSelect "top_tb.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBDrag -win $_nTrace1
wvDumpScope "top_tb.dut"
wvSetPosition -win $_nWave3 {("dut" 0)}
wvRenameGroup -win $_nWave3 {G1} {dut}
wvAddSignal -win $_nWave3 "/top_tb/dut/clk" "/top_tb/dut/rst_n" \
           "/top_tb/dut/spi_sclk" "/top_tb/dut/spi_cs_n" \
           "/top_tb/dut/spi_mosi" "/top_tb/dut/spi_miso" "/top_tb/dut/mem_clk" \
           "/top_tb/dut/mem_i_data\[31:0\]" "/top_tb/dut/mem_i_wr_en" \
           "/top_tb/dut/mem_i_addr\[9:0\]" "/top_tb/dut/mem_o_data\[31:0\]"
wvSetPosition -win $_nWave3 {("dut" 0)}
wvSetPosition -win $_nWave3 {("dut" 11)}
wvSetPosition -win $_nWave3 {("dut" 11)}
verdiSetActWin -win $_nWave3
verdiSetActWin -dock widgetDock_<Watch>
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiSetActWin -win $_InteractiveConsole_2
run
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiSetActWin -win $_nWave3
wvSelectSignal -win $_nWave3 {( "dut" 4 )} 
wvSelectSignal -win $_nWave3 {( "dut" 4 )} 
wvSelectSignal -win $_nWave3 {( "dut" 4 )} 
wvSelectSignal -win $_nWave3 {( "dut" 4 )} 
wvSelectGroup -win $_nWave3 {G2}
wvSetCursor -win $_nWave3 119854.823156 -snap {("dut" 7)}
wvScrollUp -win $_nWave3 4
wvSelectSignal -win $_nWave3 {( "dut" 1 )} 
wvSetCursor -win $_nWave3 119253.349431 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 119496.293007 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 119373.833643 -snap {("dut" 3)}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvSetCursor -win $_nWave3 308.123560 -snap {("dut" 3)}
wvZoomAll -win $_nWave3
wvSetCursor -win $_nWave3 18283.211679 -snap {("dut" 2)}
wvSetCursor -win $_nWave3 5013.138686 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 15334.306569 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 5308.029197 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 16513.868613 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 10321.167883 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 5013.138686 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 14449.635036 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 1474.452555 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 14744.525547 -snap {("dut" 7)}
wvSetCursor -win $_nWave3 10026.277372 -snap {("dut" 7)}
wvZoom -win $_nWave3 0.000000 9141.605839
wvSetCursor -win $_nWave3 177.938800 -snap {("dut" 1)}
wvZoom -win $_nWave3 0.000000 133.454100
wvSetCursor -win $_nWave3 4.545882 -snap {("dut" 1)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 17.858821
wvZoomAll -win $_nWave3
wvZoom -win $_nWave3 0.000000 3538.686131
wvSetCursor -win $_nWave3 215.248548 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 482.156748 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 714.625180 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 1007.363205
wvSetCursor -win $_nWave3 1007.363205 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 499.376632 -snap {("dut" 1)}
srcHBSelect "top_tb.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvCreateWindow
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 \
           {/home/joao.farias/aula_10/AULA10_Project_AESminiSoC/minisoc-tag-v1.0.0/minisoc-tag-v1.0/verif/tb/inter.fsdb}
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave4
verdiSetActWin -win $_nWave4
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
srcTBSimReset
debExit
