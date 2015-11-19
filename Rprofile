# Fix plot
dummy1 <- function(x,y,...) UseMethod("plot")
plot <- function(...,fg="grey",bty="n",col="grey20") {
  dummy1a <- function(...,fg.a = fg, bty.a = bty, col.a = col) {
    dummy1(fg=fg.a,bty=bty.a,col=col.a,...) 
  }
  dummy1a(...)
}
