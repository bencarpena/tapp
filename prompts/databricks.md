# Collection of databricks-cli commands

## Install terminal via winget
- Reference: https://docs.databricks.com/en/dev-tools/cli/install.html#winget-install

![winget install](img/terminal-windows.png)

## Install Databricks CLI 
- `winget install Databricks.DatabricksCLI`
- Verify using: `databricks -v`

![version verify](img/dbricks-cli-version.png)

## Connect to Databricks via CLI
- `databricks configure --token`

![connect to cli via token](img/dbricks-connect-cli.png)

## List tokens used in the tenant
- List all tokens in tenant: `databricks token-management list`
- List my created tokens: `databricks tokens list`

![token mgmt](img/dbricks-token-mgmt.png)
