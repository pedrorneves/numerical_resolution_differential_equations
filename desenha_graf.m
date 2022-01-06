%************************************************************************
%  Função desenha_graf
%**********************
%  Desenha o gráfico pedido
%  Recebe a escala de tempo, as duas funcoes a representar, o titulo, as
%  legendas dos eixos, as legendas das funcoes e as marcas a usar na
%  representacao de cada uma
%************************************************************************
function desenha_graf(x, y, sol_exata, texto, strx, stry, legend1, legend2, marca1, marca2)
    
    %grafico
    plot(x, y, marca1, x, sol_exata, marca2);
    %titulo e legendas
    title(texto);
    xlabel(strx);
    ylabel(stry);
    legend(legend1, legend2);
    grid on;

end