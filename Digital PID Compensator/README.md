# Digitally PID Compensator Implement

## Objectives
1. Z-domain compensator quantization
2. Coding with Verilog-HDL for digital compensator
3. Co-Simulation with Matlab/Modelsim

## System Specification
| Parameter                         | Symbol                  | Size                  |
|-----------------------------------|-------------------------|-----------------------|
| Input Voltage                     |  Vg                    | 6 V                   |
| Output Voltage                    |  Vo                     | 1 V                   |
| Switching Frequency               |  fs                    | 500 kHz               |
| Output Current                    |  Io                     | 500 mA - 1 A          |
| Steady State Output Voltage Ripple| \( \Delta V_{OSS} \)    | < 2%                  |
| Steady State Inductor Current Ripple | \( \Delta I_{LSS} \) | < 0.3 A (30% Io_max) |
| OS%                               |                        | < 10%                 |
| Inductance                        | L              | 10 µH                 |
| Inductor Parasitic Resistance     | RL              | 68 mΩ                 |
| Capacitance                       | C               | 22 µF                 |
| Capacitor Parasitic Resistance    | RC              | 20 mΩ                 |

## Design process
1. Choose the word-length of the LUTs
2. Convert the compensator coefficients into binary form
   - Necessary to shift the decimal numbers forward, convert them into binary, and then revert them afterward
   - The precision of the conversion is positively correlated with the bit-shift amount
   - The bit-shift amount must match the number of bits required for the LUT.
3. Multiply the coefficients with the input results to determine the number of bits and the internal value of LUT
4. Build the Verilog code of digital compensator
   - Modulate the integer number to be consistent with the LUT results
   - Fill in the
   - Hardware Implementation structure
     


<div style="display: flex; justify-content: space-around;">
  <img src="../image/DBE.png" alt="DBE" width="30%">
  <img src="../image/DBE2.png" alt="DBE2" width="68%">
</div>

3. Conduct digital buck converter closed-loop simulation (including power stage, ADC, 
PWM and compensator)


4. Explore & Simulate LCO violations
<img src="../image/LCO.png" alt="LCO" width="80%">

## Design Schematic
<img src="../image/Compensator.png" alt="Compensator" width="80%">
