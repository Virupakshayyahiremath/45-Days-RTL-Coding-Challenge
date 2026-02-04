# CDC Design Checklist

- [ ] Every CDC signal is identified
- [ ] Single-bit signals use 2-FF synchronizers
- [ ] Multi-bit data uses async FIFO or handshake
- [ ] No direct sampling of async buses
- [ ] Gray code used for async counters
- [ ] Reset CDC handled separately
- [ ] CDC verified with static CDC tools