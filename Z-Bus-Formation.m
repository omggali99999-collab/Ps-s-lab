clc;
clear all;

% from  to  r   x
zdata = [0 1 0 1
         0 2 0 0.8
         1 2 0 0.4
         1 3 0 0.2
         2 3 0 0.2
         3 4 0 0.08];

nl = zdata(:,1);
nr = zdata(:,2);
R = zdata(:,3);
X = zdata(:,4);

nbr = length(zdata(:,1));
nbus = max(max(nl),max(nr));

Z = R + j*X;
y = ones(nbr,1)./Z;
Ybus = zeros(nbus,nbus);

for k = 1:nbr
    if nl(k)>0 & nr(k)>0
        Ybus(nl(k),nr(k)) = Ybus(nl(k),nr(k))-y(k);
        Ybus(nr(k),nl(k)) = Ybus(nl(k),nr(k));
    end
end

for n = 1:nbus
    for k = 1:nbr
        if nl(k)==n | nr(k)==n
            Ybus(n,n) = Ybus(n,n)+y(k);
        else
        end
    end
end

Zbus = inv(Ybus)
