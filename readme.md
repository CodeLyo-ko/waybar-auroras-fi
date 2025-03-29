# Waybar Aurora Module

A waybar module with live auroras forecast. Uses data from the Finnish Meterological Institute. Feel free to modify it to use other data from other places.

## Example configuration

Copy `aurora.py` and `aurora.sh` to `.config/waybar/script/aurora/`.
Add this to your waybar config file:
```jsonc
"custom/aurora": {
    "exec": "~/.config/waybar/scripts/aurora/aurora.sh",
    "on-click": "~/.config/waybar/scripts/aurora/aurora.sh -u",
    "on-click-right": "~/.config/waybar/scripts/aurora/aurora.sh -d",
    "tooltip": false,
    "format": "{} {icon}",
    "format-icons": {
        "high": "<span color='#c43061'>󰢾</span>",
        "medium": "<span color='#f08e48'>󰢽</span>",
        "low": "󰢼"
    },
    "restart-interval":10,
    "return-type":"json",
}
```

