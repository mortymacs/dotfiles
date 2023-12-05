{ pkgs, ... }: {
  list = with pkgs; [
    # Desktop
    bsp-layout
    xdotool
    xorg.xwininfo

    # Text.
    bat
    bat-extras.batgrep
    unstable.ast-grep
    ripgrep
    pwgen
    most
    fd
    jq
    yq
    htmlq
    jless
    fq
    glow
    hexyl

    # Security.
    xss-lock
    xsecurelock

    # Misc.
    xclip
    trash-cli
    gnome.zenity
    zathura
    libqalculate
    cava
    unzip
    ascii-image-converter

    # File and directory.
    broot
    eza
    zoxide
    feh
    file
    unstable.walk

    # Theme.
    yaru-theme

    # Process.
    procs
    kmon
    bmon

    # Network
    duf
    dog
    gping
    networkmanagerapplet

    # Cloud / virtualization / CICD.
    terraform
    kubectl
    kubecolor
    kubectx
    kind
    kubespy
    stern
    kubernetes-helm
    helm-docs
    chart-testing
    awscli2
    ctop
    act
    unstable.wait4x

    # Database.
    pgcli
    mycli

    # Development.
    zeal
    ghq
    hurl
    httpie
    zola
    tokei
    gnumake
    commitlint
    silicon
    ## Temporal.
    temporal-cli

    # Programming.
    ## C/C++.
    (hiPrio gcc)
    clang
    clang-tools
    gdb
    ccache
    cmake
    cmake-language-server
    valgrind-light
    complexity
    cflow
    bear
    doxygen
    ## Rust.
    rustc
    rustfmt
    rust-analyzer
    cargo
    bacon
    ## Go.
    go
    gopls
    delve
    pprof
    go-tools
    revive
    gosec
    golangci-lint
    govulncheck
    unstable.nilaway
    goconst
    gofumpt
    golines
    gomodifytags
    reftools
    mage
    air
    ## Python.
    python311
    poetry
    python311Packages.ipdb
    nodePackages.pyright
    ruff
    isort
    black
    python311Packages.ipython
    ## Lua.
    lua
    sumneko-lua-language-server
    stylua
    lua54Packages.luacheck
    ## Nix.
    nil
    nixfmt
    nurl
    ## Shell.
    nodePackages.bash-language-server
    shfmt
    shellcheck
    ## SQL.
    sqlfluff
    ## Terraform.
    terraform-ls
    terraform-docs
    ## Dockerfile.
    nodePackages.dockerfile-language-server-nodejs
    ## Latex.
    texlive.combined.scheme-small
    ## YAML.
    nodePackages.yaml-language-server
    yamllint
    yamlfmt
    ## JSON.
    nodePackages.jsonlint
    ## XML.
    xmlformat
  ];
}
