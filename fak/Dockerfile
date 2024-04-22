
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /fak

COPY . ./  


RUN dotnet restore

RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /fak
COPY --from=build-env /fak/out .
EXPOSE 8081
ENTRYPOINT ["dotnet", "fak.dll"]
