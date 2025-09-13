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
    fx
    fq
    jless

    # Find.
    unstable.ast-grep
    unstable.ripgrep
    unstable.igrep

    # Binary.
    hexyl
    hevi

    # Office.
    unstable.zoom-us
    unstable.slack
    unstable.tz
    eva

    ## Presentation / reading.
    glow

    # File and directory.
    eza
    zoxide
    file
    tree

    # Process.
    procs
    kmon
    bmon
    zps

    # System / network.
    duf
    gping
    networkmanagerapplet
    unstable.websocat

    # Cloud / virtualization / CICD.
    kubectl
    kubecolor
    kubectx
    kind
    k9s
    kubespy
    stern
    kubernetes-helm
    helm-docs
    chart-testing
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
    httpie
    tokei
    gnumake
    commitlint
    silicon
    ## Diagram.
    unstable.d2
    ## Test.
    hurl
    ## Snipped.
    nap

    # Programming.
    ## C/C++.
    (hiPrio unstable.gcc)
    clang
    clang-tools
    unstable.gdb
    unstable.cgdb
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
    unstable.rustc
    unstable.cargo
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
    ## Javascript/Typescript.
    deno
    nodejs
    nodePackages.prettier
    ## Nix.
    nil
    nixfmt-rfc-style
    nurl
    ## Shell.
    nodePackages.bash-language-server
    shfmt
    shellcheck
    unstable.gum
    ## Terraform.
    terraform-ls
    tfsec
    terraform-docs
    ## Dockerfile.
    nodePackages.dockerfile-language-server-nodejs
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
  ];
}
