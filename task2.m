left = imread('Left.jpg');
right = imread('Right.jpg');
figure; imshow(left); title('left');
[uBase,vBase] = ginput(6);  %get the 6 input points for left image.
figure;imshow(right);title('Right');
[u2Trans,v2Trans] = ginput(6); %get the corresponding 6 input points for right image.
H=DLT(u2Trans, v2Trans, uBase, vBase); %call function DLT()
%test the matrix H.
figure(1);imshow(left);hold on;plot(uBase,vBase,'r.'); %show the six points in left image.
[Px, Py] = ginput(1);  %input one new point for test.
P = [Px, Py];hold on;plot(P(1),P(2),'gp','MarkerSize', 12); %show the test point in left image.
x1 = P(:, 1); %get the test point' coordinates.
y1 = P(:, 2);
p1 = [x1'; y1'; ones(1, length(x1))]; %change the Two-dimensional coordinates to Homogeneous coordinates.
q1 = H*p1;  %use matrix H to translate the point.
q1 = q1./[q1(3, :); q1(3,:); q1(3, :)]; %Normalized.
p2 = q1'; %change from one column to one row.
figure(2)
imshow(right);hold on;plot(u2Trans,v2Trans,'r.'); %show the six input points in right image.
hold on;
plot(p2(1), p2(2), 'gp', 'MarkerSize', 12); %show the corresponding point for the test point in right image.
  