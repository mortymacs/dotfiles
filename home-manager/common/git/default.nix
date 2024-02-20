{
  programs.git = {
    enable = true;
    userName = "Morteza NourelahiAlamdari";
    userEmail = "m@0t1.me";
    aliases = {
      tree =
        "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
      del-local = "branch -d";
      del-all = "branch -D";
      show-files = "diff-tree --no-commit-id --name-only -r";
      status-lines = "diff --stat";
      conflicts = "diff --name-only --diff-filter=U --relative";
      restore-from-history =
        ''!f(){ git checkout "$(git rev-list -n 1 HEAD -- $1)"^ -- "$1"; }; f'';
    };

    delta = {
      enable = true;
      options = {
        features = "decorations mort";
        line-numbers = true;
        side-by-side = true;
        dark = true;
      };
    };

    extraConfig = {
      push = { default = "current"; };
      pager = {
        diff = "delta";
        log = "delta";
        reflog = "delta";
        show = "delta";
        blame = "delta";
      };
      help = { autocorrect = 10; };
      diff.algorithm = "histogram";
    };

    ignores = map (v: "${toString v}")
      (builtins.split "\n" (builtins.readFile ./ignore));
    includes = [
      { path = "./themes.gitconfig"; }
      {
        condition = "gitdir:~/Workspaces/gitlab.ci.fdmg.org/";
        contents = {
          user = {
            name = "Morteza NourelahiAlamdari";
            email = "mort.nourelahialamdari@company.info";
          };
        };
      }
    ];
  };
  xdg.configFile = {
    # Wallpaper.
    "git/themes.gitconfig".source = ./themes.gitconfig;
  };
}
