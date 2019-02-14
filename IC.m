A=imread('cameraman.tif');
Q=[16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99 ];

X=mat2cell(A,8*ones(1,32),8*ones(1,32));

for i=1:32
    for j=1:32
       X{i,j}=dct2(X{i,j});
    end
end

QF=input('Enter Quality Factor(1-100):');
if QF<50
    S=5000/QF;
else
    S=200-2*QF;
end

T=floor((S*Q)+50)/100;
T(T==0)=1;

for i=1:32
    for j=1:32
        X{i,j}=round(X{i,j}./T);
    end
end

for i=1:32
    for j=1:32
        X{i,j}=X{i,j}.*T;
    end
end

for i=1:32
    for j=1:32
       X{i,j}=idct2(X{i,j});
    end
end

CI=cell2mat(X);
CI=uint8(CI);

figure;
subplot(1,2,1),
imshow(A),
xlabel('Original Image');

subplot(1,2,2),
imshow(CI),
xlabel('Compressed Image');

% for i=1:32
%     for j=1:32
%         X{i,j}=transpose(X{i,j});
%         M{i,j}=reshape(X{i,j},1,64);
%         X{i,j}=transpose(X{i,j});
%     end
% end
% 
% 
% fid = fopen('temp.txt','wt');
% for ii = 1:32
%     for jj = 1:32
%         fprintf(fid,'%g,\n',X{ii,jj});
%     end
% end
% fclose(fid);