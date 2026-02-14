# Day 45 – Mini CPU Datapath Integration

## Overview

On Day 45 of the 45 Days RTL Coding Challenge, a multi-cycle mini CPU datapath was implemented by integrating previously designed RTL modules:

- 4x8 Register File (Day 29)
- Parameterized ALU (Day 44)
- Control FSM (Day 45)

This design demonstrates system-level RTL integration and basic processor datapath architecture.

---

## Architecture

The mini CPU consists of:

- Register File (4 registers, 8-bit each)
- ALU supporting arithmetic and logical operations
- Control FSM to manage multi-cycle execution
- Write-back stage

### Datapath Flow

1. Read source register 1 (rs1)
2. Read source register 2 (rs2)
3. Perform ALU operation
4. Write result to destination register (rd)

Execution is performed across multiple clock cycles.

---

## Supported ALU Operations

| Opcode | Operation |
|--------|-----------|
| 000 | ADD |
| 001 | SUB |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | SLT (Set Less Than) |
| 110 | Shift Left |
| 111 | Shift Right |

---

## FSM States

| State | Description |
|-------|-------------|
| IDLE  | Wait for start signal |
| READ1 | Read first operand |
| READ2 | Read second operand |
| WRITE | Write ALU result back |

---

## Files

- `mini_cpu.v` – Top-level CPU integration module
- `mini_cpu_tb.v` – Testbench with multi-operation execution
- `alu.v` – ALU module (Day 44)
- `reg_file4_8.v` – Register file (Day 29)

---

## Key Design Highlights

- Modular RTL reuse
- Multi-cycle execution control
- Clean separation of datapath and control
- Parameterized ALU design
- Debug signal exposure for waveform visibility
- Task-based structured testbench

---

## Learning Outcome

This design marks the transition from standalone RTL blocks to processor-level datapath thinking. It demonstrates:

- Multi-module integration
- FSM-controlled execution
- Register read/write handling
- Basic CPU architectural concepts

---

## Future Improvements

- Add Program Counter (PC)
- Add Instruction Memory
- Implement instruction encoding
- Extend to full RISC-style architecture

---

## Conclusion

Day 45 concludes the 45-day RTL journey by building a foundational CPU datapath using reusable RTL components.

This project showcases growth from basic combinational logic to system-level processor building blocks.
