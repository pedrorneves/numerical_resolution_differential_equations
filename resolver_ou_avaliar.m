%************************************************************************
%  Função resolver_ou_avaliar
%*****************************
%  Pede a escolha da acao a tomar sobre o problema
%  Devolve 1 se escolheu resolver, 2 se escolheu a solucao exata,
%  3 se escolheu avaliar
%************************************************************************
function action = resolver_ou_avaliar
    exit = 0;
    choice = 0;
    action = 0;
    
    %menu para escolha da acao
    while ~exit
        choice = menu('Novo Problema', 'Resolver equacao diferencial', ...
           'Apresentar solucao exata', 'Avaliar influencia do passo', ...
           'Voltar'); 
       
        switch choice
            %resolver pelos metodos
            case 1
                fprintf('\nresolver equacao diferencial\n');
                action = 1;
                exit = 1;
               
            %resolver exatamente    
            case 2
                fprintf('\napresentar solucao exata\n');
                action = 2;
                exit = 1;
               
            %avaliar influencia do passo    
            case 3
                fprintf('\navaliar influencia do passo\n');
                action = 3;
                exit = 1;
               
            otherwise
                exit = 1;               
        end
    end
end

