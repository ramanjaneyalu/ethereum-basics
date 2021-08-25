pragma  solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Crud{
    struct User{
        uint id;
        string name;
    }
   
    User[] public users;
    uint public NextId;
   
    function create(string memory _name) public{
        users.push(User(NextId, _name));
        NextId++;
    }
   
    function read(uint id) public returns(uint, string memory){
        require(users[id].id == id);
        return(users[id].id, users[id].name);
    }
   
    function update(uint id, string memory _name) public {
         require(users[id].id == id);
        users[id].name = _name;
    }
   
    function deleteUser(uint id) public {
         require(users[id].id == id);
        delete users[id];
    }
   
    function readAllUsers() public returns(User[] memory){
        return users;
    }
}
