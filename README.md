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

## Specifications Overview

The project involves two distinct representations of system specifications, each serving different purposes:

### General Specification Table
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
| Parameter                           | Symbol               | Size            |
|-------------------------------------|----------------------|-----------------|
| Input Voltage                       | \( V_g \)           | 6V              |
| Output Voltage                      | \( V_o \)           | 1V              |
| Switching Frequency                 | \( f_s \)           | 500kHz          |
| Output Current                      | \( I_o \)           | 500mA - 1A      |
| Steady State Output Voltage Ripple  | \( \Delta V_{OSS} \)| <2%             |
| Steady State Inductor Current Ripple| \( \Delta I_{LSS} \)| <0.3A (30% \(I_{o_{max}}\)) |
| OS%                                 |                      | <10%            |
| Inductance                          | \( L \)             | 10μH            |
| Inductor Parasitic Resistance       | \( R_L \)           | 68mΩ            |
| Capacitance                         | \( C \)             | 22μF            |
| Capacitor Parasitic Resistance      | \( R_C \)           | 20mΩ            |

## Design Stages

### 1. Analog Voltage Mode Buck DC-DC Converter Design
- **Focus**: 
  - The design commenced with creating open-loop and closed-loop Buck DC-DC converters. The open-loop configuration established the foundational power stage design, while the closed-loop system incorporated feedback mechanisms to enhance dynamic response and stabilize output voltage under varying conditions.
- **Simulation Tools**: 
  - PLECS was the primary tool for simulating the circuit's power stage and dynamic behavior. Parameters such as inductance, capacitance, and equivalent series resistance (ESR) were meticulously tuned to meet design specifications.
  - Simulations offered critical insights into voltage and current waveforms across different load scenarios, providing a robust understanding of system behavior.
- **Design Considerations**: 
  - The analog control loop was optimized by strategically placing poles and zeros, achieving ideal transient response and steady-state performance.
  - Key metrics such as phase margin (>65°) and damping ratio (>0.7) were maintained to ensure stability, rapid settling times, and minimal oscillations.
- **Results**: 
  - **Uncompensated Behavior**: The deep blue waveform highlighted instability and oscillations inherent in the open-loop system.
  - **Compensated Response**: The yellow waveform demonstrated improved stability, faster settling, and reduced overshoot after compensation.
  - Both transient and steady-state simulations confirmed that the design met the performance criteria, ensuring reliability under varying load conditions.

### 2. Digital Compensator Design
- **Methodology**: Transitioned the compensator from the s-domain to the z-domain using a "Design by Emulation" approach, enabling efficient digital control.
- **Tools**: Matlab's SISOTool was employed to fine-tune poles, zeros, and gain, ensuring optimal phase margin and damping characteristics.
- **Results**: Simulations confirmed the digital compensator's ability to stabilize the system, with dynamic and steady-state responses closely aligning with design goals.

### 3. Quantization and HDL Implementation
- **Quantization**: The z-domain compensator was quantized into a high-precision lookup table (LUT) using Matlab.
- **Hardware Realization**: Verilog HDL was utilized to implement the digital compensator, ensuring seamless integration into the hardware system.
- **Results**: Co-simulation verified the compensator's precision and compatibility with the overall design.

### 4. DPWM Module Design
- **Modules**: Various DPWM configurations, including Counter, Hybrid, Dither, and Dead-time modules, were designed, simulated, and compared.
- **Results**: Comparative analysis identified the most efficient DPWM configuration, optimizing system performance in terms of precision and stability.

### 5. ADC Encoder Implementation
- **Design Considerations**: Integrated essential components such as transport delay, zero-order hold, quantizer, and saturation modules to enhance ADC performance.
- **Integration**: Successfully combined the ADC encoder with the digital compensator, DPWM, and power stage, creating a cohesive system.
- **Results**: Output voltage consistently stabilized at 1V, with smooth transitions in current between 0.5A and 1A during dynamic load changes.

### 6. Integration and Verification
- **Simulation**: A comprehensive closed-loop system was simulated, incorporating all previously designed modules. Simulation validated the system's stability and performance.
- **Hardware Implementation**: Realized the digital design on an FPGA using Quartus, with the external power stage constructed on a PCB for real-world testing.
- **Results**: Hardware validation results mirrored simulation outcomes, confirming the design's reliability and operational accuracy.

---

## Specifications
- **Input Voltage**: 6V
- **Output Voltage**: 1V
- **Switching Frequency**: 500kHz
- **DPWM Resolution**: 8.2mV
- **ADC Resolution**: 30mV
- **System Clock**: 32MHz
- **Phase Margin**: >65°
- **Current Range**: 500mA to 1A

---

## Results
- **Steady-State Performance**: Output voltage stabilized at 1V, with current smoothly transitioning between light and heavy loads.
- **Transient Response**: Load-switching simulations demonstrated minimal overshoot and fast settling times, affirming the system's robust dynamic response.
- **Hardware Validation**: The FPGA-based implementation yielded results consistent with simulations, underscoring the design's precision and reliability.


## Simulation Tools
- **PLECS**: Used for circuit architecture and dynamic behavior simulations.
- **Matlab/Simulink**: Utilized for system modeling and data analysis.
- **Verilog HDL**: Facilitated the design and simulation of digital circuit modules.

---
