pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";


 /**
  * @dev contract 'RetailerRole' to manage this role - add, remove, check
  */
contract RetailerRole {

  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event RetailerAdded(address indexed account);
  event RetailerRemoved(address indexed account);

  // Define a struct 'retailers' by inheriting from 'Roles' library, struct Role
  Roles.Role private retailers;

  // In the constructor make the address that deploys this contract the 1st retailer
  constructor() public {
      _addRetailer(msg.sender);  
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyRetailer() {
        require(isRetailer(msg.sender),"Caller is not Retailer.");
    _;
  }


  /**
  * @dev  function 'isRetailer' to check this role
  * @param account of the Retailer  to be check
  */
  function isRetailer(address account) public view returns (bool) {
      return retailers.has(account);
    
  }

  /**
  * @dev  function 'addRetailer' that adds this role
  * @param account of the Retailer  to add
  */
  function addRetailer(address account) public onlyRetailer {
      _addRetailer(account);  
  }


  /**
  * @dev  function 'renounceRetailer' to renounce this role
  */
  function renounceRetailer() public {
      _removeRetailer(msg.sender);
  }


  /**
  * @dev  internal function '_addRetailer' to add this role, called by 'addRetailer'
  * @param account of the Retailer  to add
  */
  function _addRetailer(address account) internal {
      retailers.add(account);
      emit RetailerAdded(account);
  }

  /**
  * @dev  internal function '_removeRetailer' to remove this role, called by 'removeRetailer'
  * @param account of the Retailer  to remove
  */
  function _removeRetailer(address account) internal {
      retailers.remove(account);
      emit RetailerRemoved(account);
  }
}
