{ pkgs, ... }:
{
  list = with pkgs; [
    # Text.
    bat
    most
    fd
    jq
    yq
    htmlq
    jless

    # Find.
    tree
    ast-grep
    ripgrep
    igrep

    # Binary.
    hexyl
    hevi

    # Office.
    unstable.zoom-us
    unstable.slack
    tz
    eva
    zathura

    ## Presentation / reading.
    glow

    # File and directory.
    eza
    zoxide
    file

    # Process.
    procs
    kmon
    bmon
    zps

    # System / network.
    duf
    networkmanagerapplet
    websocat

    # Cloud / virtualization / CICD.
    kubectl
    kubecolor
    kubectx
    kind
    stern
    kubernetes-helm
    awscli2
    ctop
    unstable.wait4x

    # Database.
    pgcli
    mycli

    # Development.
    pkg-config
    lsof
    ghq
    tokei
    commitlint
    silicon
    ## Diagram.
    unstable.d2
    ## Snipped.
    nap

    # Programming.
    ## C/C++.
    (hiPrio gcc)
    clang
    clang-tools
    gdb
    cgdb
    lldb
    cppcheck
    cpplint
    rr
    unstable.include-what-you-use
    ccache
    valgrind-light
    aflplusplus
    complexity
    cflow
    hotspot
    flamelens
    massif-visualizer
    heaptrack
    bear
    doxygen
    cmake
    cmake-lint
    neocmakelsp
    cpm-cmake
    gnumake
    emscripten
    ## Go.
    unstable.go
    unstable.gopls
    unstable.delve
    unstable.pprof
    unstable.go-tools
    unstable.gotools
    unstable.revive
    unstable.gosec
    unstable.golangci-lint
    unstable.govulncheck
    unstable.nilaway
    unstable.gocovsh
    unstable.go-cover-treemap
    goimports-reviser
    goconst
    gomodifytags
    gotags
    reftools
    unstable.go-motion
    mage
    air
    unstable.panicparse
    ## Rust.
    rustc
    cargo
    ## Python.
    (python313.withPackages (
      ps: with ps; [
        cython
        ipdb
        ipython
        isort
        black
      ]
    ))
    unstable.uv
    unstable.pyright
    unstable.ruff
    ## Lua.
    luajit
    sumneko-lua-language-server
    stylua
    lua54Packages.luacheck
    # Guile.
    unstable.guile
    unstable.guile-lsp-server
    ## Javascript/Typescript.
    deno
    nodejs
    nodePackages.prettier
    ## Nix.
    nil
    nixfmt-rfc-style
    nurl
    ## Shell.
    bash-language-server
    shfmt
    shellcheck
    unstable.gum
    ## Terraform.
    terraform-ls
    tfsec
    terraform-docs
    ## Dockerfile.
    dockerfile-language-server-nodejs
    ## Typst.
    unstable.typst
    unstable.typstfmt
    unstable.tinymist
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
    gomi
    unzip
    ascii-image-converter
    hyprpicker
  ];
}
