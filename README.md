# Digitally Controlled Buck DC-DC Converter
## Introduction
With the rapid advancement of electronic devices, digitally controlled 
converters have become increasingly essential in various applications. Buck DC-DC 
converters, known for their high-efficiency power management, stable and precise 
output, and low noise, are widely used in portable devices, computer systems, and 
telecom infrastructure. Recent trends in both industry and academic research 
demonstrate that digitally controlled devices have replaced traditional analog
controlled buck converters. Therefore, inspired by the inevitable market demand 
and driven by a passion for research in this field, I have utilized a variety of 
techniques and tools to design a digitally controlled buck DC-DC converter. 

## Overview
This project involves the systematic design and implementation of a digitally controlled Buck DC-DC converter. It transitions from analog-based design to digital control systems, encompassing the design of digital compensators, development of DPWM modules, ADC encoding, system integration, and hardware realization.
After successful simulation, I implemented the previous designed digital compensator, DPWM module, 
and the ADC encoder on the FPGA board, utilizing Quartus to realize the 
digital control portion as hardware circuitry and constructed the external power stage using a PCB board to simulate a real 
operational environment, thereby completing the integration of the 
digitally controlled Buck converter system. 

## Objective
The primary aim is to deliver a stable output voltage with robust dynamic response, meeting stringent requirements for high-performance power management in modern applications. This effort utilizes cutting-edge simulation and hardware tools to validate the design comprehensively.

## System Specification

The project involves two distinct representations of system specifications, each serving different purposes:

### General Specification Table
( Used in the **final implementation and FPGA verification phase** to summarize high-level system requirements)
| Specification        | Value       |
|----------------------|-------------|
| Input Voltage        | 6V          |
| Output Voltage       | 1V          |
| Switching Frequency  | 500kHz      |
| Current Range        | 500mA-1A    |
| Inductor/ESR         | 10μH/30mΩ   |
| Capacitor/ESR        | 22μF/20mΩ   |
| System Clock         | 32MHz       |
| DPWM Resolution      | 8.2mV       |
| ADC Resolution       | 30mV        |
| ADC Sampling Frequency | 500kHz    |
| Phase Margin         | >65°        |


### Detailed Parameter Table
(Used during the **design and simulation phase** with Matlab Simulink and PLECS to fine-tune the internal parameters of the system.)
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

## Design Stages

### 1. Analog Voltage Mode Buck DC-DC Converter Design
- **Focus**: The design commenced with creating open-loop and closed-loop Analog Buck DC-DC converters. The open-loop configuration established the foundational power stage design, while the closed-loop system incorporated feedback mechanisms to enhance dynamic response and stabilize output voltage under varying conditions.
- **Design Considerations**: The analog control loop was optimized by strategically placing poles and zeros, achieving ideal transient response and steady-state performance.
- Key metrics such as phase margin (>65°) and damping ratio (>0.7) were maintained to ensure stability, rapid settling times, and minimal oscillations.

### 2. Digital Compensator Design
- **Methodology**: Transitioned the compensator from the s-domain to the z-domain using a "Design by Emulation" approach, enabling efficient digital control.

### 3. Quantization and HDL Implementation
- **Quantization**: The z-domain compensator was quantized into a high-precision lookup table (LUT) using Matlab.
- **Hardware Realization**: Verilog HDL was utilized to implement the digital compensator, ensuring seamless integration into the hardware system.

### 4. DPWM Module Design
- **Modules**: Various DPWM configurations, including Counter, Hybrid, Dither, and Dither with dead-time control modules, were designed, simulated, and compared.

### 5. ADC Encoder Implementation
- **Design Considerations**: Integrated essential components such as transport delay, zero-order hold, quantizer, and saturation modules to enhance ADC performance.
- **Integration**: Successfully combined the ADC encoder with the digital compensator, DPWM, and power stage, creating a cohesive system.

### 6. Integration and Verification
- **Simulation**: A comprehensive closed-loop system was simulated, incorporating all previously designed modules. Simulation validated the system's stability and performance.
- **Hardware Implementation**: Realized the digital design on an FPGA using Quartus, with the external power stage constructed on a PCB for real-world testing.


## Simulation Tools
- **PLECS**: Used for circuit architecture and dynamic behavior simulations.
- **Matlab/Simulink**: Utilized for system modeling and data analysis.
- **Verilog HDL**: Facilitated the design and simulation of digital circuit modules.
- **Quartus**: Used for FPGA implementation.
  
## Additional Explorations
- **Analog buck converter in PLECS Standalone**
  - Using PLECS Standalone to model and analyze time-domain and frequency-domain waveforms of a Buck converter under different load condition
  - Compare the simulation results and usability between PLECS Blockset and Standalone approaches.
- **Buck converter with digital control in PLECS Standalone**
  - Transitioned the compensator from the s-domain to the z-domain, leveraged previous specifications to implement the z-domain transfer function into PLECS Standalone for simulation and analysis.
  - Adjusted the sampling frequency to analyze its impact on system performance under the following conditions:
  - Compared time-domain waveforms under varying sampling frequencies to validate the compensator's stability and accuracy.
- **Deisgn & Analysis of Flyback**
  - Simulate Flyback open-loop in MATLAB/Simulink and verify transfer function
  - Design compensators in SISOTOOL and convert to circuit components
  - Simulate closed-loop system with compensators in MATLAB/Simulink.


