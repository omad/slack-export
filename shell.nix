with import <nixpkgs> {};
with python37Packages;

stdenv.mkDerivation {
  name = "impurePythonEnv";

  src = null;

  buildInputs = [
    # these packages are required for virtualenv and pip to work:
    #
    python37
    python37Packages.virtualenv
    python37Packages.pip
  ];

  shellHook = ''
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)
    virtualenv --no-setuptools venv
    export PATH=$PWD/venv/bin:$PATH
    pip install slacker pick
  '';
}
