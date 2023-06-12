{ pkgs, ... }:
{
  list = with pkgs; [
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

    # Cloud / virtualization.
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
    gcc
    ## Rust.
    rustc
    rustfmt
    rust-analyzer
    cargo
    ## Go.
    go
    gopls
    delve
    pprof
    go-tools
    revive
    gosec
    golangci-lint
    gofumpt
    gomodifytags
    mage
    air
    ## Python.
    python311
    nodePackages.pyright
    ## Lua.
    lua
    sumneko-lua-language-server
    stylua
    ## Terraform.
    terraform-ls
    terraform-docs
    ## Nix.
    rnix-lsp
    ## Shell.
    shellcheck
    ## YAML.
    nodePackages.yaml-language-server
    ## Dockerfile.
    nodePackages.dockerfile-language-server-nodejs
    ## Latex.
    texlive.combined.scheme-small
  ];
}
