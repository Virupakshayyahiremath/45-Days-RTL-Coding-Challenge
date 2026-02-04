# Day 35 – Clock Domain Crossing (CDC)

## Overview
Clock Domain Crossing (CDC) occurs when signals transfer between
asynchronous clock domains. Improper CDC handling can cause
metastability, data corruption, and silicon failures.

## Why CDC Is Dangerous
- Setup/hold timing cannot be guaranteed
- Sampling may occur during signal transition
- Simulation cannot model metastability accurately

## Metastability
Metastability is an unstable analog state in a flip-flop caused by
violating setup/hold requirements. CDC techniques reduce probability
but cannot eliminate it.

## CDC Techniques
| Signal Type        | Solution |
|--------------------|----------|
| Single-bit control | 2-FF Synchronizer |
| Pulse              | Toggle / pulse stretcher |
| Multi-bit data     | Asynchronous FIFO |
| Status flags       | Gray code + synchronizer |
| Reset              | Async assert, sync deassert |

## Verification
CDC issues are verified using:
- Static CDC tools
- Synchronizer checks
- Structural CDC analysis
- Formal verification

Simulation alone is insufficient for CDC verification.