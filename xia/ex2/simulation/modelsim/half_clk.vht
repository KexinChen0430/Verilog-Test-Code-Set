-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "09/03/2014 20:43:33"
                                                            
-- Vhdl Test Bench template for design  :  half_clk
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY half_clk_vhd_tst IS
END half_clk_vhd_tst;
ARCHITECTURE half_clk_arch OF half_clk_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_in : STD_LOGIC;
SIGNAL clk_out : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT half_clk
	PORT (
	clk_in : IN STD_LOGIC;
	clk_out : OUT STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : half_clk
	PORT MAP (
-- list connections between master ports and signals
	clk_in => clk_in,
	clk_out => clk_out,
	reset => reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END half_clk_arch;
