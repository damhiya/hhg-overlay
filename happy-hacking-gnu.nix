{ lib, stdenv, happy-hacking-gnu-src, version, cmake, systemd }:
stdenv.mkDerivation {
  pname = "happy-hacking-gnu";
  inherit version;
  src = happy-hacking-gnu-src;
  nativeBuildInputs = [ cmake ];
  buildInputs = [ systemd ];
  installPhase = ''
    mkdir -p $out/bin
    cp hhg $out/bin
  '';
  meta = with lib; {
    description =
      "A free, open-source alternative to the HHKB Keymap Tool provided by PFU";
    homepage = "https://gitlab.com/dom/happy-hacking-gnu/";
    license = licenses.unlicense;
    platforms = platforms.linux;
  };
}
