// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract EnumDemo {
    Status public status;

    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    function setStatus(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    function accept() public {
        status = Status.Accepted;
    }

    function reset() public {
        status = Status.Pending;
    }
}
