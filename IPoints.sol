// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Define the roles within a point system.
enum Role {
    None,
    Admin,
    Issuer
}

// IPoints interface declaration.
interface IPoints {
    // Errors
    error OnlyAdmin(uint256 systemId, address user);
    error OnlyIssuer(uint256 systemId, address user);
    error InsufficientPoints(uint256 systemId, address user, uint256 available, uint256 required);
    // For batch functions.
    error ArrayLengthMismatch();

    // Events
    event PointSystemCreated(uint256 indexed systemId, address indexed creator); // Emitted when a new point system is created.
    event PointsAdded(uint256 indexed systemId, address indexed user, uint256 points); // Emitted when points are added to a user's allocation.
    event PointsSubtracted(uint256 indexed systemId, address indexed user, uint256 points); // Emitted when points are subtracted from a user's allocation.
    event AdminAdded(uint256 indexed systemId, address indexed user); // Emitted when an admin is added to a system.
    event AdminRemoved(uint256 indexed systemId, address indexed user); // Emitted when an admin is removed from a system.
    event IssuerAdded(uint256 indexed systemId, address indexed issuer); // Emitted when an issuer is added to a system.
    event IssuerRemoved(uint256 indexed systemId, address indexed issuer); // Emitted when an issuer is removed from a system.
    event ObserverSet(uint256 indexed systemId, address indexed observer); // Emitted when an observer is set for a system.
    event URIUpdated(uint256 indexed systemId, string uri); // Emitted when the URI for a system is updated.

    // -- Creating point systems --

    /**
     * @dev Creates a new point system.
     * @return systemId The ID of the created point system.
    */
    function createPointSystem() external returns (uint256 systemId);

    // -- Managing points --

    /**
    * @dev Adds points to a user's balance.
    * @param systemId The ID of the point system.
    * @param user The address of the user.
    * @param points The amount of points to add.
    */
    function addPoints(uint256 systemId, address user, uint256 points) external;

    /**
    * @dev Subtracts points from a user's balance.
    * @param systemId The ID of the point system.
    * @param user The address of the user.
    * @param points The amount of points to subtract.
    */
    function subtractPoints(uint256 systemId, address user, uint256 points) external;

    /**
    * @dev Retrieves the amount of points that a user has.
    * @param systemId The ID of the point system.
    * @param user The address of the user.
    * @return The amount of points that the user has.
    */
    function getPoints(uint256 systemId, address user) external view returns (uint256);

    /**
    * @dev Retrieves the total amount of points in a point system.
    * @param systemId The ID of the point system.
    * @return The total amount of points in the point system.
    */
    function getTotalPoints(uint256 systemId) external view returns (uint256);

    /**
    * @dev Retrieves the key for a user's points within a point system.
    * @param systemId The ID of the point system.
    * @param user The address of the user.
    * @return The key for the user's points.
    */
    function getPointsKeyForUser(uint256 systemId, address user) external pure returns (bytes32);

    // -- Batch functions --

    /**
    * @dev Adds points to multiple users' balances in a batch.
    * @param systemId The ID of the point system.
    * @param users The addresses of the users.
    * @param points The amounts of points to add.
    */
    function addPointsBatch(uint256 systemId, address[] calldata users, uint256[] calldata points) external;

    /**
    * @dev Subtracts points from multiple users' balances in a batch.
    * @param systemId The ID of the point system.
    * @param users The addresses of the users.
    * @param points The amounts of points to subtract.
    */
    function subtractPointsBatch(uint256 systemId, address[] calldata users, uint256[] calldata points) external;

    /**
    * @dev Adds points to multiple users' balances across different point systems in a batch.
    * @param systemIds The IDs of the point systems.
    * @param users The addresses of the users.
    * @param points The amounts of points to add.
    */
    function addPointsBatchMultipleSystems(uint256[] calldata systemIds, address[] calldata users, uint256[] calldata points) external;

    /**
    * @dev Subtracts points from multiple users' balances across different point systems in a batch.
    * @param systemIds The IDs of the point systems.
    * @param users The addresses of the users.
    * @param points The amounts of points to subtract.
    */
    function subtractPointsBatchMultipleSystems(uint256[] calldata systemIds, address[] calldata users, uint256[] calldata points) external;

    // -- Managing administrators and external contracts --

    /**
    * @dev Adds an administrator to a point system.
    * @param systemId The ID of the point system.
    * @param admin The address of the administrator.
    */
    function addAdmin(uint256 systemId, address admin) external;

    /**
    * @dev Removes an administrator from a point system.
    * @param systemId The ID of the point system.
    * @param admin The address of the administrator.
    */
    function removeAdmin(uint256 systemId, address admin) external;

    /**
    * @dev Adds a supported contract to a point system.
    * @param systemId The ID of the point system.
    * @param contractAddress The address of the supported contract.
    */
    function addIssuer(uint256 systemId, address contractAddress) external;

    /**
    * @dev Removes a supported contract from a point system.
    * @param systemId The ID of the point system.
    * @param contractAddress The address of the supported contract.
    */
    function removeIssuer(uint256 systemId, address contractAddress) external;

    /**
     * @dev Sets an observer for a point system. The observer will be notified when points are added or subtracted from a user.
     * @param systemId The ID of the point system.
     * @param observer The address of the observer.
     */
    function setObserver(uint256 systemId, address observer) external;

    /**
    * @dev Retrieves the observer for a point system.
    * @param systemId The ID of the point system.
    * @return The address of the observer.
    */
    function getObserver(uint256 systemId) external view returns (address);

    /**
    * @dev Retrieves the role of a user within a point system.
    * @param systemId The ID of the point system.
    * @param user The address of the user.
    * @return The role of the user.
    */
    function getRole(uint256 systemId, address user) external view returns (Role);

    // -- Managing metadata --

    /**
    * @dev Sets the URI for a point system.
    * @param systemId The ID of the point system.
    * @param uri The URI to set.
    */
    function setURI(uint256 systemId, string calldata uri) external;

    /**
    * @dev Retrieves the URI for a point system.
    * @param systemId The ID of the point system.
    * @return The URI of the point system.
    */
    function getURI(uint256 systemId) external view returns (string memory);
}
