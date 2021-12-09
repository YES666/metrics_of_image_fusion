function mi = CalculateMI(a,b)
%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
参数：
    a           ——输入图像a
    b           ——输入图像b
    mi          ——图像a和b的互信息

功能：
    利用一个联合直方图，计算两幅图像的互信息值。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}

a = double(a);
b = double(b);
[M,N] = size(b);
hab = zeros(256,256);
if max(max(a))~=min(min(a))
    a = (a-min(min(a))) / (max(max(a))-min(min(a)));
else
    a = zeros(M,N);
end
if max(max(b))~=min(min(b))
    b = (b-min(min(b))) / (max(max(b))-min(min(b)));
else
    b = zeros(M,N);
end
a = double(int16(a*255)) + 1;
b = double(int16(b*255)) + 1;

for i=1:M
    for j=1:N
        index_x = a(i,j);
        index_y = b(i,j);
        hab(index_x,index_y) = hab(index_x,index_y) + 1;
    end
end

habsum = sum(sum(hab));
index = find(hab~=0);
pab = hab/habsum;
Hab = sum(sum(-pab(index).*log2(pab(index))));

%pa = sum(pab');
pa = sum(pab,2)';
index = find(pa~=0);
%Ha = sum(sum(-pa(index).*log2(pa(index))));
Ha = sum(-pa(index).*log2(pa(index)));

pb = sum(pab);
index = find(pb~=0);
%Hb = sum(sum(-pb(index).*log2(pb(index))));
Hb = sum(-pb(index).*log2(pb(index)));

mi = Ha+Hb-Hab;
end
