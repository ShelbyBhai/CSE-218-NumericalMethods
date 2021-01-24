function output = GaussJor(A, B)
n = numel(B);

for it=1:n
    T = A(:,it);
    max = 0;
    T=T';
    idx=-1;
    for jt = it:n
        if abs(T(jt))>max
            max = abs(T(jt));
            idx = jt;
        end
    end
    if idx~=-1
        temp = A(idx,:);
        A(idx,:) = A(it,:);
        A(it, :) = temp;
        temp = B(idx);
        B(idx) = B(it);
        B(it) = temp;
    end
    %disp(A);
    for p=(it+1):n
        tem = (B(it).*A(p,it))./A(it, it);
        B(p) = B(p) - tem;
        tem = (A(it,:).*A(p,it))./A(it, it);
        A(p,:) = A(p,:)-tem;
        %fprintf("tem = %f\n", tem);
        %disp(A);
        %disp(B);
    end
end

for it = 1:n
    B(it) = B(it)./A(it,it);
    A(it,:) = A(it,:)./A(it,it);
end

%A
%B

for it = n:-1:2
    for it2 = 1:it-1
        m2 = A(it2, it);
        A(it2,:) = A(it2,:) - A(it,:)*m2;
        B(it2) = B(it2) - B(it)*m2;
        B(it2) = B(it2)./A(it2,it2);
        A(it2,:) = A(it2,:)./A(it2,it2);
        %disp(A);
        %disp(B);
    end
end

%disp(A);
%disp(B);

for it = 1:n
    B(it) = B(it)./A(it,it);
    A(it,:) = A(it,:)./A(it,it);
end

%A
%B
output = B;