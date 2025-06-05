{
  config,
  ...
}:
let
  base16Scheme = if config ? stylix then config.stylix.base16Scheme else { };
in
{
  sidebar_width = 1;
  notify = "mention";
  emoji = false;

  # command
  key_map.command."i" = "mode-insert";
  key_map.command."/" = "mode-search";
  key_map.command."k" = "channel-up";
  key_map.command."j" = "channel-down";
  key_map.command."g" = "channel-top";
  key_map.command."G" = "channel-bottom";
  key_map.command."K" = "thread-up";
  key_map.command."J" = "thread-down";
  key_map.command."<previous>" = "chat-up";
  key_map.command."C-b" = "chat-up";
  key_map.command."C-u" = "chat-up";
  key_map.command."<next>" = "chat-down";
  key_map.command."C-f" = "chat-down";
  key_map.command."C-d" = "chat-down";
  key_map.command."n" = "channel-search-next";
  key_map.command."N" = "channel-search-previous";
  key_map.command."'" = "channel-jump";
  key_map.command."q" = "quit";
  key_map.command."<f1>" = "help";

  # insert
  key_map.insert."<left>" = "cursor-left";
  key_map.insert."<right>" = "cursor-right";
  key_map.insert."<enter>" = "send";
  key_map.insert."<escape>" = "mode-command";
  key_map.insert."<backspace>" = "backspace";
  key_map.insert."C-8" = "backspace";
  key_map.insert."<delete>" = "delete";
  key_map.insert."<space>" = "space";

  # search
  key_map.search."<left>" = "cursor-left";
  key_map.search."<right>" = "cursor-right";
  key_map.search."<escape>" = "clear-input";
  key_map.search."<enter>" = "clear-input";
  key_map.search."<backspace>" = "backspace";
  key_map.search."C-8" = "backspace";
  key_map.search."<delete>" = "delete";
  key_map.search."<space>" = "space";

  # theme view
  theme.view.fg = base16Scheme.base05 or "white";
  theme.view.bg = base16Scheme.base00 or "default";
  theme.view.border_fg = base16Scheme.base0D or "white";
  theme.view.border_bg = base16Scheme.base03 or "";
  theme.view.label_fg = base16Scheme.base05 or "white";
  theme.view.label_bg = base16Scheme.base01 or "";

  # theme channel
  theme.channel.prefix = "";
  theme.channel.icon = "";
  theme.channel.text = "";

  # theme message
  theme.message.time_format = "15=04";
  theme.message.name = "colorize";
  theme.message.time = "";
  theme.message.text = "";
}
