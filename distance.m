

function [dist] = distance(A,vi,vj);

%distance computes the distance between 2 vertices, vi and vj. Input
%adjacency matrix,A and the 2 vertices as such: distance(A,vi,vj)

temp = A(vi,vj);

if (vi == vj) % distance between 2 same vertices gives 0
    dist = 0;
end

if (temp ~= 0) % the 2 vertices share a common vertex. so the aij element is non zero
    dist = 1;
end

if (A(vi,:) == 0 || A(vj,:) == 0) %vi or/and vj is/are isolated vertex/vertices
    dist= inf;
end

dist = 1;
vi_temp = vi;

while (temp == 0)
dist = dist + 1;
[n0 n1] = size(vi_temp);
for k=1:n1
vi_adj= find(A(vi_temp(k),:)); %gives the indices of non zero elements of the row i ie the vertices which are adjacent to vi
vj_adj= find(A(vj,:));
[ri ci]= size(vi_adj); %ci gives the number of adjacent vertices from vi
[rj cj]= size(vj_adj);
for i=1:ci;
if vi_adj(i)==vi
dist=dist-1;
end
if vi_adj(i)==vj
temp=1;
break
end
end
vi_temp=vi_adj;
end

end