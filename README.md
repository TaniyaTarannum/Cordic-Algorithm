# Implementation of Scale-Free Folded Hyperbolic Cordic Algorithm
This project presents an implementation of the algorithm described in the IEEE paper:  

A. Verma, K. Kiyawat, B. P. Das and P. K. Meher, "An Efficient Scaling-Free Folded Hyperbolic CORDIC Design Using a Novel Low-Complexity Power-of-2 Taylor Series Approximation," in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 31, no. 8, pp. 1167-1177, Aug. 2023, doi: 10.1109/TVLSI.2023.3281078.  

The paper proposes a low-complexity, scaling-free hyperbolic CORDIC architecture for computing sinh and cosh functions using a power-of-2 coefficient-based Taylor series approximation. The novel design reduces latency, area, and power consumption by optimizing the number of microrotations and folding them into a pipeline structure. In this project, the architecture described in the paper has been independently implemented in Verilog HDL and simulated using Xilinx Vivado to verify its correctness and feasibility. The goal is to validate the core algorithm through behavioral simulation and prepare a foundation for potential FPGA-based deployment. This work serves as a practical reference for efficient hardware realization of hyperbolic function computation.

