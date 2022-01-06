%************************************************************************
%  Fun��o solucao_eq
%********************
%  Resolve a equacao sem utilizar os metodos aqui definidos, atrav�s da
%  funcao dsolve
%  Recebe os dados da equacao
%  Devolve a equacao da solucao
%************************************************************************
function sol_eq = solucao_eq(f, yti, ti)
        
    syms y(t);
    %equacao
    equation = diff(y,t) == f(t,y);
    %condicao inicial
    in_condition = y(ti) == yti;
    %equacao da solucao
    aux = char(dsolve(equation, in_condition));
    sol_eq = str2func(strcat('@(t,y)',aux));
   
end

