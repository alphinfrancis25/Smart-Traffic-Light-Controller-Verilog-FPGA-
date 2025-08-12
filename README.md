# Smart-Traffic-Light-Controller-Verilog-FPGA-
A Verilog-based smart traffic light controller for FPGA boards, featuring normal operation with configurable short/long delays and an emergency override mode. The system controls eight traffic light outputs using a finite state machine, with inputs for timing selection and emergency lane priority.


## 🚦 Features
- **Normal mode:** Cycles through traffic light sequences with `ts` (short) and `tl` (long) delays.
- **Emergency mode:** Immediate green light for a selected lane (`sw1`–`sw4`), overriding normal sequence.
- **Configurable delays** based on FPGA clock frequency.
- Designed for **Basys 3 / Artix-7** FPGA boards.
- Fully testable in **Xilinx Vivado simulation**.

---

## 🛠 Hardware & Tools
- **FPGA Board:** Basys 3 (Artix-7)
- **Clock:** 100 MHz
- **Development Tool:** Xilinx Vivado
- **HDL Language:** Verilog
