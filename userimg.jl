# Added by Arthur Lui 29 April, 2015.
# ~/julia/base/userimg.jl
# To precompile packages / code, just do something like below.
# Gadfly is a package witch has dependencies of DataFrames and 
# Distributions. All of which I use a lot. Add more lines,
# e.g. Base.require("whateverPkg.jl"). Then cd ../ to julia/
# And then run:
# $ make
# After everything is done compiling (which takes a few minutes),
# launch julia, and you can use the package (Gadfly and dependencies)
# like you typed `import Gadfly`. E.g., Gadfly.plot should work just fine.
Base.require("Gadfly.jl")
