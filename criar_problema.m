%************************************************************************
%  Função criar_problema
%************************
%  Cria os dados de um novo problema
%************************************************************************
function criar_problema

    exit = 0;
   
    %pedido dos dados do novo problema
    valores = inputdlg({'Funcao, f(t, y)'; 'Condicao inicial, y(ti)'; ...
        'Inicio do intervalo, ti'; 'Fim do intervalo, tf'}, ...
        'Novo Problema', 1);    
    str = strcat('@(t,y)',valores{1});
    f = str2func(str);
    yti = str2num(valores{2});
    ti = str2num(valores{3});
    tf = str2num(valores{4});
    
    %escolha da acao a tomar sobre o novo problema
    while ~exit        
        action = resolver_ou_avaliar;    
        switch action
            %resolver a equacao
            case 1                
                resolver_equacao(f, yti, ti, tf);
            
            %apresentar solucao exata   
            case 2               
                solucao_exata(f, yti, ti, tf);                
                                
            %avaliar influencia do passo    
            case 3
                estuda_passo(f, yti, ti, tf)
                          
            otherwise
                exit = 1;
        end   
    end       
end