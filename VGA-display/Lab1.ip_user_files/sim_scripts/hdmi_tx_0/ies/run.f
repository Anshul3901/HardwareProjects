-makelib ies_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab1.srcs/sources_1/ip/hdmi_tx_0/hdl/encode.v" \
  "../../../../Lab1.srcs/sources_1/ip/hdmi_tx_0/hdl/serdes_10_to_1.v" \
  "../../../../Lab1.srcs/sources_1/ip/hdmi_tx_0/hdl/srldelay.v" \
  "../../../../Lab1.srcs/sources_1/ip/hdmi_tx_0/hdl/hdmi_tx_v1_0.v" \
  "../../../../Lab1.srcs/sources_1/ip/hdmi_tx_0/sim/hdmi_tx_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

