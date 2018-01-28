library(knotR)
filename <- "7_4.svg"
a <- reader(filename)

Mhor <-
  matrix(c(
      06,12,
      07,11,
      05,13,
      17,01,
      16,02,
      08,10,
      14,04,
      15,03
  ),ncol=2,byrow=TRUE)

xhor  <- c(9,18)    # nodes on centreline

Mver <-
  matrix(c(
      16,07,
      15,06,
      08,17,
      14,05,
      09,18,
      04,13,
      10,01,
      03,12,
      02,11
  ),ncol=2,byrow=TRUE)


sym74 <- symmetry_object(a, Mver=Mver, xhor=xhor, Mhor=Mhor,mcdonalds=TRUE,celtic=TRUE)
k74  <- symmetrize(as.minobj(a),sym74)

ou74 <- matrix(c(
    1, 13,
    11, 2,
    4, 10,
    14, 5,
    6, 18,
    17, 8,
    9, 15
), ncol=2,byrow=TRUE)


jj <- knotoptim(filename,
                symobj = sym74,
                ou   = ou74,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

