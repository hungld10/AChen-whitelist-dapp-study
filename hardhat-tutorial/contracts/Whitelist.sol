//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // If an address is whitelisted, set it to true. It is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numWhitelistedAddresses;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted.");
        // check if the numWhitelistedAddressed < maxWhitelistedAddressed, if not then throw an error
        require(numWhitelistedAddresses < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // add the address which called the function to the whitelistedAddresses array
        whitelistedAddresses[msg.sender] = true;
        // increase the number of whitelisted addresses
        numWhitelistedAddresses += 1;
    }
}