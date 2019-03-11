function cp=SF_Engerg(matrix)

%=============================================================
FPCM=Lo_FeaturePCM(matrix);
% disp('SF_Engerg is computing...')
[row,column]=size(matrix);
cp=zeros(row,column);
window_wide=3;
spread=(window_wide-1)/2;
matrix_en=padarray(matrix,[spread spread],'symmetric');
temp=matrix_en.*0;
for i=2:row+1
    for j=2:column+1
        tempp(i-1,j-1)=(abs(matrix_en(i,j)-matrix_en(i+1,j)))^2+(abs(matrix_en(i,j)-matrix_en(i-1,j)))^2+(abs(matrix_en(i,j)-matrix_en(i,j+1)))^2+(abs(matrix_en(i,j)-matrix_en(i,j-1)))^2;
    end
end
tempp=padarray(tempp,[spread spread],'symmetric');
temp=matrix_en.*matrix_en;
for i=1:row
    for j=1:column
        window1=abs(temp(i:1:(i+2*spread),j:1:(j+2*spread)));
        window2=abs(tempp(i:1:(i+2*spread),j:1:(j+2*spread)));
        cp1(i,j)=sum(window1(:));
        cp2(i,j)=sum(window2(:));
    end
end
cp=((cp1)).*((cp2).^1).*(abs(FPCM).^0.005);