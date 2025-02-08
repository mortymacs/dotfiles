{ pkgs, ... }:
{
  list = with pkgs; [
    # Text.
    bat
    unstable.ast-grep
    ripgrep
    pwgen
    most
    fd
    jq
    yq
    htmlq
    fx
    fq
    jless
    hexyl

    # Image.
    gimp

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

    # Cloud / virtualization / CICD.
    terraform
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
    wait4x

    # Database.
    pgcli
    mycli

    # Development.
    pkg-config
    lsof
    ghq
    nap
    httpie
    tokei
    gnumake
    commitlint
    silicon
    ## Test.
    hurl
    ## IDE.
    unstable.jetbrains-toolbox
    unstable.vscode
    unstable.zed-editor

    # Programming.
    ## C/C++.
    (hiPrio unstable.gcc)
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
    massif-visualizer
    heaptrack
    bear
    doxygen
    cmake
    cmake-lint
    neocmakelsp
    cpm-cmake
    emscripten
    ## Rust.
    unstable.rustc
    unstable.cargo
    unstable.rust-analyzer
    unstable.rustfmt
    unstable.rust-bindgen
    ## Go.
    unstable.go
    unstable.gopls
    unstable.delve
    unstable.pprof
    unstable.go-tools
    unstable.revive
    unstable.gosec
    unstable.golangci-lint
    unstable.govulncheck
    # unstable.nilaway
    goimports-reviser
    goconst
    golines
    gomodifytags
    gotags
    reftools
    unstable.go-motion
    mage
    air
    ## Python.
    (python312.withPackages (
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
    ## Nix.
    nil
    nixfmt-rfc-style
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
    tinymist
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
    ## Protobuf
    protobuf

    # Misc.
    trash-cli
    unzip
    ascii-image-converter
  ];
}
