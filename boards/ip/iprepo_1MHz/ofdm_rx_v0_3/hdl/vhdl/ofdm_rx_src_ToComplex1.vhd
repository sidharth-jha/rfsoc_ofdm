-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_ToComplex1.vhd
-- Created: 2021-05-06 12:53:37
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_ToComplex1
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_1/PilotCtrlGen/pilotGen/ToComplex1
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_ToComplex1 IS
  PORT( In1                               :   IN    std_logic_vector(1 DOWNTO 0);  -- sfix2
        Out1_re                           :   OUT   std_logic_vector(1 DOWNTO 0);  -- sfix2
        Out1_im                           :   OUT   std_logic_vector(1 DOWNTO 0)  -- sfix2
        );
END ofdm_rx_src_ToComplex1;


ARCHITECTURE rtl OF ofdm_rx_src_ToComplex1 IS

  -- Signals
  SIGNAL Constant1_out1                   : signed(1 DOWNTO 0);  -- sfix2

BEGIN
  Constant1_out1 <= to_signed(16#0#, 2);

  Out1_im <= std_logic_vector(Constant1_out1);

  Out1_re <= In1;

END rtl;

