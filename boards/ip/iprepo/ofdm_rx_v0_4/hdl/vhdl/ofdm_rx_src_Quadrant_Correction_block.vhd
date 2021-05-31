-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\OFDM_rx\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_Quadrant_Correction_block.vhd
-- Created: 2021-02-25 17:36:53
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_Quadrant_Correction_block
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_2/PhaseEst/Complex to Magnitude-Angle HDL Optimized/Quadrant_Correction
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_Quadrant_Correction_block IS
  PORT( zin                               :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En18
        QA_Control                        :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        zout                              :   OUT   std_logic_vector(20 DOWNTO 0)  -- sfix21_En18
        );
END ofdm_rx_src_Quadrant_Correction_block;


ARCHITECTURE rtl OF ofdm_rx_src_Quadrant_Correction_block IS

  -- Signals
  SIGNAL QA_Control_unsigned              : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL xyNegative                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL AbsRel                           : std_logic;  -- ufix1
  SIGNAL pidivtwo                         : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL zin_signed                       : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL zCast                            : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL pivdivtwosubout                  : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL mux1out                          : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL Negation_cast                    : signed(21 DOWNTO 0);  -- sfix22_En18
  SIGNAL Negation_cast_1                  : signed(21 DOWNTO 0);  -- sfix22_En18
  SIGNAL Negation_cast_2                  : signed(22 DOWNTO 0);  -- sfix23_En18
  SIGNAL mux1out_negate                   : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL pionepos                         : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL pi_subtraction                   : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL pioneneg                         : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL negpi_addition                   : signed(20 DOWNTO 0);  -- sfix21_En18
  SIGNAL mux2out                          : signed(20 DOWNTO 0);  -- sfix21_En18

BEGIN
  QA_Control_unsigned <= unsigned(QA_Control);

  xyNegative <= QA_Control_unsigned(1 DOWNTO 0);

  AbsRel <= QA_Control_unsigned(2);

  pidivtwo <= to_signed(16#06487E#, 21);

  zin_signed <= signed(zin);

  zCast <= resize(zin_signed, 21);

  pivdivtwosubout <= pidivtwo - zCast;

  
  mux1out <= pivdivtwosubout WHEN AbsRel = '0' ELSE
      zCast;

  Negation_cast <= resize(mux1out, 22);
  Negation_cast_1 <=  - (Negation_cast);
  Negation_cast_2 <= resize(Negation_cast_1, 23);
  mux1out_negate <= Negation_cast_2(20 DOWNTO 0);

  pionepos <= to_signed(16#0C90FD#, 21);

  pi_subtraction <= pionepos - mux1out;

  pioneneg <= to_signed(-16#0C90FE#, 21);

  negpi_addition <= pioneneg + mux1out;

  
  mux2out <= mux1out WHEN xyNegative = to_unsigned(16#0#, 2) ELSE
      mux1out_negate WHEN xyNegative = to_unsigned(16#1#, 2) ELSE
      pi_subtraction WHEN xyNegative = to_unsigned(16#2#, 2) ELSE
      negpi_addition;

  zout <= std_logic_vector(mux2out);

END rtl;

