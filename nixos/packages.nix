# Packages to install without any specific configuration
# They are installed in the system profile
# Search for packages to install with `nix search package_name`

{ pkgs, unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    ansible
    arandr
    atool
    bind
    binutils-unwrapped
    buku
    discord
    docker-credential-helpers
    element-desktop
    galculator
    gcc
    gnumake
    godot
    hicolor-icon-theme
    libreoffice
    love_11
    mumble
    mupdf
    nix-index
    unstable.anki-bin # TODO 21.05 anki-bin is not available in 20.09
    unstable.nodejs-14_x
    unstable.rust-analyzer
    openresolv
    openvpn
    p11-kit
    pdftk
    peek
    rake
    ruby
    rustup
    shellcheck
    tealdeer
    teams
    thunderbird-bin
    tigervnc
    units
    universal-ctags
    unzip
    update-resolv-conf
    viewnior
    vlc
    whois
    x11vnc
    xidlehook
    xournal
    xsel
    zeal
    zbar
    zip
  ];
}
