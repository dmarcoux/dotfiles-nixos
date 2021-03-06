# User configuration with home-manager
# https://rycee.gitlab.io/home-manager/options.html

{ config, pkgs, unstable, ... }:

{
  imports = [
    (import ./mellowplayer.nix { pkgs = pkgs; unstable = unstable; })
    (import ./neovim.nix { pkgs = pkgs; unstable = unstable; })
    (import ./starship.nix { unstable = unstable; })
    (import ./vscode.nix { pkgs = pkgs; unstable = unstable; })
    ../secrets/ssh/work.nix
    ./autorandr.nix
    ./bat.nix
    ./cbatticon.nix
    ./dircolors.nix
    ./exa.nix
    ./fd.nix
    ./firefox.nix
    ./flameshot.nix
    ./fzf.nix
    ./git.nix
    ./gnupg.nix
    ./gtk.nix
    ./i3.nix
    ./i3status.nix
    ./jq.nix
    ./keyboard.nix
    ./network-manager.nix
    ./password-store.nix
    ./pasystray.nix
    ./picom.nix
    ./ranger.nix
    ./redshift.nix
    ./ripgrep.nix
    ./rofi.nix
    ./ruby.nix
    ./scripts.nix
    ./ssh.nix
    ./termite.nix
    ./udiskie.nix
    ./xcape.nix
    ./xdg.nix
    ./yank.nix
    ./youtube-dl.nix
    ./zsh.nix
  ];

  # Enable home-manager to start the X session (otherwise graphical services are not started automatically)
  xsession.enable = true;

  # Set configuration defaults
  home = {
    homeDirectory = "/home/dany";
    # Switching to a higher state version typically requires performing some manual steps, such as data conversion or moving files
    # See release notes for state version changes: https://rycee.gitlab.io/home-manager/release-notes.html
    stateVersion = "21.05";
    username = "dany";
  };
}
