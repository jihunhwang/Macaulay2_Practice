-- Based on https://www.youtube.com/watch?v=i9cTeVp8jeo
-- and https://www.youtube.com/watch?v=he3VYZ5iao4

-- Equations of the Segre embedding
kk = ZZ/32003 -- Could take QQ as well.
A = kk^2 -- kk-module, a free module of a vector space of dim. 2
B = kk^2
C = kk^2
-- We can compute the tensor product of two spaces using ** command
  -- for example
V = A ** B ** C -- tenser product of A B C -- k^8 k-module, free

R = kk[a_1, a_2, b_1, b_2, c_1, c_2] -- PolynomialRing
S = kk[x_(1,1,1)..x_(2,2,2)] -- Polynomial ring with 8 variables
aa = matrix{{a_1, a_2}} -- |a_1 a_2| Matrix R1 <--- R2
bb = matrix{{b_1, b_2}}
cc = matrix{{c_1, c_2}}

ideal(aa**bb) -- Ideal of R, ideal (a1b1, a1b2, a2b1, a2b2)
gens S -- {x111, x112, x121, x122, x211, x212, x221, x222}

-- Make a ring map from S to R -- RingMap R <--- S
phi = map(R,S,aa**bb**cc)
  -- Usually, computing kernel is computationally extensive
I = ker phi -- Ideal of S
netList I_* -- the better way to see the generators of I

-- Compute the dimension of I
  -- Let P = \mathbb{P}
  -- P^1 * P^1 * P^1 -> X subset of P^7
  -- X has dimension 3 so the dimension of the ideal should be 4
dim I -- 4
codim I -- 4
degree I -- 6

-- hilbert series of polynomial ring
hilbertSeries I -- (1 - 9T^2 + 16T^3 - 9T^4 + T^6) / (1 - T)^8
  -- oo is a syntax for calling the previous object/variable.
reduceHilbert oo -- (1 + 4T + T^2) / (1 - T)^4

-- Free resolution of the ideal in each variables
resI = res I -- ChainComplex S1 <- S9 <- S16 <- S9 <- S1 <- 0
betti oo -- Betty diagram -- gives you information of the degrees

resI.dd -- Gives the whole chain complex map
resI.dd_2 -- The second map (the first syzygy map S9 <- S16)
-- Each column there is one of the syzygys
resI.dd_3 -- The next one S16 <- S9
resI.dd_4
