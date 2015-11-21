function f = a7d1_gen(~)
    CHANNELS = 8;
    frequency = 50;
    samplesNumber = 500;
    dt = 0.001;
    noiseAmplitude = 0.5;
    
    x = dt * (0: samplesNumber-1);
    f = zeros(CHANNELS, samplesNumber);
    digNumber = randi(CHANNELS);
    for i = 1:CHANNELS
        if i == digNumber
            f(i, :) = (square(2*pi*frequency*x) + 1) / 2;
        else
            f(i, :) = sin(2*pi*frequency*x + pi*rand) + noiseAmplitude * (rand(size(x)) - 0.5);
        end
        subplot(CHANNELS, 1, i);
        plot(x, f(i, :))
    end
end