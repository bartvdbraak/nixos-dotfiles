{ ... }:

{
  # Add Ollama and OpenWebUI
  services.ollama = {
    enable = true;
    loadModels = [ deepseek-r1:32b ];
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.0";
    environmentVariables = {
      HSA_OVERRIDE_GFX_VERSION = "11.0.0";
    };
  };
  
  services.open-webui.enable = true;
}
