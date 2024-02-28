// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Loop {
    function loop() public pure {
        // For Loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip the next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit the loop with break
                break;
            }
        }
        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
    }
}
