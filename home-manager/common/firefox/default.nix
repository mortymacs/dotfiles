{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      main = {
        name = "main";
        isDefault = true;
        containers = {
          Personal = {
            id = 1;
            color = "purple";
            icon = "fingerprint";
          };
          Work = {
            id = 2;
            color = "blue";
            icon = "briefcase";
          };
          Quick = {
            id = 3;
            color = "yellow";
            icon = "chill";
          };
        };
        search = {
          default = "Google";
          engines = {
            "Bookmarks".metaData.alias = "*";
            "Google".metaData.alias = "@g";
            "Nix Packages" = {
              urls = [{
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
              }];
              definedAliases = [ "@np" ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };
            "NixOS Wiki" = {
              urls = [{
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            "Nix Hub" = {
              urls = [{
                template = "https://www.nixhub.io/search?q={searchTerms}";
                params = [{
                  name = "query";
                  value = "{searchTerms}";
                }];
              }];
              definedAliases = [ "@nh" ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };

            # Disable the rest.
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "DuckDuckGo".metaData.hidden = true;
            "Amazon.nl".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
          };
          order = [ "Google" ];
        };
        settings = {
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.tabs.inTitlebar" = 0;
          "browser.tabs.firefox-view" = false;
          "browser.tabs.firefox-view-newIcon" = false;
          "browser.tabs.firefox-view-next" = false;
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "datareporting.policy.firstRunURL" = "";
          "browser.aboutwelcome.enabled" = false;
          "browser.uiCustomization.state" = builtins.readFile ./ui.json;
          "browser.newtabpage.pinned" = [{
            title = "Mort";
            url = "https://0t1.me";
            icon = "https://0t1.me/img/favicon.png";
          }];
        };
      };
    };
  };
}
