%************************************************************************
%  Função calc_passo_RK3
%************************
%  Calcula os valores possiveis do passo para o metodo RK3, para que o 
%  metodo seja estavel
%  Recebe os dados da equacao
%  Devolve o intervalo de valores do passo possivel e o numero minimo de
%  intervalos
%************************************************************************
function passo = calc_passo_RK3(f, yti, ti, tf)
        
    syms y

    %a=lambda ou seja, coeficiente do y
    aux = coeffs(f, y);
    
    %tem apenas parcela de y
    if (size(aux)==1)
        a = aux(1,1);
    end
    %tem parcela de y e parcela independente
    if(size(aux,2)==2)
        a = aux(1,2);
    end
    
    %intervalo de valores depende de se a e positivo ou negativo
    if (a<0)
        passo_i = 0;
        passo_f = -2.51/a;
    end
    if (a>0)
        passo_i = -2.51/a;
        passo_f = 0;
    end

    %numero de intervalos minimo possivel
    n = floor(abs((tf-ti)/(-2.51/a)));   
    if (frac(abs((tf-ti)/(-2.51/a)))~=0)
        n = n + 1;
    end
       
    passo = [passo_i, passo_f, n];
    
end