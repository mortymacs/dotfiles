{
    programs.git = {
        enable = true;
        userName = "Morteza NourelahiAlamdari";
        userEmail = "m@0t1.me";
        aliases = {
            tree = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
            del-local = "branch -d";
            del-all = "branch -D";
            show-files = "diff-tree --no-commit-id --name-only -r";
            status-lines = "diff --stat";
            conflicts = "diff --name-only --diff-filter=U --relative";
            restore-from-history = "!f(){ git checkout \"$(git rev-list -n 1 HEAD -- $1)\"^ -- \"$1\"; }; f";
        };

        delta = {
            enable = true;
            options = {
                features = "decorations woolly-mammoth";
                line-numbers = true;
                side-by-side = true;
                dark = true;
            };
        };
    };
}
