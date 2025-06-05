{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkDefault mkIf;

  profile = "main";
  program = "firefox";
  category = "browsers";
  type = "gui";
in
{
  config.programs.${program}.profiles.${profile}.containers =
    mkIf config.${type}.${category}.${program}.enable
      {

        containersForce = mkDefault true;

        personal = {
          name = "Personal";
          color = "purple";
          icon = "circle";
          id = 0;
        };

        school = {
          name = "School";
          color = "purple";
          icon = "circle";
          id = personal.id + 1;
        };

        work = {
          name = "Work";
          color = "green";
          icon = "circle";
          id = school.id + 1;
        };

        sketchy = {
          name = "Sketchy";
          color = "green";
          icon = "circle";
          id = work.id + 1;
        };

        traceable = {
          name = "Traceable";
          color = "green";
          icon = "circle";
          id = sketchy.id + 1;
        };
      };
}
