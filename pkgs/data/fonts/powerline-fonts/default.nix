{ stdenv, fetchzip}:

fetchzip {
  name = "powerline-fonts-2018-11-11";

  url = https://github.com/powerline/fonts/archive/e80e3eba9091dac0655a0a77472e10f53e754bb0.zip;

  postFetch = ''
    mkdir -p $out/share/fonts/opentype
    unzip -j $downloadedFile '*.otf' -d $out/share/fonts/opentype

    mkdir -p $out/share/fonts/truetype
    unzip -j $downloadedFile '*.ttf' -d $out/share/fonts/truetype

    mkdir -p $out/share/fonts/bdf
    unzip -j $downloadedFile '*/BDF/*.bdf' -d $out/share/fonts/bdf

    mkdir -p $out/share/fonts/pcf
    unzip -j $downloadedFile '*/PCF/*.pcf.gz' -d $out/share/fonts/pcf

    mkdir -p $out/share/fonts/psf
    unzip -j $downloadedFile '*/PSF/*.psf.gz' -d $out/share/fonts/psf
  '';

  sha256 = "0irifak86gn7hawzgxcy53s22y215mxc2kjncv37h7q44jsqdqww";

  meta = with stdenv.lib; {
    homepage = https://github.com/powerline/fonts;
    description = "Patched fonts for Powerline users";
    longDescription = ''
      Pre-patched and adjusted fonts for usage with the Powerline plugin.
    '';
    license = with licenses; [ asl20 free ofl ];
    platforms = platforms.all;
    maintainers = with maintainers; [ malyn ];
  };
}
