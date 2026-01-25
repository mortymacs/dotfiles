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

    # Email/Office.
    tz
    numbat

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
    websocat

    # Cloud / virtualization / CICD.
    podman-compose
    kubectl
    kubecolor
    kubectx
    kind
    stern
    kubernetes-helm
    awscli2
    ctop
    unstable.wait4x

    # Development.
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
    (lib.hiPrio gcc)
    clang
    clang-tools
    gdb
    cmake
    neocmakelsp
    ## Go.
    go
    gopls
    delve
    pprof
    go-tools
    gotools
    revive
    gosec
    golangci-lint
    govulncheck
    goimports-reviser
    goconst
    gomodifytags
    gotags
    panicparse
    ## Zig.
    zig
    zls
    zig-zlint
    zigimports
    ## Rust.
    rustc
    cargo
    ## Python.
    (python313.withPackages (
      ps: with ps; [
        ipdb
        ipython
        isort
        black
      ]
    ))
    uv
    pyright
    ruff
    ## Lua.
    luajit
    lua-language-server
    stylua
    lua54Packages.luacheck
    ## Nix.
    nil
    nixfmt-rfc-style
    nurl
    ## TF.
    opentofu
    tofu-ls
    ## Shell.
    bash-language-server
    shfmt
    shellcheck
    unstable.gum
    ## Make.
    gnumake
    ## Dockerfile.
    dockerfile-language-server
    ## HTML & CSS & JS.
    vscode-langservers-extracted
    nodejs
    ## YAML.
    nodePackages.yaml-language-server
    yamllint
    yamlfmt
    ## XML.
    xmlformat
    ## Grammer.
    harper

    # Misc.
    gomi
    unzip
    ascii-image-converter
  ];
}
