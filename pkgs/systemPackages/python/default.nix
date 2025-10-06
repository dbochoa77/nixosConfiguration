{ pkgs }: with pkgs; [
  (python3.withPackages (ps: with ps; [
    # venv
    direnv
    nix-direnv          

    # Core scientific
    ps.numpy
    ps.scipy
    ps.sympy
    ps.pandas
    ps.matplotlib
    ps.seaborn
    ps.jupyter

    # Electrical/control
    ps.pyvisa
    ps.pyserial
    ps.spiderpy
    ps.scikit-rf

    # Utilities
    ps.openpyxl
    ps.h5py
    ps.networkx
    ps.scikit-learn
    ps.opencv4
    ps.numba

  ]))
]
