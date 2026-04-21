{ pkgs, config, ... }:

{
  programs.obsidian = {
    enable = true;

    vaults."Obsidian-vault-university" = {
      target = "Documents/Obsidian-vault-university";

      settings.app = {
        vimMode = true;
        showLineNumber = true;
        promptDelete = false;
        pdfExportSettings = {
          includeName = true;
          pageSize = "Letter";
          landscape = false;
          margin = "0";
          downscalePercent = 100;
        };
      };

      settings.appearance = {
        theme = "obsidian";
        cssTheme = "Typewriter";
        monospaceFontFamily = "Times New Roman";
        textFontFamily = "Times New Roman";
        interfaceFontFamily = "Times New Roman";
      };

      settings.corePlugins = [
        "file-explorer"
        "global-search"
        "switcher"
        "graph"
        "backlink"
        "canvas"
        "outgoing-link"
        "tag-pane"
        "properties"
        "page-preview"
        "daily-notes"
        "templates"
        "note-composer"
        "command-palette"
        "editor-status"
        "bookmarks"
        "outline"
        "word-count"
        "file-recovery"
        "sync"
        "bases"
      ];

      settings.communityPlugins = [
        "obsidian-git"
        "easy-typing-obsidian"
        "obsidian-icon-folder"
        "highlightr-plugin"
        "obsidian-icons-plugin"
        "better-word-count"
        "table-editor-obsidian"
        "obsidian-relative-line-numbers"
        "obsidian-pandoc"
        "obsidian-smart-typography"
      ];
    };
  };

}
