function out = addsj( I,fz,rc1,jj,wz )
%��ӳ�ŵ����ǲ�����IΪ�����źţ�rc1Ϊ1/4��Ⱦ࣬...
%fzΪ��ֵ�ٷ��ʣ�jjΪ��࣬wzΪ��ŵ����ǲ����λ��

N=length(I);
asj=zeros(1,N);
big=max(I);   %I�����ֵ

e=fix(big*fz);    %��ֵ�ٷ���ת����ʵ�ʷ�ֵ
len=rc1*40+jj;     %����������ӳ�ŵ粨�γ���
n=fix(N/len);     %I����Ӷ��ٸ������ĳ�ŵ����ǲ�
% a1=jj*fgj+4;
% d1=fgj-4;

%--------------------------------------���������ǲ�����
% sj=zeros(1,len);  %���浥���ӷŵ粨��
% sj=fix(cfdian(e,rc1,rc1*3,jj));
%--------------------------------------
%--------------------------------------���������ǲ�������
sk=fix(cfdian(e,rc1,rc1*3,jj));
sj=zeros(1,len);  %���浥���ӷŵ粨��
for i=141:len
    sj(i-140)=sk(i);
end
%--------------------------------------

switch wz  %����wz�ж���ӳ�ŵ����ǲ�λ��
    case 0  %ȫʱ�����ӳ�ŵ����ǲ�
        for i=1:n
            asj((i*len-len+1):i*len)=sj(1:len);
        end
    case 1  %ǰ����ӳ�ŵ����ǲ�
        for i=1:fix(n/3)
            asj((i*len-len+1):i*len)=sj(1:len);
        end
    case 2  %�ж���ӳ�ŵ����ǲ�
        for i=fix(n/3):fix(n/3*2)
            asj((i*len-len+1):i*len)=sj(1:len);
        end
    case 3  %�����ӳ�ŵ����ǲ�
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