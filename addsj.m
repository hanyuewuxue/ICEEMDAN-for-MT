function out = addsj( I,fz,rc1,jj,wz )
%添加充放电三角波程序。I为输入信号，rc1为1/4峰谷距，...
%fz为幅值百分率，jj为间距，wz为充放电三角波添加位置

N=length(I);
asj=zeros(1,N);
big=max(I);   %I中最大值

e=fix(big*fz);    %幅值百分数转换成实际幅值
len=rc1*40+jj;     %单个正负相接充放电波形长度
n=fix(N/len);     %I能添加多少个这样的充放电三角波
% a1=jj*fgj+4;
% d1=fgj-4;

%--------------------------------------方波和三角波对齐
% sj=zeros(1,len);  %保存单个从放电波形
% sj=fix(cfdian(e,rc1,rc1*3,jj));
%--------------------------------------
%--------------------------------------方波和三角波不对齐
sk=fix(cfdian(e,rc1,rc1*3,jj));
sj=zeros(1,len);  %保存单个从放电波形
for i=141:len
    sj(i-140)=sk(i);
end
%--------------------------------------

switch wz  %根据wz判断添加充放电三角波位置
    case 0  %全时间段添加充放电三角波
        for i=1:n
            asj((i*len-len+1):i*len)=sj(1:len);
        end
    case 1  %前段添加充放电三角波
        for i=1:fix(n/3)
            asj((i*len-len+1):i*len)=sj(1:len);
        end
    case 2  %中段添加充放电三角波
        for i=fix(n/3):fix(n/3*2)
            asj((i*len-len+1):i*len)=sj(1:len);
        end
    case 3  %后段添加充放电三角波
        for i=fix(n/3*2):n
            asj((i*len-len+1):i*len)=sj(1:len);
        end
    otherwise
        for i=fix(n/2):n
            asj((i*len-len+1):i*len)=sj(1:len);
        end
end
out=I+asj;
% subplot 211;
% plot(sj);
% subplot 212;
% plot(asj);