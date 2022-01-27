-- Taken from my colleague's lecture notes
-- https://www.math.columbia.edu/~plei/docs/ug-ag.pdf

-- We now consider the Clebsch cubic surface
-- x^3 + y^3 + z^3 + 1 = (x+y+z+1)^3
-- There is a famous theorem that any smooth cubic surfaces
-- contain exactly 27 lines. We will calculate these 27 lines

R = ZZ/101[ x ,y ,z , x0 , y0 , z0 ,a ,b ,c , t ]
cubic = x^3+ y^3+ z^3+1 -( x + y + z +1)^3
cubt = sub ( cubic , { x => x0 + a*t , y => y0 + b*t ,
  z => z0 + c*t })
cubic0 = sub ( cubt , t => 0)
cubic1 = sub ( diff (t , cubt ) , t => 0)
cubic2 = sub ( diff (t , diff (t , cubt ) ) , t => 0)
cubic3 = sub ( diff (t , diff (t , diff (t , cubt ) ) ) ,
  t => 0)
Lines = ideal ( cubic0 , cubic1 , cubic2 , cubic3 )
L = decompose Lines
f = x^3+ y^3+ z^3 -( x + y + z )^3
factor f
print number(L, i->i=!=0) -- L should be 25

-- We found an interesting phenomenon where the computation took
-- longer and was the computer was unable to find the expected
-- 25 affine lines when we worked over Z/103Z because 5 is not
-- a quadratic residue mod 103.
