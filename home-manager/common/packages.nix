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
    graphviz-nox
    graph-easy
    viu

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
    wait4x

    # Database.
    pgcli
    mycli

    # Development.
    zeal
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
    (hiPrio python312)
    (python311.withPackages
      (ps: with ps; [ ipdb ipython isort black pylint pytest requests ]))
    poetry
    nodePackages.pyright
    ruff
    ## Lua.
    lua
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
    terraform-docs
    ## Dockerfile.
    nodePackages.dockerfile-language-server-nodejs
    ## Typst.
    typst
    typstfmt
    typst-lsp
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
