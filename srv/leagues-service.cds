using football.leagues as leagues from '../db/schema';

@path:'leagues-service'
@requires: 'LeaguesViewer'
service LeaguesService
{       
    @readonly entity Leagues as projection on leagues.FootballLeagues;
    @readonly entity Teams as projection on leagues.Teams;
    @readonly entity Players as projection on leagues.Players;
    
 };

@path:'leagues-service-admin'
@requires: 'LeaguesAdmin'
service LeaguesServiceAdmin
{       
    entity Leagues as projection on leagues.FootballLeagues;
    entity Teams as projection on leagues.Teams;
    entity Players as projection on leagues.Players;
    action DeactivatePlayer(id: Integer) returns Players;
    
 };
