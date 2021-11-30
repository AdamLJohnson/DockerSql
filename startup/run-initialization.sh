# Wait to be sure that SQL Server came up
sleep 15s

# Run the setup script to create the DB and the schema in the DB
# Note: make sure that your password matches what is in the Dockerfile
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P CorrectHorseBatteryStapleFor$ -d master -Q "CREATE DATABASE DemoData;"
cd evolve
dotnet run "Server=localhost;Database=DemoData;User Id=sa;Password=CorrectHorseBatteryStapleFor$;" "../db"