# Realization of DPWM

## Objectives
1. 9bit Counter-based DPWM
2. 9bit Hybridr DPWM
3. 9bit Dither DPWM
4. 9bit Dither DPWM with dead-time

## Design process
- 9bit Counter-based DPWM
  -
2. Convert the compensator coefficients into binary form
   - Necessary to shift the decimal numbers forward, convert them into binary, and then revert them afterward
   - The precision of the conversion is positively correlated with the bit-shift amount
   - The bit-shift amount must match the number of bits required for the LUT.
3. Multiply the coefficients with the input results to determine the number of bits and the internal value of LUT
4. Build the Verilog code of digital compensator
   - Modulate the integer number to be consistent with the LUT results
   - Fill in the results in the Look-up-table
   - truncation
   - Hardware Implementation structure
     <img src="../image/LUT.png" alt="LUT" width="80%">
5. Build Matlab Model with Modelsim
6. Co-Simulation with Matlab/Modelsim
   - Buck converter closed-loop simulation (including power stage, PWM, 
compensator)

## Design Schematic
<img src="../image/Compensator.png" alt="Compensator" width="80%">

