# Login System using Typescript for FiveM

![image](https://user-images.githubusercontent.com/87246847/215305022-0b3661fa-a5b6-4cf6-b3f4-939948868105.png)

An easy Login System for FiveM using Typescript

## Installation

1. Download the resource.
2. Drag and drop to resources folder.
3. Install all node modules, using the command "npm i" next "npm run build"
4. Just ensure it on your server.cfg

## Usage

Use `startLockpick` export to start lockpicking.

```lua
RegisterCommand('login', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open' })
end)
```

## Contribution

Suggestions and pull request are welcome!
