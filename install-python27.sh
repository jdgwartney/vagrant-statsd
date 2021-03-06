#/bin/bash
#
# Installs a Python 2.7 on centos, ubuntu operating systems without disturbing 2.6 whichimpacts yum
#

set -x

INSTALL_DIR=/usr/local
PYTHON_VERSION=2.7.10
SETUP_TOOLS_VERSION=1.4.2

echo "Download python $PYTHON_VERSION, extract, configure, and build"
wget http://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tar.xz

# Let's decode (-d) the XZ encoded tar archive:
xz -d Python-$PYTHON_VERSION.tar.xz

# Now we can perform the extraction:
tar -xvf Python-$PYTHON_VERSION.tar


# Enter the extracted directory:
pushd Python-$PYTHON_VERSION

# Start the configuration (setting the installation directory)
# By default files are installed in /usr/local.
# You can modify the --prefix to modify it (e.g. for $HOME).
./configure --prefix=$INSTALL_DIR


# Let's build (compile) the source
# This procedure can take awhile (~a few minutes)
make

# After building everything:
sudo make altinstall

popd

echo "Download setup tools $SETUP_TOOLS_VERSION, extract, and install"
# Let's download the installation file using wget:
wget --no-check-certificate "https://pypi.python.org/packages/source/s/setuptools/setuptools-$SETUP_TOOLS_VERSION.tar.gz"

# Extract the files from the archive:
tar -xvf "setuptools-$SETUP_TOOLS_VERSION.tar.gz"


# Enter the extracted directory:
pushd "setuptools-$SETUP_TOOLS_VERSION"

# Install setuptools using the Python we've installed (2.7.6)
sudo $INSTALL_DIR/bin/python setup.py install

popd

echo "Download latest version of pip, and install"
wget https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py

sudo $INSTALL_DIR/bin/python2.7 get-pip.py

echo "Install virtualenv pip package"
sudo $INSTALL_DIR/bin/python2.7 $INSTALL_DIR/bin/pip install virtualenv

echo "export PATH=$INSTALL_DIR/bin:"'$PATH' >> /home/vagrant/.bash_profile

