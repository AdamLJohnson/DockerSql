
using System.Data.SqlClient;

try
{
    var cnx = new SqlConnection(args[0]);
    var evolve = new Evolve.Evolve(cnx, msg => Console.WriteLine(msg))
    {
        Locations = new[] { args[1] },
        IsEraseDisabled = true,
        MetadataTableSchema = "migrations"
    };

    evolve.Migrate();
}
catch (Exception ex)
{
    throw;
}

Console.WriteLine("Done Migrating DB");