{
  # Process.
  ps = "procs";

  # Editor.
  v = "$EDITOR";
  e = "emacsclient --reuse-frame";

  # Read.
  cat = "bat";
  less = "less -N";
  pdf = "zathura";
  hq = "htmlq";

  # File and directory.
  l = ''
    eza --git -lh \
        --octal-permissions \
        --color-scale all --icons always --color-scale-mode fixed'';
  li = "walk --icons";

  # Search.
  f = "fzf --no-mouse --preview 'bat {} --style=numbers --color=always'";
  gg = "rg -i -n";
  cg = "ast-grep run --pattern";
  gfi = "sk -i -c 'rg {}'";

  # Git.
  blame = "git blame `f`";

  # Tmux.
  tq = "tl | xargs -n 1 tmux kill-session -t ; tl";
  tl = "tmux ls -F '#S'";

  # DevOps.
  kubectl = "kubecolor";
  aws-local = ''
    aws --endpoint-url http://127.0.0.1:4566 \
        --region us-east-1 \
        --profile localstack'';

  # Server/Proxy.
  ping = "gping --vertical-margin 0";
  x = "export http_proxy='http://127.0.0.1:8118'";
  dx = "export http_proxy=''";
  whereiam = "echo (curl -s http://ip-api.com/json | jq -r '.country,.city')";
  vpn = "sudo cato-sdp start --use-systemd-resolv --route 10.0.0.0/8 --reconn 5";

  # Programming.
  code-info = "tokei";
  ## C/C++.
  gcc = "gcc -Wall -Werror -Wfatal-errors -Wextra";
  "g++" = "g++ -Wall -Werror -Wfatal-errors -Wextra";
  clang = "clang -Weffc++ -Wall -Werror  -Wfatal-errors -Wextra";
  "clang++" = "clang++ -Weffc++ -Wall -Werror  -Wfatal-errors -Wextra";
  ## Python.
  py = ''
    ipython --no-term-title --no-confirm-exit --no-banner --no-simple-prompt \
        --PlainTextFormatter.pprint=True \
        --TerminalInteractiveShell.highlighting_style=material'';
  rpy = ''fd -I "(build|dist|__pycache__|egg-info)" | xargs rm -rf --'';
  apy = "source ./.venv/bin/activate.fish";

  # Compression.
  tgz = ''
    rpy \
    && rm -f `basename $PWD`.tar.gz \
    && tar --exclude='.git' --exclude='.gitignore' --exclude-vcs-ignores -zcvf (basename $PWD).tar.gz ./*'';

  # Utility.
  calc = "qalc";
}
