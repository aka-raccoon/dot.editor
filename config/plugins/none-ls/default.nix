{
  lib,
  config,
  pkgs,
  ...
}:
{
  plugins = {
    none-ls = {
      enable = false;
      enableLspFormat = false;
      sources = {
        code_actions = {
          gitsigns.enable = true;
          refactoring.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          actionlint.enable = true;
          cfn_lint.enable = true;
          checkmake.enable = true;
          codespell.enable = true;
          deadnix.enable = true;
          dotenv_linter.enable = true;
          editorconfig_checker.enable = true;
          fish.enable = true;
          hadolint.enable = true;
          markdownlint_cli2.enable = true;
          sqlfluff.enable = true;
          statix.enable = true;
          todo_comments.enable = false;
          trail_space.enable = true;
          vale.enable = false;
          yamllint.enable = true;
        };
        formatting = {
          codespell.enable = true;
          mdformat = {
            # TODO: make it work with Markview
            enable = false;
            package = pkgs.mdformat.withPlugins (p: [
              p.mdformat-frontmatter
              p.mdformat-gfm
              p.mdformat-wikilink
            ]);
          };
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt-rfc-style;
          };
          sqlfluff.enable = false;
          yamlfmt = {
            enable = true;
          };
        };
      };
    };
  };
  keymaps = lib.mkIf config.plugins.none-ls.enable [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
