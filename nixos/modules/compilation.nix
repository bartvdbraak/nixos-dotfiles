{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mold
    gcc
    ninja
    clang
    lld
    lldb
    musl
  ];
}
