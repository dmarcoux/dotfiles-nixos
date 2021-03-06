{ pkgs, ... }:

{
  home.file."bin/rofi-pass" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash
      # A rofi frontend to pass
      #
      # Use with: rofi -modi "pass:rofi-pass" -show pass

      if [ -z "$*" ]; then
        # rofi first calls the script with no arguments

        # List full paths of entries stored by pass under $PASSWORD_STORE_DIR
        # Keep the relative paths of these entries without the .gpg extension (just like how pass does it)
        fd ".gpg$" "$PASSWORD_STORE_DIR" | sed -e "s|$PASSWORD_STORE_DIR/\(.*\)\.gpg|\1|g" | sort
      else
        # Once the user selected an entry, rofi calls the script again with the selected entry as an argument

        # Retrieve the password for the selected entry (it's the first line) and type it out in the focused window
        # Note: coproc starts the command group ({ ... }) as a background job (so it doesn't freeze rofi)
        coproc { pass show "$*" | head --lines=1 | xdotool type --clearmodifiers --file - > /dev/null & }
      fi
    '';
  };
}
