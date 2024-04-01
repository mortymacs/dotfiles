{
  # System.
  u = ''
    if test (count $argv) -eq 0
        echo "need profile id!"
        return 1
    end

    if test "$argv[1]" = "update"
        nix flake update
        fwupdmgr get-updates
        return 0
    end

    # System packages.
    nix flake update
    sudo nixos-rebuild switch --flake ".#$argv[1]";
    home-manager switch --flake ".#$argv[1]";

    # Restart monitor manager.
    systemctl --user restart kanshi.service

    # Nvim packages.
    nvim --headless "+Lazy! sync" +qa

    # Containers.
    for img in localstack/localstack redis:alpine mysql postgres kennethreitz/httpbin
        docker pull $img;
    end

    # Firmware.
    fwupdmgr get-updates
  '';
  cleanup = ''
    trash-empty
    # http://www.bashoneliners.com/oneliners/252/
    docker images -q -f dangling=true | xargs --no-run-if-empty --delim='\n' docker rmi -f
    docker system prune
    home-manager expire-generations "-30 days"
    nix-collect-garbage --delete-older-than 30d
  '';

  # Process.
  kp = ''
    ps | \grep -v fzf | fzf --header-lines=2 -m --no-mouse -q "$argv[1]" | cut -d' ' -f2 | xargs -r kill -9
  '';
  ap = ''
    ps -t --thread | \grep -v fzf | fzf --header-lines=2 -m --no-mouse -q "$argv[1]"
  '';

  # Containers.
  http-test-server = ''
    docker run -d --rm \
        -p 9090:80 \
        --hostname http-test-server \
        --name http-test-server \
        kennethreitz/httpbin
  '';
  redis-server = ''
    docker run -d --rm \
        -p 6379:6379 \
        --hostname redis \
        --name redis \
        redis:alpine redis-server
  '';
  mysql-server = ''
    docker run -d --rm \
        -p 3306:3306 \
        --hostname mysql \
        --name mysql \
        -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE="db" -e MYSQL_USER=user -e MYSQL_PASSWORD=secret \
        mysql
  '';
  postgresql-server = ''
    docker run -d --rm \
        -p 5432:5432 \
        --hostname postgresql \
        --name postgresql \
        -e POSTGRES_DB="db" -e POSTGRES_USER=user -e POSTGRES_PASSWORD=secret \
        postgres
  '';
  localstack = ''
    docker run -d --rm \
        -p 4566:4566 -p 4510-4559:4510-4559 \
        --name localstack \
        localstack/localstack
    wait4x http http://127.0.0.1:4566
    for i in (seq 1 3)
        aws --endpoint-url http://127.0.0.1:4566 --region us-east-1 --profile localstack sqs create-queue --queue-name "sqs$i"
        aws --endpoint-url http://127.0.0.1:4566 --region us-east-1 --profile localstack sns create-topic --name "sns$i"
        aws --endpoint-url http://127.0.0.1:4566 --region us-east-1 --profile localstack s3api create-bucket --bucket "s3$i"
    end
  '';

  # Git.
  gitignore = "curl -sL https://www.gitignore.io/api/$argv";
  p = ''
    if test (count $argv) -eq 0
        set project (ghq list | fzf --no-mouse -e)
        if test -n "$project"
            cd "$GHQ_ROOT/$project"
        end
    else if test (count $argv) -eq 1
        set project (ghq list | fzf --no-mouse -e -q "$argv[1]")
        if test -n "$project"
            cd "$GHQ_ROOT/$project"
        end
    else
        ghq $argv
    end
  '';

  # Tmux.
  t = ''
    if test (count $argv) -eq 0
        set session_name (basename (pwd))
        if test (tmux list-sessions 2>/dev/null | awk '{print $1}' | grep $session_name)
            set session_name (basename (dirname (pwd)))/(basename (pwd))
        end
    else
        set session_name "$argv[1]"
    end

    if test (tmux list-sessions 2>/dev/null | awk '{print $1}' | grep -q $session_name)
        echo "Session already exists!"
    else
        echo $session_name | xargs tmux new-session -d -s ; tmux attach
    end
  '';
  ta = ''
    if test (count $argv) -eq 0
        set session (tmux ls -F \#S | fzf --no-mouse)
        if test -n "$session"
            tmux attach -t "$session"
        end
    else
        tmux attach -t $argv
    end
  '';
  s = ''
    if test (count $argv) -eq 0
        set stack (tmuxp ls | fzf --no-mouse)
        if not test -z "$stack"
            tmuxp load "$stack"
        end
    else
        tmuxp load $argv
    end
  '';

  # Programing.
  rcpp =
    "rm -rf CMakeFiles/ Testing/ CMakeCache.txt *.cmake Makefile compile_commands.json *.cbp";
  c-debug = ''
    # g++ -g3 file.cpp -o file.out && c-debug file.out
    set target_file (fzf --no-mouse)
    set target_line (command cat -n "$target_file" | fzf --no-mouse | awk '{print $1}')
    cgdb -ex "b $target_file:$target_line" "$argv[1]"
  '';
  rs-debug = ''
    set target_file (fzf --no-mouse)
    set target_line (command cat -n "$target_file" | fzf --no-mouse | awk '{print $1}')
    rust-gdb -ex "b $target_file:$target_line" "$argv[1]"
  '';
  go-debug = ''
    # go-debug path
    set target_file ./(fzf --no-mouse)
    set target_line (command cat -n "$target_file" | fzf --no-mouse | awk '{print $1}')
    dlv debug "$argv[1]" --init (echo "break $target_file:$target_line" | psub)
  '';

  # Database.
  mysql = ''
    if test (count $argv) -eq 0
        set conn_str (mycli --list-dsn | fzf)
        if not test -z "$conn_str"
            mycli "$conn_str"
        end
    else
        mycli $argv
    end
  '';
  postgresql = ''
    if test (count $argv) -eq 0
        set conn_str (pgcli --list-dsn | awk '{print $1}' | fzf)
        if not test -z "$conn_str"
            pgcli -D "$conn_str"
        end
    else
        pgcli $argv
    end
  '';

  # Text.
  o = ''
    if test "$argv[1]" = "g"
        set fpath `git status -s | fzf | awk '{ print $2 }'`
    else
        set fpath (fzf --no-mouse --preview 'bat {} --style=numbers --color=always')
    end
    if test -n "$fpath"
        $EDITOR "$fpath"
    end
  '';

  # Search.
  gf = ''
    gg "$argv[1]" -g "$argv[2]"
  '';
  gfa = ''
    gg "$argv[1]" -g "*.$argv[2]"
  '';
  z = ''
    if test -z "$argv[1]"
        cd (zoxide query -i)
    else
        cd (zoxide query $argv)
    end
  '';

  # Utility.
  touch = ''
    if test -e "$argv[1]"
        echo "path exists"
        return
    end
    set dir_path (command dirname "$argv[1]")
    mkdir -p "$dir_path"
    echo > "$argv[1]"
  '';
  mkcd = ''
    # http://www.bashoneliners.com/oneliners/235/
    mkdir -p "$argv[1]" && cd "$argv[1]"
  '';
  tar-tree = ''
    # https://superuser.com/a/1545418/298390
    tar -tf "$argv[1]" | tree --fromfile .
  '';
  extract = ''
    # https://gitlab.com/dwt1/dotfiles/-/blob/master/.bashrc
    # Converted it to the Fish version.
    if test -f "$argv[1]"
        switch $argv[1]
            case *.tar.bz2
                tar xjf $argv[1]
            case *.tar.gz
                tar xzf $argv[1]
            case *.bz2
                bunzip2 $argv[1]
            case *.rar
                unrar x $argv[1]
            case *.gz
                gunzip $argv[1]
            case *.tar
                tar xf $argv[1]
            case *.tbz2
                tar xjf $argv[1]
            case *.tgz
                tar xzf $argv[1]
            case *.zip
                unzip $argv[1]
            case *.Z
                uncompress $argv[1]
            case *.7z
                7z x $argv[1]
            case *.deb
                ar x $argv[1]
            case *.tar.xz
                tar xf $argv[1]
            case *.tar.zst
                unzstd $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via extract()"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
  '';
}
