{ pkgs }:

(import ./3DPrinting { inherit pkgs; })
++ (import ./assembly { inherit pkgs; })
++ (import ./audio { inherit pkgs; })
++ (import ./browsers { inherit pkgs; })
++ (import ./comms { inherit pkgs; })
++ (import ./editing { inherit pkgs; })
++ (import ./kicad { inherit pkgs; })
++ (import ./media { inherit pkgs; })
++ (import ./officesuite { inherit pkgs; })
++ (import ./rice { inherit pkgs; })
++ (import ./terminal { inherit pkgs; })
++ (import ./utilities { inherit pkgs; })

