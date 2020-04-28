# CRC_LIB
This project to create CRC lib
- CRC lib used in UVM ENV to check the properly of packet data.
- CRC32 for PCIE, IEEE 802.3: g(x) = 1+x^1+x^2+x^4+x^5+x^7+x^8+x^10+x^11+x^12+x^16+x^22+x^23+x^26+x^32
- CRC16 for USB 2.0: g(x) = 1+x^2+x^15+x^16
- Run on Questasim

# source
Reference document:
URL:

# Simulation run
1. ./setup_proj
2. cd sim
3. make clean
4. make all TEST_NAME=
