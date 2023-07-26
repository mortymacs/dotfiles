{ pkgs, ... }: {
  list = with pkgs; [
    # Desktop
    bsp-layout
    xdotool
    xorg.xwininfo

    # Application.
    firefox

    # Text.
    bat
    bat-extras.batgrep
    ripgrep
    pwgen
    peco
    most
    fd
    jq
    yq
    jless
    fq
    glow

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

    # File and directory.
    broot
    exa
    zoxide
    feh
    file

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
    awscli2
    ctop
    act

    # Database.
    pgcli
    mycli

    # Development.
    zeal
    ghq
    hurl
    httpie
    hugo
    tokei
    gnumake

    # Programming.
    ## C/C++.
    gcc
    ccls
    gdb
    cmake
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
    gofumpt
    golines
    gomodifytags
    mage
    air
    ## Python.
    python311
    nodePackages.pyright
    ruff
    python311Packages.ipython
    ## Lua.
    lua
    sumneko-lua-language-server
    stylua
    lua52Packages.luacheck
    ## Terraform.
    terraform-ls
    terraform-docs
    ## Nix.
    rnix-lsp
    nixfmt
    ## Shell.
    nodePackages.bash-language-server
    shellcheck
    ## SQL.
    sqlfluff
    ## YAML.
    nodePackages.yaml-language-server
    yamllint
    yamlfmt
    ## JSON.
    nodePackages.jsonlint
    ## Dockerfile.
    nodePackages.dockerfile-language-server-nodejs
    ## Latex.
    texlive.combined.scheme-small
  ];
}
