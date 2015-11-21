function f = a7d1_gen(~)
    CHANNELS = 8;
    frequency = 50;
    samplesNumber = 500;
    dt = 0.001;
    noiseAmplitude = 0.3;
    
    x = dt * (0: samplesNumber-1);
    f = zeros(CHANNELS, samplesNumber);
    digNumber = randi(CHANNELS);
    for i = 1:CHANNELS
        noise = noiseAmplitude * (rand(size(x)) - 0.5);
        if i == digNumber
            signal = (square(2*pi*frequency*x) + 1) / 2 + noise;
        else
            signal = sin(2*pi*frequency*x + pi*rand) + noise;
        end
        f(i, :) = signal + noise;
        subplot(CHANNELS, 1, i);
        plot(x, f(i, :))
    end
end