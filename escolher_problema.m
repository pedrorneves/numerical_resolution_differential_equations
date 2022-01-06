%************************************************************************
%  Função escolher_problema
%***************************
%  Menu para escolha de um problema pre-existente
%************************************************************************
function escolher_problema
    exit = 0;    
    choice = 0;
    
    %menu para escolha do problema
    while ~exit
       choice = menu('Escolha o problema', 'y'' = -9y', ...
           'y'' = -y + sin(t)', 'Propagacao de doenca', 'Voltar');       
        switch choice 
           
            %equacao -9y
            case 1
                exit2 = 0;
                fprintf('\ny'' = -9y\n');               
                f = @(t, y) -9*y;
                while ~exit2                                      
                    action = resolver_ou_avaliar;                   
                    switch action                       
                        %resolver a equacao
                        case 1
                            resolver_equacao(f, 1/2, 0, 1);                           
                            
                        %apresentar solucao exata
                        case 2
                            solucao_exata(f, 1/2, 0, 1);                                                       
                            
                        %avaliar influencia do passo 
                        case 3
                            estuda_passo(f, 1/2, 0, 1)
                            
                        otherwise
                            exit2 = 1;
                    end                    
                end
               
            %equacao -y+sin(t)          
            case 2
                exit2 = 0;
                fprintf('\ny'' = -y + sin(t)\n');                            
                f = @(t, y) -y+sin(t); 
                while ~exit2                    
                    action = resolver_ou_avaliar;                    
                    switch action
                        %resolver a equacao 
                        case 1 
                            resolver_equacao(f, 1, 0, 2);
                       
                        %apresentar solucao exata     
                        case 2 
                            solucao_exata(f, 1, 0, 2);
                       
                        %avaliar influencia do passo     
                        case 3
                            estuda_passo(f, 1, 0, 2)

                        otherwise
                            exit2 = 1;                    
                    end                                
               end
               
          %problema doenca              
           case 3
               fprintf('\npropagacao de doenca\n');
               fprintf('\ny'' = -R*y*(Ni+1-y)\n');
               prop_doenca;             
           
           otherwise
               exit = 1;               
       end
    end
end
