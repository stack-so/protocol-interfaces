// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// @dev: Interface for PointsObserver contract.
interface IPointsObserver {
    /**
    * @dev Called when points are updated.
    * @param systemId The ID of the point system.
    * @param user The address of the user.
    * @param isAddition Whether the points were added or subtracted.
    * @param pointsChange The amount of points that were added or subtracted.
    * @param newPointsBalance The new points balance.
    */
    function onPointsUpdate(
        uint256 systemId,
        address user,
        bool isAddition,
        uint256 pointsChange,
        uint256 newPointsBalance
    ) external;
}