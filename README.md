# GrahamScan
Simple implementation of Graham Scan Algorithm to compute a Convex Hull out of a input set of points
![convex_hull](https://user-images.githubusercontent.com/77103965/168420504-69a1d171-ee69-4f8b-8cb2-d9e05b2e247f.png)
The algorithm starts by sorting the input set of points in increasing x-coordinate value, then we take into account 3 points at time and perform the Orientation Test on those points.
We push on the stack the next point if the Orientation test is successful (Right Turn), when instead we pop until we get a succesful one in the other case.
At the end we will have on the stack all points belonging to the Upper Hull.
We perform the same algorithm checking for a Left turn in order to compute the Lower Hull, and we merge the two results, obtaing the points of the whole Convex Hull.
