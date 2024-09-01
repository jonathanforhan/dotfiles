{ ... }:

{
  programs.pylint = {
    enable = true;
    settings = {
      pycodestle.max-line-length = 120;
    };
  };
}
