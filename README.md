> nix-home: user configuration for Nix

# Background

I am using [`home-manager`](https://github.com/rycee/home-manager) for configuring my user accounts.  A lot of it can be done in `configuration.nix` (the system configuration) but
- That ends up making them global settings that require root to change
- Not compatible with running Nix on anything besides NixOS

I chose `home-manager` because it seemed to have the most momentum.  Other approaches considered:
- Don't manage anything and expose packages as sets like [pSub](https://github.com/pSub/configs/blob/master/nix/.config/nixpkgs/config.nix)
- Use [`sheenobu/nix-home`](https://github.com/sheenobu/nix-home)
- Fork [`akavel`'s nix-home](https://github.com/akavel/nix-config/blob/master/.nixpkgs/nix-home.nix)

Other examples of `home-manager`:
- [`utdemir/dotfiles`](https://github.com/utdemir/dotfiles)
- [Post your home-manager file! reddit thread](https://www.reddit.com/r/NixOS/comments/9bb9h9/post_your_homemanager_homenix_file/?st=k2z97jth&sh=ab2296f5)
- [Home Manager wiki page](https://nixos.wiki/wiki/Home_Manager)

See also my [nixos-config](https://github.com/epage/nixos-config)

# Using

1. [Install home-manager](https://rycee.gitlab.io/home-manager/index.html).  TODO How do I get nixos-config to do this for me?

2. Download the configuration
```bash
mkdir -p ~/.config/nipkgs
cd ~/.config/nipkgs
git clone https://github.com/epage/nix-home.git
```

3. Choose the desired `~/.config/nixpkgs/home.nix`
```nix
{
  imports = [
    ./nix-home/users/<name>.nix
  ];

  home.stateVersion = "19.09";
}
```

4. Activate the configuration
```bash
home-manager switch
```

# Implementation

- `users/`: top-level files.
- `profiles/`: slices of configuration that can be pulled in.
- `pkgs/`: Package-specific config
