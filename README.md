# The DIKU, 3DLab, and ITU Matlab Repository

---

This is a collection of Matlab functions programmed by a number of people at DIKU, 3DLab, ITU, and Eindhoven. This site is intended to contain the most recent versions of these shared Matlab functions. This is an experimental setup. If you have comments or would like to add or update a function, please mail me at: [sporring@diku.dk](mailto:sporring@diku.dk).

Most functions are carefully documented using embedded comments in the beginning of the file. Hence you may learn more about the functions by viewing the M-code. The comments use the standard Matlab style: the first line is the function head followed by the help section used by the Matlab help command. An example of a properly written help section is given in [scale.m](src/scale.m). The first line contains a one-line description, followed by an empty line, and ending with the body of the help text.

### Linear Scale-Space functions

These functions implement the Gaussian scale-space in various ways.

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [scale.m](src/scale.m) | Linear Scalespace for 1 and 2 dimensions using Fourier Implementation. | April 2001 | Jon Sporring |
| [scale2.m](src/scale2.m) | Similar to **scale.m**. Kept for compatibility reasons | May 2000 | Jon Sporring |
| [scalen.m](src/scalen.m) | Linear Scalespace for any dimensions using Fourier Implementation. | Feb 2000 | Jon Sporring |
| [scalespace.m](src/scalespace.m) | A stack of images from the Linear Scalespace using **scale.m**. | Jan 1997 | Jon Sporring |
| [scalevw.m](src/scalevw.m) | Linear Scalespace using **scale.m** implementing gauge derivatives. | Nov 2000 | Ole Fogh Olsen |

### Non-linear Scale-Space functions

These functions were part of Joachim Weickert's course May 1998 at DIKU. Some of these functions were written in C by Weickert, except for some key elements which were completed by Jon Sporring as part of the course. Sporring has later wrapped the C-code in a mexfunction. Therefore, the M-files are just the Matlab help-text, and the real code is the mex-program with the prefix .c. An example of a setup file of the mex (actually C) compiler is given in [mexopts.sh](src/mexopts.sh). The test scripts use the image [noise.tif](src/noise.tif).

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [ild.m](src/ild.m) | Isotropic Linear Diffusion | Jan 2001 | Jon Sporring |
| [ind.m](src/ind.m) | Isotropic Nonlinear Diffusion using **ild.m** | Oct 2000 | Joachim Weickert & Jon Sporring |
| [ind_aos.c](src/ind_aos.c) <br>[ind_aos.m](src/ind_aos.m) <br>[ind_aostest.m](src/ind_aostest.m) | Isotropic Nonlinear Diffusion using Additive Operator Splitting | May 1998 | Joachim Weickert & Jon Sporring |
| [eed.m](src/eed.m) | Edge-enhancing Anisotropic Diffusion using **ild.m** | Oct 2000 | Joachim Weickert & Jon Sporring |
| [ced.m](src/ced.m) | Coherence Enhanced Diffusion using **ild.m** | Oct 2000 | Joachim Weickert & Jon Sporring |
| [erosion.m](src/erosion.m) | Morphological Erosion | Oct 2000 | Jon Sporring |
| [dilation.m](src/dilation.m) | Morphological Dilation | Oct 2000 | Jon Sporring |
| [mcm.m](src/mcm.m) | Mean Curvature Motion | Oct 2000 | Joachim Weickert & Jon Sporring |
| [amss.m](src/amss.m) | Affine Morphological Scalespace | Oct 2000 | Joachim Weickert & Jon Sporring |

### General Filtering Tools

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [nlfilter3.m](src/nlfilter3.m) | 3d extension of nlfilter2: any block filtering of a 3 dimensional image | Nov 2015 | Jon Sporring |

### Medical Image Processing Tools

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [biasCorrect.m](src/biasCorrect.m) | Estimate the bias field for a 2 dimensional matrix | Oct 2014 | Jon Sporring |
| [biasCorrect3d.m](src/biasCorrect3d.m) | Estimate the bias field for a 3 dimensional matrix | Dec 2015 | Jon Sporring |

### PDE Methods

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [sgnDstFromImg.m](src/sgnDstFromImg.m) | Signed Distance Function | Dec 2004 | Henrik Dohlmann, Kenny Erleben, & Jon Sporring |
| [chanVese.m](src/chanVese.m) | Chan Vese segmentation | Dec 2004 | Jon Sporring |
| [054.tif](src/054.tif) | Test data for chanVese.m | Dec 2004 | Jon Sporring |

### Differential Geometry

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [finitediff.m](src/finitediff.m) | Calculate the finite difference stencil in 1 dimension | Nov 2003 | Jon Sporring |
| [zerocrossing.m](src/zerocrossing.m) | Finds the fractional indices of the zerocrossings of a sampled function | Jan 1996 | Jon Sporring |
| [crossings.m](src/crossings.m) | Finds the points where two images are identically equal to zero. | Jan 1996 | Jon Sporring |
| [curvature.m](src/curvature.m) | Calculates the Gaussian and Mean curvature of an image using **scale.m**. | Nov 1997 | Jon Sporring |
| [isocurvature.m](src/isocurvature.m) | Calculates the Isophote curvature using **scale.m**. | Jan 1997 | Jon Sporring |
| [isocurvature2.m](src/isocurvature2.m) | Calculates the Isophote curvature using **scale.m**. | Jan 1997 | Jon Sporring |
| [dexpr.m](src/dexpr.m) <br>[tokens.def](src/tokens.def) | Parses and computes a differential expression using **scale.m**. | March 2001 | Martin Lillholm |
| [snake.m](src/snake.m) | Implementation of Kass's et al. snake | Dec 2003 | Jon Sporring |
| [snakeTest.m](src/snakeTest.m) | A demonstration program for snake.m | Dec 2003 | Jon Sporring |

### Statistical Distributions

Function to produce various parameterized distributions.

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [beta.m](src/beta.m) | The beta distribution | May 1997 | Jon Sporring |
| [binomial.m](src/binomial.m) | The binomial distribution | May 1997 | Jon Sporring |
| [chi.m](src/chi.m) | The X^2 distribution | May 1997 | Jon Sporring |
| [exponential.m](src/exponential.m) | The exponential distribution | May 1997 | Jon Sporring |
| [geometric.m](src/geometric.m) | The geometric distribution | May 1997 | Jon Sporring |
| [lognormal.m](src/lognormal.m) | The log-normal distribution | May 1997 | Jon Sporring |
| [normal.m](src/normal.m) | The normal or Gaussian distribution | May 1997 | Jon Sporring |
| [poisson.m](src/poisson.m) | The Poisson distribution | May 1997 | Jon Sporring |

### Statistical Estimations

Function to produce various parameterized distributions.

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [kmean.m](src/kmean.m) | A slow but precise kmean algorithm. | Jan 1994 | Jon Sporring |
| [kmean2.m](src/kmean2.m) | Uses kmean.m with random starting points. | Jan 1994 | Jon Sporring |
| [localhist.m](src/localhist.m) | Calculates the Gaussian weighted local histogram in a point of an image using **scale.m**. | Dec 1999 | Jon Sporring |
| [localhist2.m](src/localhist2.m) | Calculates all the Gaussian weighted local histograms in an image using **localhist.m**. | Jun 2001 | Jon Sporring |
| [guilocalhist2.m](src/guilocalhist2.m) | A stand-alone graphical user interface to **localhist2.m**. | Oct 2000 | Jon Sporring |
| [cooccurrence.m](src/cooccurrence.m) | Calculates the cooccurrence matrix for a gray-valued image. | Jan 1997 | Jon Sporring |
| [emGaussianMixture.m](src/emGaussianMixture.m) | Expectation Maximization estimation for a Mixture of Gaussian Model | Nov 2003 | Jon Sporring |
| [emGaussianMixtureTest.m](src/emGaussianMixtureTest.m) | A demo script for emGaussianMixture.m | Nov 2003 | Jon Sporring |

### Stochastic Images

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [fbm_image.m](src/fbm_image.m) | Generate a randomly chosen Fractal Brownian Motion image. | Jan 1997 | Jon Sporring |
| [rnd_paste_image.m](src/rnd_paste_image.m) | Generate a random image of pasted sub-images. | Jan 1997 | Jon Sporring |
| [RandomIsingImage.m](src/RandomIsingImage.m) | Generate a random image under the Ising Gibbs Random Field model. | Dec 2003 | Jon Sporring |

### Information Theory and Multifractals

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [uni_length.m](src/uni_length.m) | Calculate the code length of the Universal Distribution of Integers. | Jan 1996 | Jon Sporring |
| [entropy.m](src/entropy.m) | Calculate the entropy of a distribution. | Jan 1996 | Jon Sporring |
| [information.m](src/information.m) | Calculate the generalized-entropy of a distribution. | May 1997 | Jon Sporring |
| [information_scale.m](src/information_scale.m) | Calculate the generalized-entropy of a distribution over a number of scales using **scale.m**. | May 1997 | Jon Sporring |
| [inf2spect.m](src/inf2spect.m) | Transform generalized-entropies to a multifractal spectrum. | May 1997 | Jon Sporring |
| [spectrum.m](src/spectrum.m) | Calculate the multifractal spectrum a distribution using **inf2spect.m** and **information_scale.m**. | May 1997 | Jon Sporring |

### Contourc.m list functions

These functions may also be used to parse contourc.m list, and they implement a general list of vectors of arbitrary dimension.

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [list_concat.m](src/list_concat.m) | Concatenate two lists. | Mar 1997 | Jon Sporring |
| [list_delete.m](src/list_delete.m) | Delete element from list. | Mar 1997 | Jon Sporring |
| [list_first.m](src/list_first.m) | Get index of first element in list. | Mar 1997 | Jon Sporring |
| [list_forall.m](src/list_forall.m) | Map function onto all elements of list. | Mar 1997 | Jon Sporring |
| [list_get.m](src/list_get.m) | Get element in list. | Mar 1997 | Jon Sporring |
| [list_get_attributes.m](src/list_get_attributes.m) | Get attributes of element. | Mar 1997 | Jon Sporring |
| [list_getn.m](src/list_getn.m) | Get n'th element in list. | Mar 1997 | Jon Sporring |
| [list_insert.m](src/list_insert.m) | Insert element in list. | Mar 1997 | Jon Sporring |
| [list_last.m](src/list_last.m) | Get last element of list. | Mar 1997 | Jon Sporring |
| [list_mat2vec.m](src/list_mat2vec.m) | | Mar 1997 | Jon Sporring |
| [list_n.m](src/list_n.m) | Get index of n'th element in list. | Mar 1997 | Jon Sporring |
| [list_next.m](src/list_next.m) | Get index of next element in list. | Mar 1997 | Jon Sporring |
| [list_set_attributes.m](src/list_set_attributes.m) | Set attributes of element in list. | Mar 1997 | Jon Sporring |
| [list_size.m](src/list_size.m) | Get number of elements in list. | Mar 1997 | Jon Sporring |
| [list_toCell.m](src/list_toCell.m) | Convert a list to a cell-array. | July 2014 | Jon Sporring |
| [list_valid_pointer.m](src/list_valid_pointer.m) | Check for valid index. | Mar 1997 | Jon Sporring |
| [list_vec2mat.m](src/list_vec2mat.m) | | Mar 1997 | Jon Sporring |

### Image i/o functions

These DIKU mex-functions require the DIKU image library to be compiled. Conversely, the HIPS reader hacks the HIPS format and should therefore be used with care. It is mainly intended as an example.

| File | Description | Date | Author |
| --- | --- | --- | --- |
| [dikuread.c](src/dikuread.c) <br>[dikuread.m](src/dikuread.m) | Input a DIKU image from disk using **the DIKU library**. | Mar 1996 | Jon Sporring |
| [dikuwrite.c](src/dikuwrite.c) <br>[dikuwrite.m](src/dikuwrite.m) | Output a DIKU image to disk using **the DIKU library**. | Mar 1996 | Jon Sporring |
| [hipsread.c](src/hipsread.c) <br>[hipsread.m](src/hipsread.m) | Read a HIPS image from disk. | Oct 2000 | Jon Sporring |
