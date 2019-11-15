{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo
    rustc
    rustfmt

    cargo-bloat
    cargo-edit
    cargo-tree
    cargo-outdated
  ];

  home.sessionVariables = {
    RUST_BACKTRACE = "1";
  };
}
