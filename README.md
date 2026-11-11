# Verilog Combinational Logic & Hardware Implementation on AMD Spartan-7 Urbana FPGA

![Verilog](https://img.shields.io/badge/Verilog-HDL-blue?style=flat-square)
![Vivado](https://img.shields.io/badge/AMD%20Vivado-2024.2-red?style=flat-square)
![FPGA](https://img.shields.io/badge/FPGA-Spartan--7-green?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

This repository contains Verilog HDL implementations for fundamental logic gates and multi-bit combinational logic circuits (Full Adder, Full Subtractor, 1-bit Magnitude Comparator, 8-to-3 Priority Encoder, and 3-to-8 Decoder) implemented in Dataflow, Behavioral, and Gate-Level modeling styles.

The designs are synthesized, implemented, and verified on physical hardware using the AMD / Xilinx Spartan-7 Urbana Development Board (`xc7s50csga324-1`) via AMD Vivado 2024.2.

---

## Table of Contents

- [Hardware & Tool Specifications](#-hardware--tool-specifications)
- [Repository Structure](#-repository-structure)
- [Hardware Pin Mapping](#-hardware-pin-mapping-top_fpgav--constraintsxdc)
- [Video Verification & Truth Table Analysis](#-video-verification--truth-table-analysis-assignmentmp4)
- [Build & Synthesis Instructions](#-build--synthesis-instructions)

---

## Hardware & Tool Specifications

* **FPGA Board:** Real Digital Urbana Board
* **Target Device:** `xc7s50csga324-1` (Spartan-7 Family)
* **EDA Suite:** AMD Vivado 2024.2
* **Language Standard:** Verilog HDL (IEEE 1364-2001)

---

## Repository Structure

```text
.
├── all_circuits.v       # Top source file containing all logic modules
├── top_fpga.v           # Top-level wrapper module binding inputs/outputs to FPGA pins
├── constraints.xdc      # Board pin mapping for Spartan-7 XC7S50-CSGA324
├── tb_all.v             # Unified behavioral simulation testbench
├── assignment.mp4       # Video demonstration of hardware verification
└── README.md            # Documentation
