# MaXX Unofficial
MaXX Interactive Desktop unofficial scripts and configuration.

### Note:
Due to the nature of rolling releases, both distros now have the `symbol lookup error: /usr/lib/libgtk-4.so.1: undefined symbol: png_get_cICP, version PNG16_0` issue.

This is a known issue for MaXX, with the current workaround being to unset `LD_LIBRARY_PATH` prior to launching GTK4 apps.

```bash
LD_LIBRARY_PATH='' pavucontrol
```

## CachyOS
Installer script for CachyOS. Works with no desktop selected, but assumes a display manager has already been setup.

## OpenSUSE Tumbleweed
Installer script aimed around "Generic Desktop" pattern for minimal system. Should work with other desktop environment patterns.

Tested with snapshot 20251024
