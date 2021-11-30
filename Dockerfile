#From https://github.com/tometchy/Mssql-docker-initialization-demo
# And https://www.softwaredeveloper.blog/initialize-mssql-in-docker-container

FROM mcr.microsoft.com/mssql/server:latest

USER root

#Install DotNet SDK
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-6.0
#Done Installing DotNet

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy initialization scripts
COPY . /usr/src/app

# Grant permissions for the run-initialization script to be executable
RUN chmod +x /usr/src/app/startup/run-initialization.sh

# Set environment variables, not to have to write them with docker run command
# Note: make sure that your password matches what is in the run-initialization script 
ENV SA_PASSWORD CorrectHorseBatteryStapleFor$
ENV ACCEPT_EULA Y
ENV MSSQL_PID Developer

# Expose port 1433 in case accesing from other container
EXPOSE 1433
RUN dotnet build -c Release ./evolve/EvolveMigration.csproj

# Run Microsoft SQl Server and initialization script (at the same time)
# Note: If you want to start MsSQL only (without initialization script) you can comment bellow line out, CMD entry from base image will be taken
CMD /bin/bash ./startup/entrypoint.sh