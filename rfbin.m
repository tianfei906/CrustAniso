function [rfrb,rftb,bazbin,rfnum]=rfbin(rfr,rft,baz,bin)
%bin rf in each bin degree,[rfrb,rftb,bazbin,rfnum]=rfbin(rfr,rft,baz,bin)
num=360/bin;
flag=0;
for i=1:num
    if i==1
        bazindex=(baz<=bin/2)&(baz>=360-bin/2);
        rfcount(i)=sum(bazindex);
    else
        bazindex=(baz<=(bin*i-bin/2))&(baz>=(bin*i-3*bin/2));
    rfcount(i)=sum(bazindex);
    end
    if rfcount(i)~=0
        flag=flag+1;
     bazbin(flag)=(i-1)*bin;
     rfnum(flag)=rfcount(i);
    
     
    rfrb(:,flag)=sum(rfr(:,bazindex),2)/rfcount(i);
    rftb(:,flag)=sum(rft(:,bazindex),2)/rfcount(i);
    end
end
end

