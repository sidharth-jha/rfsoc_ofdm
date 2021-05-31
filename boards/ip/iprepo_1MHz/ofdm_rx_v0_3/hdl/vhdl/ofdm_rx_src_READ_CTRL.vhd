-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_READ_CTRL.vhd
-- Created: 2021-05-06 12:53:37
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_READ_CTRL
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_1/DataArrange/READ_CTRL
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_READ_CTRL IS
  PORT( In1                               :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
        In2                               :   IN    std_logic;
        Out1                              :   OUT   std_logic_vector(6 DOWNTO 0)  -- ufix7
        );
END ofdm_rx_src_READ_CTRL;


ARCHITECTURE rtl OF ofdm_rx_src_READ_CTRL IS

  -- Signals
  SIGNAL Constant_out1                    : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL In1_unsigned                     : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Switch_out1                      : unsigned(6 DOWNTO 0);  -- ufix7

BEGIN
  Constant_out1 <= to_unsigned(16#00#, 7);

  In1_unsigned <= unsigned(In1);

  
  Switch_out1 <= Constant_out1 WHEN In2 = '0' ELSE
      In1_unsigned;

  Out1 <= std_logic_vector(Switch_out1);

END rtl;

