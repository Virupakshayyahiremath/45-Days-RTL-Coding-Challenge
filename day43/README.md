# Day 43 – Mini RTL System Integration

## Objective
Integrate multiple RTL blocks and verify system-level behavior.

## Design
- Synchronous FIFO (16×8) used as a data buffer  
- Controller FSM integrated in the top module  
- FSM reads FIFO when not empty and asserts `processing_done`

## Files
- `fifo16_8_sync.v` – FIFO RTL  
- `mini_system.v` – Top module (FIFO + FSM)  
- `mini_system_tb.v` – Task-based system-level testbench  

## Verification
- Data written into FIFO using `wr_en`
- FSM automatically reads data
- One `processing_done` pulse per FIFO entry

## Key Learning
System-level RTL design focuses on clean module integration and clear separation of control and datapath.

        +------------------+
 data → |   FIFO (16×8)    | → fifo_dout
        |                  |
        +--------+---------+
                 |
                 v
        +------------------+
        | Controller FSM   |
        |                  |
        +--------+---------+
                 |
                 v
          processing_done
