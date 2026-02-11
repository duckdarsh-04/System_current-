{ pkgs, ... }:
{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    options = {
      autoindent = true;
      smartindent = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      autochdir = true;
    };

    navigation = {
      harpoon.enable = true;
      harpoon.mappings.file1 = "<leader>1";
      harpoon.mappings.file2 = "<leader>2";
      harpoon.mappings.file3 = "<leader>3";
      harpoon.mappings.file4 = "<leader>4";
      harpoon.mappings.markFile = "<leader>a";
      harpoon.mappings.listMarks = "<leader>l";
    };

    clipboard.enable = true;
    clipboard.providers.wl-copy.enable = true;
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
      };
      "zen-mode.nvim" = {
        package = pkgs.vimPlugins.zen-mode-nvim;
        setupModule = "zen-mode";
      };
      "nvim-notify" = {
        package = pkgs.vimPlugins.nvim-notify;
        setupModule = "notify";
      };
      "indent-blankline.nvim" = {
        package = pkgs.vimPlugins.indent-blankline-nvim;
        setupModule = "ibl";
      };
    };

    lsp.enable = true;
    lsp.formatOnSave = true;
    lsp.lightbulb.enable = true;
    lsp.trouble.enable = true;

    spellcheck = {
      enable = true;
      languages = [ "en" ];
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
      {
        key = "<leader>z";
        mode = "n";
        action = ":ZenMode<CR>";
        desc = "Toggle Zen Mode";
        silent = true;
      }
      {
        key = "<leader>gg";
        mode = "n";
        action = ":LazyGit<CR>";
        desc = "Open LazyGit";
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
