library(knotR)

filename <- "triloop.svg"

outri <- matrix(
    c(
        01,06,
        12,02,
        03,18,
        10,04,
        05,16,
        08,13,
        19,09,
        17,11,
        15,20
	) , byrow=TRUE,ncol=2)



## Now create a symmetry object (look at the knotplot(a) to see the
## nodes that are rotationally related, and also the nodes that are on
## the centreline)
Mrottri <-
  rbind(
      c(15,01,08),
      c(16,02,09),
      c(10,17,03),
      c(04,11,18),
      c(05,12,19),
      c(20,06,13),
      c(21,07,14)
      )

Mvertri <- 
    matrix(
        c(
            20,21,
            15,05,
            04,16,
            14,06,
            19,01,
            03,17,
            18,02,
            08,12,
            13,07
            ),
        byrow=TRUE,ncol=2
        )


jj <- knotoptim(filename,
                weights = c(1,0.01,rep(1,7)),
                Mrot = Mrottri,
                Mver = Mvertri,
                xver = 10,
                ou   = outri,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

