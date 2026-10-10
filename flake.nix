{
    description = "latex develop environment";

    inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };

        tex = pkgs.texliveSmall.withPackages (ps: with ps; [ 
            collection-langczechslovak
            biblatex
            biblatex-iso690
            latexmk 
        ]);
    in
    {
        devShells.${system}.default = pkgs.mkShell {
            packages = [
                tex
                pkgs.texlab
                pkgs.biber
            ];
            shellHook = ''
                echo "Welcome to Latex develop environment."
            '';
        };
    };
}
