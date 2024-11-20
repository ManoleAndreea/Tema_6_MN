% Tema 6 MN
% Manole Andreea - Cristina 321 AA

%   Adaptati algoritmul Crout pentru o matrice A superior Hessenberg.
% Ilustrati functionarea printr un exemplu. Verificati corectitudinea rez.

n=10;
H=randn(n);
for i=3:n
    for j = 1:(i-2)
        H(i, j)=0;
    end
end

disp('Matricea Hessenberg superioră generată:');
disp(H);

% Am ales o matrice de n=10 generata randn, pe care am setat manual
% elementele de sub subdiagonala inferioara cu 0, astfel formand o matrice
% superioara Hessenberg



L=zeros(n, n);
U=eye(n);

for i=1:n
    L(i, i)=H(i, i);  
    if i<n
        L(i+1, i)=H(i+1, i); 
    end
end

for i=1:(n-1)
    for j=(i+1):n
        U(i, j)=H(i, j);  
    end
end

% Am copiat in L si U elementele din matricea H, tinand cont de faptul ca L
% va fi o matrice inferior bidiagonala si U o matrice superior
% triunghiulara unitate, pentru a nu suprascrie matricea H in algoritmul
% Crout

for j=2:(n)
    U(1, j)=H(1, j)/H(1, 1);
end
for k=2:n
    L(k, k)=H(k, k)-L(k, k-1)*U(k-1, k);
    if k<n
        for j=(k+1):n
            U(k, j)=(H(k, j)-L(k, k-1)*U(k-1, j))/L(k, k);
        end
    end
end

% Am calculat factorizarea L*U prin intermediul algoritmului Crout, tinand
% cont ca matricea H este superioara Hessenberg

LU=L*U;

format long;

disp('Matricea originală H:');
disp(H);

disp('Matricea obținută prin produsul L * U:');
disp(LU);
norm(H-LU)

if norm(H-LU)<1e-10
    disp('Algoritmul este corect');
else
    disp('Algoritmul nu este corect');
end