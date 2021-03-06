-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm_workspace\models\hdl_prj\OFDM_tx\hdlsrc\OFDM_Tx_Rx_fixed_point\ofdm_tx_src_ToComplex1.vhd
-- Created: 2021-02-02 15:48:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_ToComplex1
-- Source Path: OFDM_Tx_Rx_fixed_point/OFDMTx/DataGenerator/PilotGen/ToComplex1
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_ToComplex1 IS
  PORT( In1                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        PilotOut_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        PilotOut_im                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_tx_src_ToComplex1;


ARCHITECTURE rtl OF ofdm_tx_src_ToComplex1 IS

  -- Signals
  SIGNAL Constant1_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  Constant1_out1 <= to_signed(16#0000#, 16);

  PilotOut_im <= std_logic_vector(Constant1_out1);

  PilotOut_re <= In1;

END rtl;

