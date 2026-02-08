# Day 39 – RTL Coding Styles & Best Practices

This day focuses on writing clean, correct, and lint-friendly RTL code.

## Topics Covered
- Blocking vs Non-blocking assignments
- Combinational vs Sequential logic separation
- Latch inference and prevention
- Synchronous vs Asynchronous reset styles
- RTL readability and maintainability

## Key Rules
| Logic Type       | Assignment |
|-----------------|------------|
| Sequential      | <=         |
| Combinational   | =          |

## Common Pitfalls
- Using blocking assignment in clocked always blocks
- Missing default assignments causing latches
- Mixing combinational and sequential logic
- Width and sign mismatches

## Why This Matters
Clean RTL:
- Prevents race conditions
- Improves synthesis predictability
- Passes lint and CDC tools
- Makes designs scalable and maintainable