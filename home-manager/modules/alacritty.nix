{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      colors.bright = {
        black = "#444b6a";
        blue = "#7da6ff";
        cyan = "#0db9d7";
        green = "#b9f27c";
        magenta = "#bb9af7";
        red = "#ff7a93";
        white = "#acb0d0";
        yellow = "#ff9e64";
      };

      colors.cursor = {
        cursor = "#c8d3f5";
      };

      colors.normal = {
        black = "#32344a";
        blue = "#7aa2f7";
        cyan = "#449dab";
        green = "#9ece6a";
        magenta = "#ad8ee6";
        red = "#f7768e";
        white = "#787c99";
        yellow = "#e0af68";
      };

      colors.primary = {
        background = "#1a1b26";
        foreground = "#a9b1d6";
      };

      font = {
        size = 14;
      };

      font.bold = {
        family = "JetBrainsMonoNLNerdFont";
        style = "Bold";
      };

      font.bold_italic = {
        family = "JetBrainsMonoNLNerdFont";
        style = "BoldItalic";
      };

      font.italic = {
        family = "JetBrainsMonoNLNerdFont";
        style = "Italic";
      };

      font.normal = {
        family = "JetBrainsMonoNLNerdFont";
        style = "Regular";
      };

      mouse = {
        hide_when_typing = true;
      };

      shell = {
        args = [ "new-session" "-A" "-D" "-s" "main" ];
        program = "tmux";
      };

      window = {
        decorations = "none";
        dynamic_padding = true;
        startup_mode = "Maximized";
      };

      window.dimensions = {
        columns = 80;
        lines = 24;
      };
    };
  };
}
