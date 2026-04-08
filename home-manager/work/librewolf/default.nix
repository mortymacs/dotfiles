{ pkgs, lib, ... }:
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
              icon = "https://nixos.wiki/favicon.png";
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
            "Oxford Dictionary" = {
              urls = [
                {
                  template = "https://www.oxfordlearnersdictionaries.com/search/english/direct/?q={searchTerms}";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@od" ];
              icon = "https://www.oxfordlearnersdictionaries.com/favicon.ico";
            };

            # Disable the rest.
            "bing".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "google".metaData.hidden = true;
            "Amazon.nl".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
            "perplexity".metaData.hidden = true;
            "metager".metaData.hidden = true;
          };
          order = [ "ddg" ];
        };
        containers = {
          A = {
            name = "Personal";
            color = "turquoise";
            icon = "fingerprint";
            id = 1;
          };
          B = {
            name = "Work";
            color = "orange";
            icon = "briefcase";
            id = 2;
          };
          C = {
            name = "Messenger";
            color = "green";
            icon = "circle";
            id = 3;
          };
        };
        containersForce = true;
      };
    };
  };

  programs.librewolf = {
    enable = true;
    policies = {
      ExtensionSettings = {
        # https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/
        "CanvasBlocker@kkapsner.de" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/popup-blocker/
        "{de22fd49-c9ab-4359-b722-b3febdc3a0b0}" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/popup-blocker/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/consent-o-matic/
        "gdpr@cavi.au.dk" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = false;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/dont-track-me-google1/
        "dont-track-me-google@robwu.nl" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/dont-track-me-google1/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = false;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/duckduckgo-for-firefox/
        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/history-cleaner/
        "{a138007c-5ff6-4d10-83d9-0afaf0efbe5e}" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/history-cleaner/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = false;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/photoshow/
        "{c23d8eea-4e71-4573-a245-4c97f8e1a1e0}" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/photoshow/latest.xpi";
          installation_mode = "blocked";
          private_browsing = false;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = false;
        };
        # https://addons.mozilla.org/en-US/firefox/addon/keeper-password-manager/
        "KeeperFFStoreExtension@KeeperSecurityInc" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keeper-password-manager/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = false;
        };
      };
    };
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
              icon = "https://nixos.wiki/favicon.png";
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
            "Oxford Dictionary" = {
              urls = [
                {
                  template = "https://www.oxfordlearnersdictionaries.com/search/english/direct/?q={searchTerms}";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@od" ];
              icon = "https://www.oxfordlearnersdictionaries.com/favicon.ico";
            };

            # Disable the rest.
            "bing".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "google".metaData.hidden = true;
            "Amazon.nl".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
            "perplexity".metaData.hidden = true;
            "metager".metaData.hidden = true;
          };
          order = [ "ddg" ];
        };
        containers = {
          A = {
            name = "Work";
            color = "orange";
            icon = "briefcase";
            id = 1;
          };
          B = {
            name = "Personal";
            color = "turquoise";
            icon = "fingerprint";
            id = 2;
          };
          C = {
            name = "Messenger";
            color = "green";
            icon = "circle";
            id = 3;
          };
        };
        containersForce = true;
        settings = {
          # Startup.
          "browser.startup.page" = 3;
          "browser.startup.couldRestoreSession.count" = 1;
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
          "browser.newtabpage.activity-stream.showSearch" = false;
          "browser.aboutwelcome.enabled" = false;
          "browser.newtabpage.enabled" = false;

          # Tabbar, sidebar, toolbar.
          "reader.toolbar.vertical" = true;
          "sidebar.verticalTabs" = true;
          "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
          "sidebar.revamp" = true;
          "browser.engagement.sidebar-button.has-used" = true;
          "browser.toolbarbuttons.introduced.sidebar-button" = true;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.tabs.inTitlebar" = 1;
          "browser.download.autohideButton" = true;

          # Privacy.
          # Keep track of the only exception websites, and flush the rest.
          "privacy.clearOnShutdown.cookies" = true;
          "privacy.clearOnShutdown.offlineApps" = true;
          "privacy.clearOnShutdown.cache" = true;
          "privacy.clearOnShutdown.sessions" = true;
          "network.cookie.lifetimePolicy" = 2;
          "privacy.userContext.newTabContainerOnLeftClick.enabled" = true;
          "privacy.resistFingerprinting.exemptedDomains" = "outlook.office.com";

          # UI.
          "browser.uiCustomization.horizontalTabstrip" = ''["tabbrowser-tabs"]'';
          "browser.uiCustomization.navBarWhenVerticalTabs" = ''
            ["back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","downloads-button","unified-extensions-button","fxa-toolbar-menu-button","reset-pbm-toolbar-button"]
          '';
          "browser.uiCustomization.state" = builtins.readFile ./ui.json;
          "font.name.monospace.x-western" = "monospace";
          "font.name.sans-serif.x-western" = "sans-serif";
          "font.name.serif.x-western" = "sans-serif";
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

          # Misc.
          "datareporting.policy.firstRunURL" = "";
          "network.protocol-handler.external.mailto" = false;
          "accessibility.typeaheadfind.enablesound" = false;
          "browser.bookmarks.restore_default_bookmarks" = false;
        };
      };
    };
  };

  # Remove '.mozilla' directory from home.
  home.activation.removeKeepFile = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf ~/.mozilla/
  '';
}
