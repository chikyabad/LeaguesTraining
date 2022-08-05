using football.leagues as leagues from '../db/schema';

@path:'leagues-service'
service LeaguesService
{       
    entity Leagues as projection on leagues.FootballLeagues;
    entity Teams as projection on leagues.Teams;
    entity Players as projection on leagues.Players;
    
 };