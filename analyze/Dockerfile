
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /analyze

COPY . ./  


RUN dotnet restore

RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /analyze
COPY --from=build-env /analyze/out .
EXPOSE 8082
ENTRYPOINT ["dotnet", "analyze.dll"]
