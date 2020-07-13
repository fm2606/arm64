/*
* modulo function
*
* mod(n, d)
*
* n: numerator - X0
* d: denominator - X1
* 
* if d = 0 return 0
*
* INPUT:
*   X0: numerator
*   X1: denomiator
*
* OUTPUT:
*   d mod n
*
* REGISTERS:
*   no registers are saved
*
* REFERENCES:
*
*   https://en.wikipedia.org/wiki/Modulo_operation
*
* author: Curtis Lewis
* date: 2020-07-12 
*
*------|-------|---------------|-----------------------------------------------|
*/

        .arch   armv8-a
        .file   "mod.s"
        .text
        .global mod 
        .type   mod, %function

mod:
        // if denominator is 0 return with a value of 0
        cmp     x1, #0
        csel    x0, x1, x0, eq  // if denom = 0, move 0 into return register
                                // otherwise keep numerator in x0 
        b.eq    return          // if denom = 0 return

        sdiv    x2, x1, x0      // x2 = x1/x0 ( q = d/n )
        mul     x3, x2, x0      // x3 = x2*x0 ( n*q )
        subs    x0, x1, x3      // r = d - n*q
        cmp     x0, #0
        neg     x1, x0
        csel    x0, x1, x0, lt   // if x0 < 0 : x1 ? x0

return:
        ret
