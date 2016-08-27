# Response to reviewer 1

We thank the reviewer for his or her detailed comments, which we have addressed
to improve the manuscript significantly.

>General remarks:
- I understand that the implementation of this work in OpenFOAM has demanded a lot of effort but could you please elaborate on what is new/novel in this work? An issue that has not been attacked/discovered/raised before or a numerical implementation which overcomes a known problem.

As noted in the "Novelty" file, this work presents some results that have either never been simulated or reported before:

1. Validating with Reynolds numbers more representative of a full-scale turbine, and two orders of magnitude higher than those used by Shamsoddin and Porte-Agel.
2. Reporting performance predictions, which has also not yet been done for a VAT in an ALM simulation.
3. Embedding the ALM inside of a RANS model for additional computational affordability.

The reviewer is correct that we had not sufficiently described this novelty in
the paper itself, and we have updated the introduction accordingly.


>- Minor comment: I'd rather use nondimentional units for variables such as time step
>
>Pages 1-6: Again, very good introduction and gathering of introductory note, but in my opinion, it
should be shortened for a journal.
>
Page 7, Fig 3: It is taking a lot of room, perhaps you can make a smaller schematic
>
Page 9 fig 6: The Cp figure is an interesting one. But first of all, but is there a particular reason
why you have not shown Ct next to it (it's more common this way than having Cd). Also, would it not be possible to have LES results on top of both figures 6 and 11 for the cases you have simulated?
>
Page 11, Line 42: I'm not quite sure if what you have stated about Smagorinsky model is correct. It
certainly is very easy to implement and gives nice results in some cases, but we are all aware of its
deficiencies. We set a fix Cs value which means we add numerical dissipation to the whole
computatiponal domain, but this is not really accurate when dealing with cases with strong directional
homogeneity and anisotropy. Why didn't you choose a dynamic Smagorinsky or even dynamic Lagrangian model? Besides, what is the Cs value you have used?
>
Page 13, Fig 15: Following my last comment, figure to the right may very well explain that the
Smagorinsly model has been over dissipative thereby hampering turbulent fluctuations which may have otherwise resulted in higher TKEs.
>
Page 14, Line 27: Matching mean velocities is usually rather straightforward (in non-presudospectral
codes, sometimes even shutting down the whole SGS modeling wouln'd make a difference as long as no solid walls are involved). But higher order moments such as Reynolds stress tensor components are usually more sensitive. Perhaps you can go more in depth with that part -- possibly compare your
results with other experiments or CFD simulations. Besides, please try and overcome the relatively large discrepancies seen in figures 6 (high TSR), 9, 11.
