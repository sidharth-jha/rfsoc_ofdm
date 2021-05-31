-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\OFDM_rx\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_QUAD_DETERM1.vhd
-- Created: 2021-02-25 17:36:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_QUAD_DETERM1
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_1/CordicRotate/QUAD_MAP/QUAD_DETERM1
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_QUAD_DETERM1 IS
  PORT( ang_in                            :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
        ang_out                           :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
        QUAD                              :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
        );
END ofdm_rx_src_QUAD_DETERM1;


ARCHITECTURE rtl OF ofdm_rx_src_QUAD_DETERM1 IS

  -- Signals
  SIGNAL ang_in_signed                    : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL ang_out_tmp                      : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL QUAD_tmp                         : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  ang_in_signed <= signed(ang_in);

  lib_ofdmrx_c7_QUAD_DETERM1_output : PROCESS (ang_in_signed)
    VARIABLE QUAD1 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast : signed(23 DOWNTO 0);
    VARIABLE add_temp : signed(23 DOWNTO 0);
    VARIABLE sub_cast : signed(23 DOWNTO 0);
    VARIABLE sub_temp : signed(23 DOWNTO 0);
  BEGIN
    add_temp := to_signed(16#000000#, 24);
    sub_temp := to_signed(16#000000#, 24);
    add_cast := to_signed(16#000000#, 24);
    sub_cast := to_signed(16#000000#, 24);
    -- Process to determine quadrant and 
    -- shift into region -pi/2 to pi/2 if 
    -- not already there 
    -- Determine quadrant 
    IF (ang_in_signed >= to_signed(-16#1921FB#, 23)) AND (ang_in_signed <= to_signed(16#1921FB#, 23)) THEN 
      QUAD1 := to_unsigned(16#0#, 2);
      -- Quads 1 or 2
    ELSIF (ang_in_signed < to_signed(-16#1921FB#, 23)) AND (ang_in_signed >= to_signed(-16#3243F7#, 23)) THEN 
      QUAD1 := to_unsigned(16#1#, 2);
      -- Quad 3
    ELSIF (ang_in_signed > to_signed(16#1921FB#, 23)) AND (ang_in_signed <= to_signed(16#3243F7#, 23)) THEN 
      QUAD1 := to_unsigned(16#2#, 2);
      -- Quad 4
    ELSE 
      -- others clause
      QUAD1 := to_unsigned(16#0#, 2);
    END IF;
    -- Determine whether we need to add or subtract pi/2 
    -- based on quadrant location
    CASE QUAD1 IS
      WHEN "00" =>
        -- Angle stays the same 
        ang_out_tmp <= ang_in_signed;
      WHEN "01" =>
        -- pi/2 is added to angle (anti-clockwise)
        add_cast := resize(ang_in_signed, 24);
        add_temp := add_cast + to_signed(16#1921FB#, 24);
        IF (add_temp(23) = '0') AND (add_temp(22) /= '0') THEN 
          ang_out_tmp <= "01111111111111111111111";
        ELSIF (add_temp(23) = '1') AND (add_temp(22) /= '1') THEN 
          ang_out_tmp <= "10000000000000000000000";
        ELSE 
          ang_out_tmp <= add_temp(22 DOWNTO 0);
        END IF;
      WHEN "10" =>
        -- pi/2 is subtracted from angle (clockwise)
        sub_cast := resize(ang_in_signed, 24);
        sub_temp := sub_cast - to_signed(16#1921FB#, 24);
        IF (sub_temp(23) = '0') AND (sub_temp(22) /= '0') THEN 
          ang_out_tmp <= "01111111111111111111111";
        ELSIF (sub_temp(23) = '1') AND (sub_temp(22) /= '1') THEN 
          ang_out_tmp <= "10000000000000000000000";
        ELSE 
          ang_out_tmp <= sub_temp(22 DOWNTO 0);
        END IF;
      WHEN OTHERS => 
        -- others clause make output angle 
        -- equal to input angle  
        ang_out_tmp <= ang_in_signed;
    END CASE;
    QUAD_tmp <= QUAD1;
  END PROCESS lib_ofdmrx_c7_QUAD_DETERM1_output;


  ang_out <= std_logic_vector(ang_out_tmp);

  QUAD <= std_logic_vector(QUAD_tmp);

END rtl;

