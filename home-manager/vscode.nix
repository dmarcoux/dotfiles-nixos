# User configuration for VS Code

# Installing VS Code extensions with NixOS is possible, but it's quite cumbersome.
# Constantly changing the versions and sha256 checksums for frequently updated extensions is really annoying
# I prefer to install extensions in the command line once, then have them update automatically
#
# Install with:
# code --install-extension PUBLISHER.NAME
#
# List of extensions:
# vscode-icons-team.vscode-icons
# streetsidesoftware.code-spell-checker
# octref.vetur
# vscodevim.vim

{ pkgs, unstable, ... }:

{
  programs.vscode = {
    enable = true;
    # To always have the latest version available on NixOS
    package = unstable.vscode;
    keybindings = [
      # Open next editor with "Shift + Right arrow" instead of "Ctrl + Page Down"
      {
        "key" = "shift+right";
        "command" = "workbench.action.nextEditor";
      }
      {
        "key" = "ctrl+pagedown";
        "command" = "-workbench.action.nextEditor";
      }
      # Open previous editor with "Shift + Left arrow" instead of "Ctrl + Page Up"
      {
        "key" = "shift+left";
        "command" = "workbench.action.previousEditor";
      }
      {
        "key" = "ctrl+pageup";
        "command" = "-workbench.action.previousEditor";
      }
    ];
    userSettings = {
      # Spell check English, French and German
      "cSpell.language" = "en,fr,de";
      # Do not accept auto-completion suggestions with Enter (if "editor.tabCompletion" is set to "on", it will only be possible with Tab)
      "editor.acceptSuggestionOnEnter" = "off";
      # Set the font family to the one I use in i3
      "editor.fontFamily" = "'DejaVu Sans Mono'";
      # Do not show the minimap
      "editor.minimap.enabled" = false;
      # Automatically rename paired HTML tags
      "editor.renameOnType" = true;
      # Do not render the last line number when it's an empty newline
      "editor.renderFinalNewline" = false;
      # Render all whitespace characters
      "editor.renderWhitespace" = "all";
      # Enable tab completion
      "editor.tabCompletion" = "on";
      # Set the number of spaces a tab is equal to
      "editor.tabSize" = 2;
      # Do not automatically check extensions for updates
      "extensions.autoCheckUpdates" = false;
      # Do not automatically install updates for extensions
      "extensions.autoUpdate" = false;
      # Do not show notifications for extension recommendations
      "extensions.ignoreRecommendations" = true;
      # Do not fetch extension recommendations
      "extensions.showRecommendationsOnlyOnDemand" = true;
      # Insert a new line at the end of files when saving
      "files.insertFinalNewline" = true;
      # Enable git extension
      "git.enabled" = true;
      # Enable automatic updating of import paths when renaming/moving a file in VS Code
      "javascript.updateImportsOnFileMove.enabled" = "always";
      # Do not fetch data from npm to provide auto-completion and information about npm dependencies
      "npm.fetchOnlinePackageInfo" = false;
      # Do not include recently opened files in the "Quick Open" search
      "search.quickOpen.includeHistory" = false;
      # Show line numbers for search results
      "search.showLineNumbers" = true;
      # Search case-insensitively if the pattern is all lowercase, otherwise, search case-sensitively
      "search.smartCase" = true;
      # Do not send crash reports to Microsoft
      "telemetry.enableCrashReporter" = false;
      # Do not send usage data and errors to Microsoft
      "telemetry.enableTelemetry" = false;
      # Enable automatic updating of import paths when renaming/moving a file in VS Code
      "typescript.updateImportsOnFileMove.enabled" = "always";
      # Do not receive automatic updates
      "update.mode" = "none";
      # Do not show release notes after an update
      "update.showReleaseNotes" = false;
      # Handle (or not) keys in the vim extension
      "vim.handleKeys" = {
        # Do not handle "Ctrl + w" in the vim extension, it's used in closing tabs/editors in VS Code
        "<C-w>" = false;
        # Do not handle "Ctrl + b" in the vim extension, it's used in hiding the sidebar in VS Code
        "<C-b>" = false;
      };
      # Highlight matches of last search done in the vim extension
      "vim.hlsearch" = true;
      # Bind the leader key to comma, then use it in keybindings with <leader>
      "vim.leader" = ",";
      "vim.normalModeKeyBindingsNonRecursive" = [
        # Make undo work with the vim extension
        {
          "before" = ["u"];
          "commands" = ["undo"];
        }
        # Make redo work with the vim extension
        {
          #           Ctrl + r
          "before" = ["<C-r>"];
          "commands" = ["redo"];
        }
        # Turn off search highlighting
        {
          "before" = ["<leader>" "<enter>"];
          "commands" = [":nohl"];
        }
      ];
      # Disable vim-surround plugin for vim extension
      "vim.surround" = false;
      # Use system clipboard in vim extension
      "vim.useSystemClipboard" = true;
      # Do not show new version messages
      "vsicons.dontShowNewVersionMessage" = true;
      # Hide the activity bar
      "workbench.activityBar.visible" = false;
      # Set the color theme
      "workbench.colorTheme" = "Solarized Light";
      # Disable command history in the command palette
      "workbench.commandPalette.history" = 0;
      # Open files directly without previewing them (previews are reused until opened files are edited)
      "workbench.editor.enablePreview" = false;
      # Open files directly without previewing them in the "Quick Open" search
      "workbench.editor.enablePreviewFromQuickOpen" = false;
      # Do not fetch experiments
      "workbench.enableExperiments" = false;
      # Set the icon theme
      "workbench.iconTheme" = "vscode-icons";
      # Disable the natural language search mode for settings
      "workbench.settings.enableNaturalLanguageSearch" = false;
      # Restore editors from the previous session (if there are any)
      "workbench.startupEditor" = "none";
    };
  };
}
