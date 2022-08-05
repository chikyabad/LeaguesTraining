
// Imports
const cds = require("@sap/cds");

/**
  * The service implementation with all service handlers
  */
module.exports = cds.service.impl(async function () {

    
    const { Players, Teams } = this.entities();

    this.before("CREATE", Players, async (req) => {
        
        // Recuperamos la request. En las versiones nuevas de CAP ya no es necesario.
        const tx = cds.tx(req);
        
        // Recuperamos el payload de la request
        const player = req.data;
        
        // Recuperamos los datos del equipo
        const team = await tx.run(SELECT.one.from('Teams').where({ ID: player.team_id }));
        
        // Si ya tiene 3 jugadores, lanzamos un error
        if (team.numberPlayers == 3) {
            return req.reject(404, `Team ${team.name} has already 3 players`);
        }

    });

});