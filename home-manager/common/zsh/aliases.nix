{
  # System.
  u = ''(){
          if [ -n "$1" ]
          then
            nix flake update
            sudo nixos-rebuild switch --flake ".#$1";
            home-manager switch --flake ".#$1";

             nvim --headless "+Lazy! sync" +qa

              for img in localstack/localstack bitnami/openldap redis:alpine mysql postgres elasticsearch:8.8.1 kennethreitz/httpbin
              do
                docker pull $img;
            done

              fwupdmgr get-updates
          else
              echo "need profile"
          fi
      }'';

  # Read.
  cat = "bat";
  less = "less -N";
  pdf = "zathura";

  # File and directory.
  l = "exa --git -lh --octal-permissions --color-scale --icons";
  f = "fzf --no-mouse --preview 'bat {} --style=numbers --color=always'";
  o = "v \`f || echo '-c :quitall'\`";
  li = "walk --icons";
  gg = "batgrep -i";
  gf = ''(){
    gg "$1" -g "$2"
  }'';
  gfa = ''(){
    gg "$1" -g "*.$2"
  }'';
  gfi = "sk -i -c 'rg {}'";
  rm = "trash";
  z = ''(){
            if [ "$#" -eq 0 ]; then
                cd "$(zoxide query -i)"
            else
                cd "$(zoxide query $@)"
            fi
        }'';
  ## http://www.bashoneliners.com/oneliners/235/
  mkcd = ''(){
    mkdir -p "$1" && cd "$1"
  }'';
  ## https://superuser.com/a/1545418/298390
  tar-tree = ''(){
    tar -tf "$1" | tree --fromfile .
  }'';

  # Editor.
  v = "nvim";
  hex = "hexyl";

  # Tmux.
  t = ''(){
      if [ "$#" -eq 0 ]; then
          session_name=$(basename $(pwd))
          [ $(tmux list-sessions 2>/dev/null | awk '{print $1}' | grep $session_name) ] && session_name=$(basename $(dirname $(pwd)))/$(basename $(pwd))
      else
          session_name="$1"
      fi

      if [ $(tmux list-sessions 2>/dev/null | awk '{print $1}' | grep $session_name) ]; then
          echo "Session already exists!"
      else
          echo $session_name | xargs tmux new-session -d -s ; tmux attach
      fi
  }'';
  tl = "tmux ls -F \#S";
  ta = ''(){
            if [ "$#" -eq "0" ]; then
                session=$(tl | fzf --no-mouse)
                [ ! -z "$session" ] && tmux attach -t "$session"
            else
                tmux attach -t "$@"
            fi
        }'';
  tq = "tl | xargs -n 1 tmux kill-session -t ; tl";

  # Development.
  ## https://github.com/universal-ctags/ctags/issues/218#issuecomment-72355190
  gt = "fd | ctags --links=no -L-";
  http-server = ''(){
            python -m http.server "$1" & firefox http://localhost:"$1"
        }'';
  http-test-server = "docker run --rm -d -p 9090:80 --name http-test-server kennethreitz/httpbin";
  code-capture = ''(){
            silicon "$1" -o $(basename "$\{1%%.*\}.png") --no-window-controls --font "CodeNewRoman Nerd Font Mono" --background '#fff0' --theme Coldark-Dark
        }'';
  code-info = "tokei";

  # Git.
  p = ''(){
            if [ "$#" -eq 0 ]; then
                project=$(ghq list | fzf --no-mouse -e)
                [ -n "$project" ] && cd "$GHQ_ROOT/$project"
            elif [ "$#" -eq 1 ]; then
                project=$(ghq list | fzf --no-mouse -e -q "$1")
                [ -n "$project" ] && cd "$GHQ_ROOT/$project"
            else
                ghq "$@"
            fi
        }'';
  diff = "delta";
  blame = "git blame \`f\`";

  # Project / stack.
  s = ''() {
            if [ "$#" -eq "0" ]; then
                stack=$(tmuxp ls | fzf --no-mouse)
                [ ! -z "$stack" ] && tmuxp load "$stack"
            else
                tmuxp load "$@"
            fi
        }'';

  # Cloud.
  localstack = ''(){
            docker run -d --rm \
                -p 4566:4566 -p 4510-4559:4510-4559 \
                --name localstack \
                localstack/localstack

            wait4x http http://127.0.0.1:4566

            for i in $(seq 1 3); do
                aws --endpoint-url http://127.0.0.1:4566 --region us-east-1 --profile localstack sqs create-queue --queue-name "sqs$i"
                aws --endpoint-url http://127.0.0.1:4566 --region us-east-1 --profile localstack sns create-topic --name "sns$i"
                aws --endpoint-url http://127.0.0.1:4566 --region us-east-1 --profile localstack s3api create-bucket --bucket "s3$i"
            done
        }'';
  aws-local = "aws --endpoint-url http://127.0.0.1:4566 --region us-east-1 --profile localstack";

  # Docker.
  ## http://www.bashoneliners.com/oneliners/252/
  dic = "docker images -q -f dangling=true | xargs --no-run-if-empty --delim='\n' docker rmi -f";
  dcr = ''(){
            docker run --rm "$\{@:2\}" "$1"
        }'';
  dca = ''(){
            docker run -ti --rm "$\{@:2\}" "$1" sh
        }'';
  dce = ''(){
            docker exec -ti "$1" "$\{2:-bash\}"
        }'';

  # Kubernetes.
  kubectl = "kubecolor";

  # Server/Proxy.
  ping = "gping --vertical-margin 0";
  x = "export http_proxy='http://127.0.0.1:8118'";
  dx = "export http_proxy=''";
  whereiam = "echo $(curl -s http://ip-api.com/json | jq -r '.country,.city')";
  dig = "dog";
  vpn = "cd $HOME/.local/bin/cato && ./cclient.sh start --append=tail --route=10.0.0.0/8";

  # LDAP.
  ldap-server = ''(){
            docker run -d --rm \
                -p 1389:1389 -p 1636:1636 \
                --name openldap \
                -e LDAP_ADMIN_USERNAME=admin -e LDAP_ADMIN_PASSWORD=secret -e LDAP_USERS=user -e LDAP_PASSWORDS=secret \
                bitnami/openldap
        }'';

  # C/C++.
  rcpp = "rm -rf CMakeFiles/ Testing/ CMakeCache.txt *.cmake Makefile compile_commands.json *.cbp";
  c-debug = ''(){
            target_file=$(fzf --no-mouse)
            target_line=$(\cat -n "$target_file" | fzf --no-mouse | awk '{print $1}')
            gdb -ex "b $target_file:$target_line" "$1"
        }'';

  # Rust.
  rs-debug = ''() {
    target_file=$(fzf --no-mouse)
    target_line=$(\cat -n "$target_file" | fzf --no-mouse | awk '{print $1}')
    rust-gdb -ex "b $target_file:$target_line" "$1"
  }'';

  # Python.
  py = "ipython --no-term-title --no-confirm-exit --no-banner --no-simple-prompt --PlainTextFormatter.pprint=True --TerminalInteractiveShell.highlighting_style=material";
  rpy = "fd -I \"(build|dist|__pycache__|egg-info)\" | xargs rm -rf --";

  # Go.
  go-debug = ''(){
            target_file=./$(fzf --no-mouse)
            target_line=$(\cat -n "$target_file" | fzf --no-mouse | awk '{print $1}')
            dlv debug "$1" --init <(echo "break $target_file:$target_line")
        }'';

  # DB.
  redis-server = ''(){
            docker run -d --rm \
                -p 6379:6379 \
                --hostname redis --name redis \
                redis:alpine redis-server
        }'';
  mysql-server = ''(){
            docker run -d --rm \
                -p 3306:3306 \
                --hostname mysql --name mysql \
                -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE="db" -e MYSQL_USER=user -e MYSQL_PASSWORD=secret \
                mysql
        }'';
  mysql = ''(){
            if [ "$#" -eq "0" ]; then
                conn_str=$(mycli --list-dsn | fzf)
                [ ! -z "$conn_str" ] && mycli "$conn_str"
            else
                mycli "$@"
            fi
        }'';
  elasticsearch-server = ''(){
            docker run -d --rm \
                -p 9200:9200 -p 9300:9300 \
                --hostname elasticsearch --name elasticsearch \
                -e 'discovery.type=single-node' -e 'xpack.security.enabled=false' \
                elasticsearch:8.5.3
        }'';
  postgresql-server = ''(){
            docker run -d --rm \
                -p 5432:5432 \
                --hostname postgresql --name postgresql \
                -e POSTGRES_DB="db" -e POSTGRES_USER=user -e POSTGRES_PASSWORD=secret \
                postgres
        }'';
  postgresql = ''(){
            if [ "$#" -eq "0" ]; then
                conn_str=$(pgcli --list-dsn | awk '{print $1}' | fzf)
                [ ! -z "$conn_str" ] && pgcli -D "$conn_str"
            else
                pgcli "$@"
            fi
        }'';

  # Compression.
  tgz = "rpy && rm -f `basename $PWD`.tar.gz && tar --exclude='.git' --exclude='.gitignore' --exclude-vcs-ignores -zcvf `basename $PWD`.tar.gz ./*";
  # https://gitlab.com/dwt1/dotfiles/-/blob/master/.bashrc
  extract = ''(){
            if [ -f "$1" ] ; then
                case $1 in
                    *.tar.bz2)   tar xjf $1   ;;
                    *.tar.gz)    tar xzf $1   ;;
                    *.bz2)       bunzip2 $1   ;;
                    *.rar)       unrar x $1   ;;
                    *.gz)        gunzip $1    ;;
                    *.tar)       tar xf $1    ;;
                    *.tbz2)      tar xjf $1   ;;
                    *.tgz)       tar xzf $1   ;;
                    *.zip)       unzip $1     ;;
                    *.Z)         uncompress $1;;
                    *.7z)        7z x $1      ;;
                    *.deb)       ar x $1      ;;
                    *.tar.xz)    tar xf $1    ;;
                    *.tar.zst)   unzstd $1    ;;
                    *)           echo "'$1' cannot be extracted via extract()" ;;
                esac
            else
                echo "'$1' is not a valid file"
            fi
      }'';

  # Process.
  ps = "procs";
  kp = ''() {
          ps | \grep -v fzf | fzf -m --no-mouse -q "$1" | cut -d' ' -f2 | xargs -r kill -9
      }'';
  ap = ''(){
          ps -t --thread | \grep -v fzf | fzf -m --no-mouse -q "$1"
      }'';

  # Utility.
  cb = "xclip -selection clipboard";
  calc = "qalc";
  cleanup = ''(){
        trash-empty
        docker system prune
      }'';
  # https://www.howtogeek.com/414574/how-to-burn-an-iso-file-to-a-usb-drive-in-linux/
  iso-to-usb = ''(){
    sudo dd bs=4M if="$\{1\}" of="$\{2\}" conv=fdatasync status=progress
  }'';
  hq = "htmlq";
}
