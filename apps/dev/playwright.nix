{ ... }:
{
  # The browsers are downloaded by npm (npx playwright install) and run with nix-ld: see electron-libs.nix
  home.sessionVariables = {
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  };
}
