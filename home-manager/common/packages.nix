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
    hexyl

    ## Presentation / reading.
    glow
    slides

    # Security.
    xss-lock
    xsecurelock

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
    wait4x

    # Database.
    pgcli
    mycli

    # Development.
    pkg-config
    ghq
    httpie
    zola
    tokei
    gnumake
    commitlint
    silicon
    ## Test.
    hurl
    k6

    # Security.
    radare2

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
    goimports-reviser
    goconst
    gofumpt
    golines
    gomodifytags
    gotags
    reftools
    mage
    air
    ## Python.
    (python311.withPackages
      (ps: with ps; [ ipdb ipython isort black ]))
    rye
    nodePackages.pyright
    ruff
    ## Lua.
    luajit
    sumneko-lua-language-server
    stylua
    lua54Packages.luacheck
    ## Javascript/Typescript.
    deno
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
    tfsec
    terraform-docs
    ## Dockerfile.
    nodePackages.dockerfile-language-server-nodejs
    ## Typst.
    typst
    typstfmt
    typst-lsp
    ## Dot.
    graphviz-nox
    dot-language-server
    graph-easy
    ## HTML & CSS.
    vscode-langservers-extracted
    ## YAML.
    nodePackages.yaml-language-server
    yamllint
    yamlfmt
    ## JSON.
    nodePackages.jsonlint
    ## XML.
    xmlformat

    # Misc.
    xclip
    trash-cli
    gnome.zenity
    zathura
    libqalculate
    unzip
    ascii-image-converter
  ];
}
