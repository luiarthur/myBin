# myBin
my binary files

These files go into ~/bin:
- vulture

All other files go into ~/

Also, install latex:
> sudo apt-get install texlive-latex-extra

And install:
- git
- vim-gnome
- Vundle
- tmux
- chrome
- r-base-core
- texlive-latex-extra
- ~~Scala~~
    - Download here: http://www.scala-lang.org/download/
    - put in home directory 
    - install: sbt (http://www.scala-sbt.org/download.html)
- Julia
    - Google: Install Julia. Github has the instructions. 
        - `git clone` the julia repo, then `make -j N`, where `N` is the number of processors to use in parallel.
    - With Julia, set up auto library loads
      - The 2 items below are used to precompile packages / functions.
      - https://groups.google.com/forum/#!topic/julia-users/uQfBNtJksRo
      - `$ julia -e 'Pkg.update(); Pkg.checkout("Cairo")' && echo 'Base.require("Gadfly.jl")' > base/userimg.jl && make`
      - OR: 
        - in julia, run: `Pkg.update(); Pkg.add("Cairo")`
        - Add `userimg.jl` to `~/julia/base/`
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


Useful Bash Commands to know:

- To find the number of processors
    `$ nproc`
- To see storage info:
    `$ df -h`
- To see Performance Info:
    `$ top`
- To see Processor Info:
    `$ vi /proc/cpuinfo`
