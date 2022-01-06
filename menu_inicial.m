%************************************************************************
%  Função menu_inicial
%**********************
%  Menu principal
%************************************************************************
function menu_inicial
    exit = 0;
    choice = 0;
    
    %menu para optar entre escolher um problema ou criar um
    while ~exit
       choice = menu('Equacoes Diferenciais de Primeira Ordem', ...
       'Escolher um problema', 'Criar um problema', 'Sair'); 
       
       switch choice
           case 1
               escolher_problema;
           case 2
               criar_problema;           
           otherwise
               exit = 1;               
       end
    end
    close all;
    fprintf('\nO programa irá terminar\n');
end

