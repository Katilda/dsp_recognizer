function Yn = smoothing(matrix,kwindow)
%  функция простейшего сглаживания
%       matrix - входная функция, матрица данных
%                   подлежащих сглаживанию
%       kwindow - ширина окна
%       Yn - выходная сглаженная функция

% параметры, которые необходимо вычислить из матрицы
    CHANNELS = 8;  % число входных сигналов
    samplesNumber = 500;  %длина одного сигнала
    
    shift = 0; %сдвиг "окна" по сигналу
    B = 0;    %переменная для хранения элемента матрицы
    sumB = 0; %переменная для хранения суммы "окна"

for i = 1:CHANNELS  %для каждого сигнала
   
    for j = kwindow:samplesNumber %"проходим окном" по всему сигналу
                                  % на отрезке выполняем
        shift = j - kwindow;      %вычисляем первый элемент "окна"
        for b = shift:j            %проходимся по элементам в рамках "окна"
            B = matrix(i,b);   %достаём элемент матрицы
            sumB = sumB + B;   %суммируем в рамках "окна"
        end
        Yn(i,j) = sumB/kwindow; %Усреднённое значение сглаженной функции
        sumB = 0;  %обнуляем сумму элементов в рамках "окна"
    end
end
