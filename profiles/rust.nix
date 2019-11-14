{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    cargo
    rustc
    rustfmt

    cargo-bloat
    cargo-edit
    cargo-tree
    cargo-outdated

  ];

  environment.variables = {
    RUST_BACKTRACE = "1";
  };
}
