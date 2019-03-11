function cp=Engerg(matrix,d)
Y=ones(d,d);
cp=conv2(matrix.*matrix, Y, 'same');  