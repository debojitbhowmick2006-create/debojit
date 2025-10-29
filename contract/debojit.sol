// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ToneChain - Immutable Colour Ownership Ledger
/// @author 
/// @notice This contract lets users claim unique colour tones on-chain.
/// @dev Simple beginner example demonstrating mappings and ownership logic.

contract ToneChain {

    // ========== STATE VARIABLES ==========

    // Mapping of colour HEX code (as string) to the owner's address
    mapping(string => address) public colourOwner;

    // Event emitted when a colour is successfully claimed
    event ColourClaimed(address indexed owner, string hexCode);

    // ========== PUBLIC FUNCTIONS ==========

    /// @notice Claim ownership of a colour (e.g., "#FF0000")
    /// @param hexCode The HEX code of the colour to claim
    function claimColour(string memory hexCode) public {
        require(bytes(hexCode).length > 0, "Colour code cannot be empty");
        require(colourOwner[hexCode] == address(0), "Colour already claimed");

        // Record ownership
        colourOwner[hexCode] = msg.sender;

        // Emit event for transparency
        emit ColourClaimed(msg.sender, hexCode);
    }

    /// @notice View the owner of a given colour
    /// @param hexCode The HEX code of the colour
    /// @return The address of the owner (0x0 if unclaimed)
    function getOwnerOf(string memory hexCode) public view returns (address) {
        return colourOwner[hexCode];
    }

    // ========== OPTIONAL EXTENSIONS ==========

    /// @notice Check if a colour is already claimed
    function isClaimed(string memory hexCode) public view returns (bool) {
        return colourOwner[hexCode] != address(0);
    }
}

