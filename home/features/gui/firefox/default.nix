{ config, lib, ... }:

{ 
    programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

    settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.search.defaultenginename" = "DuckDuckGo";
        "privacy.resistFingerprinting" = true;
        "privacy.firstparty.isolate" = true;
        "privacy.trackingprotection.enabled" = true;
        "network.cookie.cookieBehavior" = 1; # Block third-party cookies
        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;
        "dom.security.https_only_mode" = true;
        "browser.tabs.warnOnClose" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.bookmark" = true;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.trimURLs" = true;
      };

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        https-everywhere
        privacy-badger
        clearurls
        decentraleyes
      ];
    };
  };
}
