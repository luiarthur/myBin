# myBin
my binary files

These files go into ~/bin:
- vulture

All other files go into ~/

Also, install latex [see this also](http://tex.stackexchange.com/questions/106113/is-there-any-way-to-have-a-latex-compiler-on-a-mac-without-root-access):
> sudo apt-get install texlive-science

And install:
- git
- vim-gnome
- Vundle
- tmux (use `tmux_install.sh` if no root access. Sourced from https://gist.github.com/luiarthur/2825d04d80555a208047)
- chrome
- r-base-core
- (texlive-latex-base is lightweight)
    - http://tex.stackexchange.com/questions/160878/how-can-i-install-font-t1-from-ecrm1200-using-tex-live-manager-tlmgr
    - http://askubuntu.com/questions/485514/how-to-properly-install-and-use-texlive-with-package-manager-in-14-04
- Scala
    - Make sure you have installed java: `sudo apt-get install default-jdk`
    - Download Scala here: http://www.scala-lang.org/download/
    - put in home directory 
    - `jars/jvmr` should be installed in my scala libs. Check for updates? (https://cran.r-project.org/src/contrib/Archive/jvmr/)
    - install: sbt (http://www.scala-sbt.org/download.html)
        - Or manual install: (http://www.scala-sbt.org/0.13/docs/Manual-Installation.html)
    - Note that when sbt adds a new package (e.g. breeze), it stores the jars in `~/.ivy2`.
- numpy (Numeric Python library)
    - ~~`sudo apt-get install python-numpy`~~
    - `pip install --user numpy` installs to `~./local`. Doesn't require root acces.
- Julia
    - If installing on a server, just download the [Generic Linux Binaries](http://julialang.org/downloads/)
    - in julia, `julia>  Pkg.add("RCall")`. This is an R-Julia intefacer. Requres R version > 3.2.0
    - Otherwise, Google: Install Julia. [Github](https://github.com/JuliaLang/julia) has the instructions. 
        - `git clone` the julia repo, then `make -j N`, where `N` is the number of processors to use in parallel.
        - If `/bin/sh: cmake: command not found` and you need to install `cmake` without root access, visit [here](http://geeksww.com/tutorials/operating_systems/linux/installation/downloading_compiling_and_installing_cmake_on_linux.php): 

        > Download:  
        > $ wget http://www.cmake.org/files/v2.8/cmake-2.8.3.tar.gz  
        > Extration of cmake source code from downloaded file:  
        > $ tar xzf cmake-2.8.3.tar.gz  
        > $ cd cmake-2.8.3  
        > Configuration:  
        > If you want to see the available conifuration options, run command below.  
        > $ ./configure --help  
        > In order to configure cmake before installation, run command below.  
        > $ cd ~/  
        > $ mkdir opt  
        > $ ./configure --prefix=~/opt/cmake-2.8.3  
        > We basically instructed the install script to install CMake in /opt/cmake.  
        > Compilation:  
        > $ make  
        > Installation:  
        > $ make install  
        > Verification:  
        > After installation without any errors you can verify the installation by running the command below:  
        > $ ~/opt/cmake-2.8.3/bin/cmake -version  
        > The output should look something like below (depending upon cmake version you are installing).  
        > cmake version 2.8.3  
        > add `~/opt/cmake-2.8.4/bin/` to search path in `.bashrc`
        
    - ~~With Julia, set up auto library loads~~
      - The 2 items below are used to precompile packages / functions.
      - https://groups.google.com/forum/#!topic/julia-users/uQfBNtJksRo
      - in `~/julia`, run: `$ julia -e 'Pkg.update(); Pkg.add("Cairo")' && echo 'Base.require("Gadfly.jl")' > base/userimg.jl && make`
      - OR: `$ julia -e 'Pkg.update(); Pkg.checkout("Cairo")' && echo 'Base.require("Gadfly.jl")' > base/userimg.jl && make`
      - Now in Julia, this takes no time: `using Gadfly,Distributions,DataFrames`
- curl, rvm, Ruby, Gems, nodejs, Jekyll
    - Before installing rvm: `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
    - Ruby on Rails: http://railsapps.github.io/installrubyonrails-ubuntu.html
    - `gem install jekyll`
- ~~Go~~
    - To install go:
    
    > $ git clone https://go.googlesource.com/go  
    > $ cd go  
    > $ git checkout go1.4.1  
    > $ cd src  
    > $ ./all.bash  

    - Detailed Instructions for installing go:
        - https://golang.org/doc/install/source 
- Download Armadillo (Linear Algebra Library for C++) from:
    - http://arma.sourceforge.net/download.html
    - unpack in home directory
    - download openblas from github
    - install lapack

- GSL
  - https://www.youtube.com/watch?v=JrvnJaj7Ogk

- (OPTIONAL): The `Makevars` file belongs in `~/.R`. This is only used if I want to switch the default g++ compiler. I only use this on servers where I had to install my own version of `gcc`.
- Check out to better understand how to rewrite Makevars `/usr/lib/R/etc/Makeconf` 
 

Useful Bash Commands to know:

- To find the number of processors
    `$ nproc`
- To see storage info:
    `$ df -h`
- To see Performance Info:
    `$ top`
- To see Processor Info:
    `$ vi /proc/cpuinfo`
- `lscpu`

- Java:
  - extract jar (if the fourth argument is not given, all files will be unpacked)
    - `$ jar xf jar-file-name [files(s)-to-extract]`
  - compress into jar
    - `$ jar cf new-jar-file-name files-to-compress`

- Add this to `~/.config/user-dirs.dirs`
> XDG_DESKTOP_DIR="$HOME/Desktop"  
> XDG_DOWNLOAD_DIR="$HOME/Downloads"  
> XDG_TEMPLATES_DIR="$HOME/Downloads"  
> XDG_PUBLICSHARE_DIR="$HOME/Downloads"  
> XDG_DOCUMENTS_DIR="$HOME/Downloads"  
> XDG_PICTURES_DIR="$HOME/Downloads/Pictures"  
> XDG_VIDEOS_DIR="$HOME/Downloads/Videos"  
