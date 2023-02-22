% function [out1,out2]=cfdian(e1,rc1,e2,rc2,jj)
function out=cfdian(e,rc1,rc2,jj)

for i=1:rc1*5
    out1(i)=e*[1-exp(-i/rc1)];
end
for i=1:rc2*5
    out2(i)=e*exp(-i/rc2);
end

res=zeros(1,rc1*5+rc2*5+1);
out=zeros(1,(rc1+rc2)*10+jj);

for i=1:rc1*5
    res(i+1)=out1(i);
end
for i=1:rc2*5
    res(i+rc1*5+1)=out2(i);
end

for i=1:(rc1+rc2)*5
    out(i+jj)=res(i);
    out(i+(rc1+rc2)*5+jj)=-res(i);
end
% t=-1;

% t1=0:0.1:rc1*5;
% out1=e1*[1-exp(-t1/rc1)];
% t2=rc1*5:0.1:(rc1+rc2)*5;
% out2=e2*exp(-t2/rc2);

% subplot 211
% plot(out);
% subplot 212
% plot(res);

% plot(out);
