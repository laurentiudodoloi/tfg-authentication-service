# Tales of a fourth grade
#### Centralized API

## Prerequisites

- Microsoft.NETCore.App 5.0.4
- dotnet command tool

## Installation & Running

```sh
> git clone https://github.com/Mihneass/Tales-of-a-fourth-grade-BACK
> cd "Tales-of-a-fourth-grade-BACK"
> dotnet build
> dotnet run
```

## Code Analysis & Testing

- [SonarQube](https://www.sonarqube.org/success-download-community-edition/)
- [SonarScanner](https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/5.1.0.28487/sonar-scanner-msbuild-5.1.0.28487-net5.0.zip) (for Windows)

Please follow the steps from the [official documentation](https://docs.sonarqube.org/latest/) for running the server and creating an application.

Once the server is up and running, go to the project root and run:

```sh
> dotnet-sonarscanner begin /k:"<PROJECT_KEY>" /d:sonar.host.url="http://localhost:<SERVER_PORT>" /d:sonar.login="<APP_TOKEN>"

> dotnet build

> dotnet sonarscanner end /d:sonar.login="<APP_TOKEN>"
```

The **default port** for SonarQube is **9002**.
# tfg-authentication-service
