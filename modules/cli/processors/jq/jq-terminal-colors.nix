let

  paint =
    {
      color ? "white",
      effect ? "normal",
      ...
    }:
    let

      effect-escape-code =
        if effect == "normal" then
          "0"
        else if effect == "bright" then
          "1"
        else if effect == "dim" then
          "2"
        else if effect == "underscore" then
          "4"
        else if effect == "blink" then
          "5"
        else if effect == "reverse" then
          "7"
        else if effect == "hidden" then
          "8"
        else
          abort "${toString effect} is not a valid effect to pick from.";

      color-escape-code =
        if color == "black" then
          "30"
        else if color == "red" then
          "31"
        else if color == "green" then
          "32"
        else if color == "yellow" then
          "33"
        else if color == "blue" then
          "34"
        else if color == "magenta" then
          "35"
        else if color == "cyan" then
          "36"
        else if color == "white" then
          "37"
        else
          abort "${toString color} is not a valid color to pick from.";
    in
    "${effect-escape-code};${color-escape-code}";

in
{
  red = {
    normal = paint { color = "red"; };
    bright = paint {
      color = "red";
      effect = "bright";
    };
    dim = paint {
      color = "red";
      effect = "dim";
    };
    underlined = paint {
      color = "red";
      effect = "underscore";
    };
    blink = paint {
      color = "red";
      effect = "blink";
    };
    reverse = paint {
      color = "red";
      effect = "reverse";
    };
    hidden = paint {
      color = "red";
      effect = "hidden";
    };
  };

  blue = {
    normal = paint { color = "blue"; };
    bright = paint {
      color = "blue";
      effect = "bright";
    };
    dim = paint {
      color = "blue";
      effect = "dim";
    };
    underlined = paint {
      color = "blue";
      effect = "underscore";
    };
    blink = paint {
      color = "blue";
      effect = "blink";
    };
    reverse = paint {
      color = "blue";
      effect = "reverse";
    };
    hidden = paint {
      color = "blue";
      effect = "hidden";
    };
  };

  green = {
    normal = paint { color = "green"; };
    bright = paint {
      color = "green";
      effect = "bright";
    };
    dim = paint {
      color = "green";
      effect = "dim";
    };
    underlined = paint {
      color = "green";
      effect = "underscore";
    };
    blink = paint {
      color = "green";
      effect = "blink";
    };
    reverse = paint {
      color = "green";
      effect = "reverse";
    };
    hidden = paint {
      color = "green";
      effect = "hidden";
    };
  };

  yellow = {
    normal = paint { color = "yellow"; };
    bright = paint {
      color = "yellow";
      effect = "bright";
    };
    dim = paint {
      color = "yellow";
      effect = "dim";
    };
    underlined = paint {
      color = "yellow";
      effect = "underscore";
    };
    blink = paint {
      color = "yellow";
      effect = "blink";
    };
    reverse = paint {
      color = "yellow";
      effect = "reverse";
    };
    hidden = paint {
      color = "yellow";
      effect = "hidden";
    };
  };

  magenta = {
    normal = paint { color = "magenta"; };
    bright = paint {
      color = "magenta";
      effect = "bright";
    };
    dim = paint {
      color = "magenta";
      effect = "dim";
    };
    underlined = paint {
      color = "magenta";
      effect = "underscore";
    };
    blink = paint {
      color = "magenta";
      effect = "blink";
    };
    reverse = paint {
      color = "magenta";
      effect = "reverse";
    };
    hidden = paint {
      color = "magenta";
      effect = "hidden";
    };
  };

  cyan = {
    normal = paint { color = "cyan"; };
    bright = paint {
      color = "cyan";
      effect = "bright";
    };
    dim = paint {
      color = "cyan";
      effect = "dim";
    };
    underlined = paint {
      color = "cyan";
      effect = "underscore";
    };
    blink = paint {
      color = "cyan";
      effect = "blink";
    };
    reverse = paint {
      color = "cyan";
      effect = "reverse";
    };
    hidden = paint {
      color = "cyan";
      effect = "hidden";
    };
  };

  white = {
    normal = paint { color = "white"; };
    bright = paint {
      color = "white";
      effect = "bright";
    };
    dim = paint {
      color = "white";
      effect = "dim";
    };
    underlined = paint {
      color = "white";
      effect = "underscore";
    };
    blink = paint {
      color = "white";
      effect = "blink";
    };
    reverse = paint {
      color = "white";
      effect = "reverse";
    };
    hidden = paint {
      color = "white";
      effect = "hidden";
    };
  };

  black = {
    normal = paint { color = "black"; };
    bright = paint {
      color = "black";
      effect = "bright";
    };
    dim = paint {
      color = "black";
      effect = "dim";
    };
    underlined = paint {
      color = "black";
      effect = "underscore";
    };
    blink = paint {
      color = "black";
      effect = "blink";
    };
    reverse = paint {
      color = "black";
      effect = "reverse";
    };
    hidden = paint {
      color = "black";
      effect = "hidden";
    };
  };

}
