{ config, lib, ... };

{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;

    profiles.default = {
      isDefault = true;

      settings = {
        # Homepage & Search
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.search.defaultenginename" = "DuckDuckGo";

        # Privacy & Security
        "privacy.resistFingerprinting" = true;
        "privacy.firstparty.isolate" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "network.cookie.cookieBehavior" = 1; # Block third-party cookies
        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;
        "dom.security.https_only_mode" = true;
        "browser.safebrowsing.malware.enabled" = true;
        "browser.safebrowsing.phishing.enabled" = true;

        # Disable telemetry
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;

        # UI Tweaks
        "browser.tabs.warnOnClose" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.bookmark" = true;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.trimURLs" = true;
      };

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        clearurls
        decentraleyes
        privacy-badger
        cookie-autodelete
        user-agent-switcher
      ];
    };
  };
}
