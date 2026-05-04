# FPGA Sobel Edge Detection – Verilog (Simulation Project)

This repository contains a Sobel Edge Detection simulation project developed during my 2nd year of undergraduate studies as part of learning FPGA-based image processing using Verilog HDL.

The design is intended for simulation in Xilinx Vivado and demonstrates a complete streaming Sobel pipeline using a test pattern generator.

---

## 🔧 Project Overview

- Serial pixel input (streaming architecture)
- 3×3 window generation using line buffers
- Sobel Gx and Gy gradient computation
- Edge magnitude calculation
- Saturated 8-bit output

---

## 📁 Modules

| Module | Description |
|--------|------------|
| `sobel_filter.v` | Performs Sobel convolution and edge magnitude calculation |
| `line_buffer.v` | Generates 3×3 sliding window from input pixels |
| `test_pattern.v` | Generates checkerboard test input |
| `sobel_top_sim.v` | Top-level module for simulation |
| `tb_sobel.v` | Testbench for verification |

---

## 🧩 Block Diagram

The architecture consists of three main stages:
- Test pattern generation
- Line buffer for 3×3 window creation
- Sobel filter for edge computation

<p align="center">
  <img src="Block_diagram.png" width="600"/>
</p>

This design follows a streaming pipeline where pixels are processed sequentially with minimal latency.

---

## 📷 Simulation Results

Simulation was performed in Vivado using an 8×8 checkerboard input.

![Sobel Output](Sobel_result.jpeg)

The waveform shows:
- Initial undefined output (`XX`) due to pipeline filling
- Valid edge output after line buffer initialization
- High (`FF`) values at edges and low (`00`) in flat regions

---

## ⚠️ Notes

- This is a simulation-only academic project
- Line buffer is simplified for educational purposes
- Not optimized for high-resolution images or hardware deployment

---

## 🧠 Learning Outcomes

- Understanding FPGA-based image processing pipelines
- Implementation of Sobel edge detection in hardware
- Verilog RTL design and modular architecture
- Simulation and waveform analysis in Vivado

---

## 🚀 Future Improvements

- Real-time camera input integration (OV7670 / HDMI)
- Hardware implementation on FPGA board
- Optimization for higher resolutions
- AXI4-Stream interface integration

---

## 👤 Author

2nd Year FPGA Simulation Project
