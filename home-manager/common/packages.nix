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

    # Music.
    spotify

    # Security.
    xss-lock
    xsecurelock

    # Misc.
    xclip
    trash-cli
    gnome.zenity
    networkmanagerapplet
    duf
    dog
    gping
    zathura

    # File and directory.
    fzf
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

    # Cloud / virtualization.
    terraform
    kubecolor
    kubectx
    kind
    stern
    helm
    awscli2
    ctop

    # Database.
    pgcli
    mycli

    # Development.
    delve
    go-tools
    revive
    gosec
    gomodifytags
    golangci-lint
    gofumpt
    terraform-docs
    shellcheck
    zeal
    ghq
    insomnia
    httpie
    hugo
    tokei
    mage
    air

    # Programming.
    gcc
    go
    gopls
    sumneko-lua-language-server
    terraform-ls
    rnix-lsp
    nodePackages.yaml-language-server
    nodePackages.dockerfile-language-server-nodejs
    texlive.combined.scheme-small
  ];
}
