{
  fetchFromGitHub,
  pkgs,
  background_color ? "#000000",
  outline_color ? "#FFFFFF",
  accent_color ? "#999999",
  replace_crosshair ? false,
  ...
}:
pkgs.callPackage ./cursors.nix {
  inherit background_color outline_color accent_color;
  name = "Bibata-Modern-Custom";
  svg_dir = "svg/modern";
  source = fetchFromGitHub {
    owner = "ful1e5";
    repo = "Bibata_Cursor";
    rev = "afb25d6e9ec30acc51e43e62e89792879e7be862";
    hash = "sha256-3S2eIJ6tEkMKWQqV3Az9R2wz48z9MljTx0Xi0jQ2AUA=";
  };
  extra_commands = ''
    cp svg/modern/left_ptr_watch/left_ptr_watch-54.svg svg/modern/left_ptr_watch.svg
    cp svg/modern/wait/wait-54.svg svg/modern/wait.svg
    # cp svg/modern/left_ptr_watch/left_ptr_watch-27.svg svg/modern/left_ptr_watch.svg
    # cp svg/modern/wait/wait-27.svg svg/modern/wait.svg

    sed -i "s/#96C865/${background_color}/g" svg/modern/bottom_left_corner.svg
    sed -i "s/#FDBE2A/${background_color}/g" svg/modern/bottom_right_corner.svg
    sed -i "s/#FE0000/${accent_color}/g" svg/modern/circle.svg
    sed -i "s/#5F3BE4/${accent_color}/g" svg/modern/context-menu.svg
    sed -i "s/#06B231/${accent_color}/g" svg/modern/copy.svg
    sed -i "s/#FE0000/${background_color}/g" svg/modern/crossed_circle.svg
    sed -i "s/#FE0000/${outline_color}/g" svg/modern/crosshair.svg
    sed -i "s/#F27400/${accent_color}/g" svg/modern/dnd-ask.svg
    sed -i "s/#06B231/${accent_color}/g" svg/modern/dnd-copy.svg
    sed -i "s/#606060/${accent_color}/g" svg/modern/dnd-link.svg
    sed -i "s/#FE0000/${accent_color}/g" svg/modern/dnd_no_drop.svg
    sed -i "s/#606060/${accent_color}/g" svg/modern/link.svg
    sed -i "s/#2C2C2C/${accent_color}/g" svg/modern/person.svg
    sed -i "s/#0A6857/${accent_color}/g" svg/modern/pin.svg
    sed -i "s/#179DD8/${accent_color}/g" svg/modern/pointer-move.svg
    sed -i "s/#4FADDF/${background_color}/g" svg/modern/top_left_corner.svg
    sed -i "s/#F1613A/${background_color}/g" svg/modern/top_right_corner.svg
    ${
      if replace_crosshair
      /*
        then ''
        rm svg/modern/crosshair.svg
        # cp svg/modern/left_ptr.svg svg/modern/crosshair.svg
        # cp svg/modern/lr_angle.svg svg/modern/crosshair.svg
        cp ${./cross-dot.svg} svg/modern/crosshair.svg
        # cp ${./cross-thin.svg} svg/modern/crosshair.svg
      ''
      */
      then ''
        sed -i '/^\[cursors\.crosshair\]/,/^$/d' build.toml
        cat >> build.toml << EOF
        [cursors.crosshair]
        png = 'left_ptr.png'
        x_hotspot = 55
        y_hotspot = 17
        win_name = 'Cross'
        x11_name = 'crosshair'
        EOF
      ''
      else ""
    }
  '';
}
