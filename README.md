# Set IIS Folder Permissions
Build task for VS Team Services that sets permission on IIS Web Site, Web Application or subfolder.

Initial Version: 09/21/2016

https://docs.microsoft.com/en-us/azure/devops/extend/develop/integrate-build-task?view=azure-devops

### Install tools

```
npm install -g tfx-cli
```
*restore VSCode to get tfx to work*

# Setup Typescript
```
tsc --init
```

# Build
```
tfx extension create --manifest-globs vss-extension.json
```