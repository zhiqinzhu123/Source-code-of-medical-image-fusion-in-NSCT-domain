function  HF=high_fusion(Y1,Y2)

map=(abs(Y1)>abs(Y2));
map=majority_consist_new(map,19);
HF=map.*Y1+~map.*Y2;