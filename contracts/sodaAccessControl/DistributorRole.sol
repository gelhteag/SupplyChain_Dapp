pragma solidity >=0.4.24;

// Import the library 'Roles'
import "./Roles.sol";


/**
  * @dev  Define a contract 'DistributorRole' to manage this role - add, remove, check
  */
contract DistributorRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event DistributorAdded(address indexed account);
  event DistributorRemoved(address indexed account);

  // Define a struct 'distributors' by inheriting from 'Roles' library, struct Role
  Roles.Role private distributors;

  // In the constructor make the address that deploys this contract the 1st distributor
  constructor() public {
    _addDistributor(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyDistributor() {
   require(isDistributor(msg.sender), "Caller is not a distributor.");
    _;
  }

 
  /**
  * @dev   function 'isDistributor' to check this role
  * @param account of the distributor  to be check
  */
  function isDistributor(address account) public view returns (bool) {
    return distributors.has(account);
  }

  
  /**
  * @dev   function 'addDistributor' that adds this role
  * @param account of the distributor  to be add
  */
  function addDistributor(address account) public onlyDistributor {
    _addDistributor(account);
  }

  
   /**
  * @dev   function 'renounceDistributor' to renounce this role
  */
  function renounceDistributor() public {
    _removeDistributor(msg.sender);
  }

  
  /**
  * @dev   internal function '_addDistributor' to add this role, called by 'addDistributor'
  * @param account of the distributor  to be add
  */
  function _addDistributor(address account) internal {
    distributors.add(account);
    emit DistributorAdded(account);
  }

  
  /**
  * @dev  internal function '_removeDistributor' to remove this role, called by 'removeDistributor'
  * @param account of the distributor  to remove
  */
  function _removeDistributor(address account) internal {
    distributors.remove(account);
    emit DistributorRemoved(account);
  }
}
