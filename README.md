> nixos-config: system configuration for NixOS

All you need in `configuration.nix`
```nix
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <path>/machines/<machine>.nix
    ];

  system.stateVersion = # ...
}
```

# Implementation

- `machines/`: top-level files.
- `profiles/`: slices of configuration that can be pulled in.
- `hardware/`: Low-level hardware support (on top of the auto-generated `hardware-configuration. nix`)
- `users/`: Potential users for the various machines.
- `pkgs/`: TBD

# Resources

- Based on [ghuntley/dotfiles-nixos](https://github.com/ghuntley/dotfiles-nixos)
