namespace football.leagues;

@assert.unique: {
  name: [name],
}
entity FootballLeagues {
  key id : Integer;

  @mandatory 
  country : String(2);

  @mandatory 
  name    : String(120);

  @mandatory 
  @assert.range: [1, 2, 3] 
  level   : Integer;

  teams: Association to many Teams on teams.footballLeague = $self;
}

@assert.unique: {
  name: [name],
}
entity Teams {
  key id   : Integer;
  @mandatory name : String(120);
  @mandatory stadiumName : String(120);
  @mandatory city : String (120);
  @mandatory numberPlayers  : Integer;
  @mandatory footballLeague: Association to FootballLeagues; 
  players: Association to many Players on players.team =$self;
}

entity Players {
  key id   : Integer;
  @mandatory name : String(120);
  @mandatory surname : String(120);
  @mandatory number : Integer;
  @mandatory active : Boolean;
  team: Association to Teams;
}


