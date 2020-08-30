pragma solidity ^0.5.0;


contract HotelRoom{
uint actualDay;
  struct User {
    uint id;
    string name;
    string room;
    uint reservationDay;
    uint reservationMonth;
    uint reservationYear;
    uint adultNumber;
    uint kidsNumber;
    uint nightsNumber;
    string internet;
    bool _check;
  }
  
  function getName(uint id) public view returns (string memory) {
        uint i = find(id);
        return users[i].name;
  }
  
  function getRoom(uint id) public view returns (string memory) {
        uint i = find(id);
        return users[i].room;
  }
  
  function getDay(uint id) public view returns (uint) {
        uint i = find(id);
        return users[i].reservationDay;
  }
  
  function getMonth(uint id) public view returns (uint) {
        uint i = find(id);
        return users[i].reservationMonth;
  }
  
  function getYear(uint id) public view returns (uint) {
        uint i = find(id);
        return users[i].reservationYear;
  }
  
  function getKid(uint id) public view returns (uint) {
        uint i = find(id);
        return users[i].kidsNumber;
  }
  
  function getAdult(uint id) public view returns (uint) {
        uint i = find(id);
        return users[i].adultNumber;
  }
  
  function getTimeH(uint id) public view returns (uint) {
        uint i = find(id);
        return users[i].nightsNumber;
  }
  
  function getInternet(uint id) public view returns (string memory) {
        uint i = find(id);
        return users[i].internet;
  }
  
  function getCheck(uint id) public view returns (bool) {
        uint i = find(id);
        return users[i]._check;
  }
 
  User[] public users;
  uint public nextId = 1;
  
  function create(string memory name, string memory room, uint reservationDay, uint reservationMonth, uint reservationYear, uint  adultNumber, uint kidsNumber, uint nightsNumber, string memory internet, bool _check) public returns(uint)
  {
    users.push(User(nextId, name, room, reservationDay, reservationMonth, reservationYear, adultNumber, kidsNumber, nightsNumber, internet, _check));
    nextId++;
    
    return nextId--;
  }

  function read(uint id) view public returns(uint,string memory, string memory, uint, uint, uint, uint, uint, uint, string memory, bool) {
    uint i = find(id);
    return(users[i].id, users[i].name, users[i].room, users[i].reservationDay, users[i].reservationMonth, users[i].reservationYear, users[i].adultNumber, users[i].kidsNumber, users[i].nightsNumber, users[i].internet, users[i]. _check);
  }

  function update(uint id, string memory name, string memory room, uint reservationDay, uint reservationMonth, uint reservationYear, uint  adultNumber, uint kidsNumber, uint nightsNumber, string memory internet, bool check) public {
    uint i = find(id);
    users[i].name = name;
    users[i].room = room;
    users[i].reservationDay = reservationDay;
    users[i].reservationMonth = reservationMonth;
    users[i].reservationYear = reservationYear;
    users[i].adultNumber  = adultNumber;
    users[i].kidsNumber   = kidsNumber;
    users[i].nightsNumber = nightsNumber;
    users[i].internet = internet;
    users[i]._check = check;
  }
  
  function dateUpdate(uint id, uint reservationDay, uint reservationMonth, uint reservationYear)public{
       uint i = find(id);    
       users[i].reservationDay = reservationDay;
       users[i].reservationMonth = reservationMonth;
       users[i].reservationYear = reservationYear;
  }
  function internetUpdate(uint id, string memory internet) public{
      uint i = find(id); 
      users[i].internet = internet;
  }
  function destroy(uint id) public {
    uint i = find(id);
    delete users[i];
  }

  function find(uint id) view internal returns(uint) {
    for(uint i = 0; i < users.length; i++) {
      if(users[i].id == id) {
        return i;
      }
    }
    revert('User does not exist!');
  }
  
  function extraCharge() public pure returns(string memory){
      string memory charge = "log";
      return charge;
    }
  function changeReservation(uint id, uint reservationDay, uint reservationMonth, uint reservationYear)public{
      
      uint daysBeforeR;
      uint i = find(id);
      uint tmp = users[i].reservationDay;
      daysBeforeR = tmp - actualDay;
      
      if(daysBeforeR >= 7)
      {
          dateUpdate(i, reservationDay, reservationMonth, reservationYear);
          
      }else
      {
          extraCharge();
      }
  }
  
  function checkIn(uint id) public returns(bool){
      uint i = find(id);
      users[i]._check = true;
  }
  
  function checkOut(uint id) public returns(bool){
      uint i = find(id);
      users[i]._check = false;
  }
  
  
}