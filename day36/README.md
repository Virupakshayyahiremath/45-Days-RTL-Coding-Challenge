# Day 36 – Pulse and Handshake CDC

## Problem
Single-cycle pulses cannot be reliably transferred across asynchronous
clock domains using simple synchronizers.

## Solutions
### Toggle-based Synchronization
Used for single events. Source toggles a bit, destination detects change.

### Handshake Synchronization
Used when event delivery must be guaranteed. Source sends request and
waits for acknowledge before issuing the next event.

## When to Use
| Requirement            | CDC Method |
|------------------------|------------|
| Single pulse           | Toggle sync |
| Guaranteed delivery    | Handshake |
| Multi-bit data         | Async FIFO |