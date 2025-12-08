{pkgs, ...}: {
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };
    dashboard.alpha.enable = true;
    dashboard.alpha.theme = "startify";
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    filetree.neo-tree.enable = true;
    tabline.nvimBufferline.enable = true;
    autopairs.nvim-autopairs.enable = true;
    lazy.enable = true;
    lazy.plugins = {
      "lazygit.nvim" = {
        package = pkgs.vimPlugins.lazygit-nvim;
        setupModule = "lazygit";
      };
      "zen-mode.nvim" = {
        package = pkgs.vimPlugins.zen-mode-nvim;
        setupModule = "zenmode";
      };
    };
    lsp.enable = true;
    lsp.formatOnSave = true;
    lsp.lightbulb.enable = true;
    lsp.trouble.enable = true;

    spellcheck = {
      enable = true;
      languages = ["en"];
      #programmingWordlist = true;
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    keymaps = [
      {
        key = "<leader>cs";
        mode = "n";
        silent = true;
        action = ":Cheatsheet<CR>";
        desc = "Open Cheatsheet";
      }
      {
        key = "<leader>e";
        mode = "n";
        action = ":Neotree toggle<CR>";
        desc = "toggle Neo-tree";
        silent = true;
      }
    ];

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      smartcolumn = {
        enable = true;
      };
      fastaction.enable = true;
    };

    comments = {
      comment-nvim.enable = true;
    };

    languages = {
      enableTreesitter = true;
      lua.enable = true;
      nix.enable = true;
      ts.enable = true;
      rust.enable = true;
      python.enable = true;
      html.enable = true;
      markdown.enable = true;
    };
  };
}
