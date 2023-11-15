{ asciidoc
, dbus
, docbook_xml_dtd_45
, docbook_xsl
, fetchFromGitHub
, lib
, libconfig
, libdrm
, libev
, libGL
, xorg
, libxml2
, libxslt
, libxdg_basedir
, makeWrapper
, meson
, ninja
, pcre2
, pixman
, pkg-config
, stdenv
, uthash
, withDebug ? false
}:
stdenv.mkDerivation (finalAttrs: {
  name = "compfy";

  src = ../../../.; # Path to project root

  nativeBuildInputs = [
    asciidoc
    docbook_xml_dtd_45
    docbook_xsl
    makeWrapper
    meson
    ninja
    pkg-config
    uthash
  ];

  buildInputs = [
    dbus
    libconfig
    libdrm
    libev
    libGL
    xorg.libX11
    xorg.libxcb
    libxdg_basedir
    xorg.libXext
    xorg.libXinerama
    libxml2
    libxslt
    pcre2
    pixman
    xorg.xcbutilimage
    xorg.xcbutilrenderutil
    xorg.xorgproto
  ];

  # Use "debugoptimized" instead of "debug" so perhaps picom works better in
  # normal usage too, not just temporary debugging.
  mesonBuildType = if withDebug then "debugoptimized" else "release";
  dontStrip = withDebug;

  mesonFlags = [
    "-Dwith_docs=true"
  ];

  installFlags = [ "PREFIX=$(out)" ];

  # In debug mode, also copy src directory to store. If you then run `gdb picom`
  # in the bin directory of picom store path, gdb finds the source files.
  postInstall = ''
    wrapProgram $out/bin/compfy-trans \
      --prefix PATH : ${lib.makeBinPath [ xorg.xwininfo ]}
  '' + lib.optionalString withDebug ''
    cp -r ../src $out/
  '';

  meta = with lib; {
    description = "A fork of picom featuring improved animations and other features";
    license = with licenses; [ mit mpl20 ];
    homepage = "https://github.com/allusive-dev/compfy";
    maintainers = with maintainers; [ allusive iogamaster ];
    platforms = platforms.linux;
    mainProgram = "compfy";
  };
})
