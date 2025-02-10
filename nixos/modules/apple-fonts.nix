{ pkgs, ... }:

let
  # Define Apple font sources
  fontSources = {
    sf-pro = {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
      hash = "sha256-IccB0uWWfPCidHYX6sAusuEZX906dVYo8IaqeX7/O88=";
    };
    sf-compact = {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
      hash = "sha256-PlraM6SwH8sTxnVBo6Lqt9B6tAZDC//VCPwr/PNcnlk=";
    };
    sf-mono = {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
      hash = "sha256-bUoLeOOqzQb5E/ZCzq0cfbSvNO1IhW1xcaLgtV2aeUU=";
    };
    sf-arabic = {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg";
      hash = "sha256-J2DGLVArdwEsSVF8LqOS7C1MZH/gYJhckn30jRBRl7k=";
    };
    ny = {
      url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
      hash = "sha256-HC7ttFJswPMm+Lfql49aQzdWR2osjFYHJTdgjtuI+PQ=";
    };
  };

  # Function to create Apple font packages
  makeAppleFont = name: pkgName: source:
    pkgs.stdenv.mkDerivation {
      inherit name;

      src = pkgs.fetchurl {
        inherit (source) url hash;
      };

      version = "0.3.0";

      unpackPhase = ''
        undmg $src
        7z x '${pkgName}'
        7z x 'Payload~'
      '';

      buildInputs = [
        pkgs.undmg
        pkgs.p7zip
      ];
      setSourceRoot = "sourceRoot=`pwd`";

      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        mkdir -p $out/share/fonts/truetype
        find -name \*.otf -exec mv {} $out/share/fonts/opentype/ \;
        find -name \*.ttf -exec mv {} $out/share/fonts/truetype/ \;
      '';
    };

in {
  environment.systemPackages = [
    (makeAppleFont "sf-pro" "SF Pro Fonts.pkg" fontSources.sf-pro)
    (makeAppleFont "sf-compact" "SF Compact Fonts.pkg" fontSources.sf-compact)
    (makeAppleFont "sf-mono" "SF Mono Fonts.pkg" fontSources.sf-mono)
    (makeAppleFont "sf-arabic" "SF Arabic Fonts.pkg" fontSources.sf-arabic)
    (makeAppleFont "ny" "NY Fonts.pkg" fontSources.ny)
  ];
}
