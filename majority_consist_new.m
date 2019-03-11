function cp=majority_consist_new(map,window_size)
% fuction: Do the majority filter on the decision map
% window size is set to be n*n.
%=============================================================
% Huafeng Li 
%Kunming University of Science and Technology, 2015/4/17
%=============================================================
% disp('majority map is processing...')
[row,column]=size(map);
cp=zeros(row,column);
spread=((window_size-1)/2);
map_en=padarray(map,[spread spread],'symmetric');
for i=1:row
    for j=1:column
        window=map_en(i:1:(i+window_size-1),j:1:(j+window_size-1));
        judge=window.*ones(window_size,window_size);
        if sum(judge(:))>=window_size*window_size/2
            cp(i,j)=1;
        else
            cp(i,j)=0;
        end
    end
end
