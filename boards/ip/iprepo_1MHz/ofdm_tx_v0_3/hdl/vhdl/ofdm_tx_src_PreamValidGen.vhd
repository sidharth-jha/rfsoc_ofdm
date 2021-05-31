-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_PreamValidGen.vhd
-- Created: 2021-05-05 22:15:53
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_PreamValidGen
-- Source Path: OFDM_Tx_HW/OFDMTx/ControlSignalGenerator/PreamValidGen
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_PreamValidGen IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_256_0                       :   IN    std_logic;
        enable                            :   IN    std_logic;
        y                                 :   OUT   std_logic
        );
END ofdm_tx_src_PreamValidGen;


ARCHITECTURE rtl OF ofdm_tx_src_PreamValidGen IS

  -- Component Declarations
  COMPONENT ofdm_tx_src_RisingEdge
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_256_0                     :   IN    std_logic;
          In1                             :   IN    std_logic;
          Out1                            :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_tx_src_RisingEdge
    USE ENTITY work.ofdm_tx_src_RisingEdge(rtl);

  -- Signals
  SIGNAL NOT_out1                         : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL RisingEdge_out1                  : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous_iv : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous_out1 : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous_ectrl : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous_toDelay : std_logic;

BEGIN
  u_RisingEdge : ofdm_tx_src_RisingEdge
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_256_0 => enb_1_256_0,
              In1 => enable,
              Out1 => RisingEdge_out1
              );

  NOT_out1 <=  NOT enable;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 320
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#000#, 9);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        IF NOT_out1 = '1' THEN 
          HDL_Counter_out1 <= to_unsigned(16#000#, 9);
        ELSIF enable = '1' THEN 
          IF HDL_Counter_out1 >= to_unsigned(16#140#, 9) THEN 
            HDL_Counter_out1 <= to_unsigned(16#000#, 9);
          ELSE 
            HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#001#, 9);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#140#, 9) ELSE
      '0';

  Unit_Delay_Enabled_Resettable_Synchronous_iv <= '0';

  
  Unit_Delay_Enabled_Resettable_Synchronous_ectrl <= Unit_Delay_Enabled_Resettable_Synchronous_out1 WHEN RisingEdge_out1 = '0' ELSE
      enable;

  
  Unit_Delay_Enabled_Resettable_Synchronous_toDelay <= Unit_Delay_Enabled_Resettable_Synchronous_ectrl WHEN Compare_To_Constant_out1 = '0' ELSE
      Unit_Delay_Enabled_Resettable_Synchronous_iv;

  Unit_Delay_Enabled_Resettable_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        Unit_Delay_Enabled_Resettable_Synchronous_out1 <= Unit_Delay_Enabled_Resettable_Synchronous_toDelay;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous_lowered_process;


  y <= Unit_Delay_Enabled_Resettable_Synchronous_out1;

END rtl;
