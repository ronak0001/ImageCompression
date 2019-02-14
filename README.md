# ImageCompression

This code reads an image as a matrix and applies discrete cosine transform on it. Then, user needs to enter the quality factor he/she want for the compressed image. Predifined quantification matrix does the job of quantifying the image after dct. Now, we just need to get back into our original space of pixels by applying inverse discrete cosine transform. The image we get is compressed image with quality factor user has entered.
