Day 40 – RTL Linting

Tool Used:
- Synopsys VC Static / SpyGlass-style RTL Lint

Results:
- Buggy RTL showed latch inference, multiple drivers,
  unused reset, and race conditions
- Fixed RTL resolved all functional lint errors
- Only library-related informational warnings remain

Learning:
Linting detects critical silicon bugs that simulation
may miss and is mandatory before synthesis.
