FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src
COPY ["WebApp/", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"

WORKDIR /src/WebApp
RUN dotnet build "WebApp.csproj" -c Release -o /app/build

RUN dotnet publish "WebApp.csproj" -c Release -o /app/publish
EXPOSE 8080
ENTRYPOINT ["dotnet", "/app/publish/WebApp.dll"]