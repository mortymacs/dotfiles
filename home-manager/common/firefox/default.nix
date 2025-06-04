{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      main = {
        name = "main";
        isDefault = true;
        search = {
          default = "ddg";
          force = true;
          engines = {
            "Bookmarks".metaData.alias = "*";
            "ddg".metaData.alias = "@s";
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@np" ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };
            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://nixos.wiki/index.php?search={searchTerms}";
                }
              ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            "Nix Hub" = {
              urls = [
                {
                  template = "https://www.nixhub.io/search?q={searchTerms}";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@nh" ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };

            # Disable the rest.
            "bing".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "google".metaData.hidden = true;
            "Amazon.nl".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
          };
          order = [ "ddg" ];
        };
        settings = {
          "reader.toolbar.vertical" = true;
          "sidebar.verticalTabs" = true;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.tabs.inTitlebar" = 1;
          "browser.tabs.firefox-view" = false;
          "browser.tabs.firefox-view-newIcon" = false;
          "browser.tabs.firefox-view-next" = false;
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "datareporting.policy.firstRunURL" = "";
          "browser.aboutwelcome.enabled" = false;
          "accessibility.typeaheadfind.enablesound" = false;
          "network.protocol-handler.external.mailto" = false;
          "browser.uiCustomization.navBarWhenVerticalTabs" = ''
            ["sidebar-button","back-button","forward-button","vertical-spacer","stop-reload-button","urlbar-container","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","unified-extensions-button","alltabs-button"]
          '';
          "browser.uiCustomization.state" = builtins.readFile ./ui.json;
          "browser.newtabpage.pinned" = [
            {
              title = "Mort";
              url = "https://0t1.me";
              icon = "https://0t1.me/img/favicon.png";
            }
            {
              title = "Gmail";
              url = "https://mail.google.com";
              icon = "https://www.google.com/a/cpanel/0t1.me/images/favicon.ico";
            }
            {
              title = "ChatGPT";
              url = "https://chatgpt.com";
              icon = "https://cdn.oaistatic.com/assets/favicon-miwirzcw.ico";
            }
            {
              title = "Orielly";
              url = "https://learning.oreilly.com/home/";
              icon = "www.oreilly.com/favicon.ico";
            }
          ];
        };
      };
    };
  };
}
