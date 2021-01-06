pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";


 /**
  * @dev  contract 'ProducerRole' to manage this role - add, remove, check
  */
contract FactoryRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event FactoryAdded(address indexed account);
  event FactoryRemoved(address indexed account);

  // Define a struct 'factories' by inheriting from 'Roles' library, struct Role
  Roles.Role private factories;

  // In the constructor make the address that deploys this contract the 1st factory
  constructor() public {
    _addFactory(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyFactory() {
    require(isFactory(msg.sender));
    _;
  }

  
  /**
  * @dev  function 'isFactory' to check this role
  * @param account of the factory  to be check
  */
  function isFactory(address account) public view returns (bool) {
    return factories.has(account);
  }


  /**
  * @dev  function 'addFactory' that adds this role
  * @param account of the factory  to add
  */
  function addFactory(address account) public onlyFactory {
    _addFactory(account);
  }


  /**
  * @dev  function 'renounceFactory' to renounce this role
  */
  function renounceFactory() public {
    _removeFactory(msg.sender);
  }

  
  /**
  * @dev  internal function '_addFactory' to add this role, called by 'addFactory'
  * @param account of the factory  to add
  */
  function _addFactory(address account) internal {
    factories.add(account);
    emit FactoryAdded(account);
  }

  /**
  * @dev  internal function '_removeFactory' to remove this role, called by 'removeFactory'
  * @param account of the factory  to remove
  */
  function _removeFactory(address account) internal {
    factories.remove(account);
    emit FactoryRemoved(account);
  }
}
