# 45 Days RTL Coding Challenge

## Overview

This repository documents a structured 45-day journey in RTL design, progressing from basic combinational logic to system-level CPU datapath integration.

The goal of this challenge was to strengthen RTL fundamentals, improve design discipline, and build processor-level architectural understanding using Verilog.

---

## Learning Progression

### 🔹 Fundamentals
- Logic gates
- Multiplexers and decoders
- Adders and subtractors
- Flip-flops
- Counters
- Shift registers

### 🔹 Sequential & Control Logic
- Moore and Mealy FSMs
- Sequence detectors
- Loadable and up/down counters
- Parameterized RTL

### 🔹 Memory Structures
- Register file
- Single-port RAM
- Dual-port RAM
- Synchronous FIFO
- Asynchronous FIFO (with Gray code pointers)

### 🔹 Advanced RTL Concepts
- Clock Domain Crossing (CDC)
- Two-flop synchronizers
- Pulse and handshake synchronization
- Reset synchronization (async assert, sync deassert)
- RTL linting concepts
- Coding best practices

### 🔹 Protocol & System-Level Design
- UART Transmitter
- Self-checking testbenches
- Scoreboard-based verification
- Mini system integration
- Parameterized ALU design
- Multi-cycle Mini CPU datapath

---

## Final Project – Mini CPU Datapath

The challenge concludes with a multi-cycle mini CPU integrating:

- 4x8 Register File
- Parameterized ALU
- FSM-based control logic
- Write-back stage

This demonstrates:

- Modular RTL reuse
- Multi-cycle execution control
- Datapath and control separation
- Processor-level architectural thinking

---

## Repository Structure

Each day contains:
- `rtl/` – Design modules
- `tb/` – Testbenches
- `sim/` – Simulation files (if applicable)
- `README.md` – Day-specific explanation

---

## Key Skills Demonstrated

- Clean RTL coding practices
- Parameterized and scalable design
- FSM architecture
- Memory design and integration
- CDC-safe implementation
- Reset synchronization
- Self-checking verification methodology
- System-level RTL integration

---

## Tools Used

- Verilog HDL
- Xilinx Vivado Simulator

---

## Outcome

This challenge strengthened:

- RTL design discipline
- Debugging and verification mindset
- Architectural thinking
- System-level integration skills

The journey progressed from foundational logic design to CPU datapath implementation.

---

## Next Goal

Build a full RISC-style processor core with:
- Program counter
- Instruction memory
- Control unit
- Pipelining concepts

---

## Author

Virupakshayya Hiremath  
Electronics and Communication Engineering  
Aspiring RTL / VLSI Design Engineer
