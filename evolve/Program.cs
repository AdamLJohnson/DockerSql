
using System.Data.SqlClient;

var cnx = new SqlConnection(args[0]);
var evolve = new Evolve.Evolve(cnx, msg => Console.WriteLine(msg))
{
    Locations = new[] { args[1] },
    IsEraseDisabled = true,
    MetadataTableSchema = "migrations"
};

evolve.Migrate();

Console.WriteLine("Done Migrating DB");