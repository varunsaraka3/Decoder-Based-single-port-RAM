# Decoder-Based Single-Port RAM in Verilog

This repository presents the design and implementation of a **Single-Port RAM** along with a **decoder-based memory expansion architecture** using Verilog. The project demonstrates fundamental concepts of memory design, modular hardware development, and scalable architecture in FPGA/VLSI systems.

---

## 📌 Project Overview

The project focuses on:

* Designing an **8×8 Single-Port RAM** (8 memory locations, each 8 bits wide)
* Expanding it into a **32-location memory system** using a **2-to-4 decoder**
* Implementing efficient **chip selection using address MSBs**
* Verifying functionality through a **comprehensive testbench**

---


### 🔹 Single-Port RAM Module

* Synthesizable Verilog design
* Supports:

  * Clock (`clk`)
  * Reset (`rst`)
  * Write Enable (`we`)
  * Chip Select (`cs`)
  * Output Enable (`oe`)
  * Bidirectional data bus (`inout [7:0] data`)
* Implements:

  * Synchronous write operation
  * Registered read operation
  * Tri-state output buffer for bus control

---

### 🔹 Memory Expansion using Decoder

* Uses **four 8×8 RAM blocks** to create a **32×8 memory**
* A **2-to-4 decoder** generates `chip_select` signals
* Ensures only one RAM block is active at a time
* Enables scalable memory architecture

---<img width="1536" height="1024" alt="Decoder" src="https://github.com/user-attachments/assets/277dad22-1a3d-449e-b365-5da6a8f63851" />


### 🔹 Verification (Testbench)

* Instantiates multiple RAM modules (DUTs)
* Tests:

  * Write operations
  * Read operations
  * Chip selection logic
* Validates correct decoder-based memory access

---<img width="1364" height="720" alt="Screenshot 2026-07-08 221052" src="https://github.com/user-attachments/assets/a33d2bc5-499a-4cd4-a62b-8fd3c9c6bcc9" />


### 🔹 Advanced Addressing Technique

* Uses **Most Significant Bits (MSBs)** of the address bus
* MSBs → Decoder input (block selection)
* LSBs → Internal RAM address
* Efficient and scalable addressing scheme

---

## ⚙️ How to Use

### 1. Synthesizable Design

Use the RAM module in your RTL projects. It is compatible with standard FPGA synthesis tools like Xilinx Vivado.

### 2. Simulation

Run the provided testbench using tools such as ModelSim or Vivado Simulator to verify functionality.

### 3. Scalability

* Increase memory size by:

  * Expanding decoder inputs (e.g., 3-to-8)
  * Instantiating more RAM blocks
* Adaptable for larger memory systems

---

* Understanding **RAM architecture**
* Implementing **decoder-based memory expansion**
* Working with **tri-state buses**
* Designing **modular and scalable RTL systems**
