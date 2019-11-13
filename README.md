> nixos-config: system configuration for NixOS

All you need in `configuration.nix`
```nix
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <path>/machines/<machine>.nix
    ];

  system.stateVersion = ...
}
```

# Resources

- Based on [ghuntley/dotfiles-nixos](https://github.com/ghuntley/dotfiles-nixos)
