#!/bin/bash
#
# Okay, I think this should work.
#
# Every time I ran "virtualenv" inside of a conda environment, it would
# die with "ValueError: failed to parse CPython sys.version" when it
# tried to run the new Python binary it had installed:
#
#   Traceback (most recent call last):
#     ...
#     File ".../lib/python2.7/platform.py", line 1464, in _sys_version
#       repr(sys_version))
#   ValueError: failed to parse CPython sys.version: '2.7.6 (default, Mar 22 2014, 23:03:14) \n[GCC 4.8.2]'
#
# So, for a while, I simply avoided using "virtualenv" while Anaconda
# was active.  But now I need to use the virtualenv-powered "tox" tool
# in a project.  My hand has been forced.
#
# So I re-ran "virtualenv", let it die with the error, and looked at the
# incomplete environment's "bin/python2.7" and found it was the tiny
# 8,106-byte Python binary that Anaconda ships.  It usually links to
# their own "libpython2.7.so" and therefore has their crazy non-standard
# (what were they thinking?) sys.version string that is a perfect match
# for the regular expression in their crazy non-standard "platform.py".
# But running "ldd" on the environment's "bin/python2.7" showed it
# linking to the Ubuntu "libpython2.7.so" instead, which explains the
# problem: the virtual environment is a collision between the normal
# "libpython2.7.so" and the non-standard Anaconda "platform.py".
#
# How does the Anaconda Python binary usually wind up linking to their
# own "libpython2.7.so" instead of Ubuntu's?  By, it turns out, having a
# relative RPATH - that only works if their Python binary is sitting
# right next to the "lib" directory containing their libpython:
#
# $ readelf -d anaconda/bin/python2.7 | grep RPATH
# 0x0000000f (RPATH)                      Library rpath: [$ORIGIN/../lib]
#
# This situation obviously does not pertain in a new virtualenv since it
# only copies in a minimal ".../lib/pythonX.Y" directory, not any shared
# libraries into "../lib" itself.  Hence the linker falls back to
# discovering and linking to the system "libpythonX.Y.so".
#
# This shell script intends to provide a remedy.  Run it once a conda
# environment has been (a) created and (b) activated and (c) has had
# "pip install virtualenv" freshly run inside of it, and this script
# will make sure that the "virtualenv.py" file is edited so that it
# copies the Anaconda libpython libraries across to each new environment
# that it creates.

if ! python -c 'import virtualenv' 2>/dev/null
then
    echo 'Error: virtualenv is not available to the current "python" binary'
    exit 1
fi

venv=$(python -c 'import virtualenv; print(virtualenv.__file__)')
venv=${venv%c}

if grep -q 'Added by Brandon' $venv
then
    echo 'Exiting: virtualenv.py has already been fixed'
    exit 0
fi

echo 'Editing virtualenv.py'

sed -i -f - $venv <<'EOF'

/^    stdlib_dirs = /i\
\
    # Added by Brandon's ",fix-virtualenv" script to copy the Anaconda\
    # libpython libraries into the new environment as well:\
    outer_lib_dir = os.path.dirname(lib_dir)\
    conda_lib_dir = os.path.dirname(os.path.dirname(os.__file__))\
    for fn in os.listdir(conda_lib_dir):\
        if fn.startswith('libpython'):\
            copyfile(join(conda_lib_dir, fn), join(outer_lib_dir, fn), symlink)\

EOF
