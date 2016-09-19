- keep jars in a `~/lib/scala_lib` to access instantly
    - in `~/.bashrc`
      - `export CLASSPATH=~/lib/scala_lib/*:$CLASSPATH`
    - this is not super recommended if the packages update frequently. Using sbt may be more ideal. But this can be done if you prefer keeping track of your packages yourself.
     

- How to get rscala.jar standalone
  - https://dahl.byu.edu/software/rscala/scaladoc/index.html#org.ddahl.rscala.RClient

  > The paths of the rscala's JARs (for all supported versions of Scala) are
  > available from R using rscala::rscalaJar(). To get just the JAR for Scala
  > 2.11, for example, use rscala::rscalaJar("2.11").

- How to get breeze.jar standalone
  - git clone breeze
  - sbt assembly

