simSetSimulator "-vcssv" -exec "/home/st88/HW4/simv" -args
debImport "-dbdir" "/home/st88/HW4/simv.daidir"
debLoadSimResult /home/st88/HW4/waves.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "318" "82" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top.intf" -win $_nTrace1
srcHBSelect "top.intf" -win $_nTrace1
srcSetScope "top.intf" -delim "." -win $_nTrace1
srcHBSelect "top.intf" -win $_nTrace1
srcSignalViewSelect "top.intf.clk"
verdiSetActWin -dock widgetDock_<Signal_List>
srcSignalViewSelect "top.intf.clk" "top.intf.read"
srcSignalViewSelect "top.intf.clk" "top.intf.read" "top.intf.write"
srcSignalViewSelect "top.intf.clk" "top.intf.read" "top.intf.write" \
           "top.intf.addr\[15:0\]"
srcSignalViewSelect "top.intf.clk" "top.intf.read" "top.intf.write" \
           "top.intf.addr\[15:0\]" "top.intf.data_in\[7:0\]"
srcSignalViewSelect "top.intf.clk" "top.intf.read" "top.intf.write" \
           "top.intf.addr\[15:0\]" "top.intf.data_in\[7:0\]" \
           "top.intf.data_out\[8:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
srcSignalView -off
verdiDockWidgetMaximize -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiDockWidgetHide -dock windowDock_nWave_2
srcSignalView -on
srcSignalView -off
srcSignalView -on
verdiSetActWin -win $_OneSearch
verdiWindowBeWindow -win $_OneSearch
viaOneSearchClose
verdiSetActWin -dock widgetDock_<Signal_List>
debExit
