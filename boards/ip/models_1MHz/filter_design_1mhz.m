%% FIR Interpolation Stages
interpolation_single = dsp.SampleRateConverter('InputSampleRate', 1e6,...
    'OutputSampleRate', 256e6,...
    'Bandwidth', 950e3,...
    'OutputRateTolerance', 0,...
    'StopbandAttenuation', 100);

interpolation_ssr = dsp.FIRHalfbandInterpolator(...
    'Specification', 'Coefficients',...
    'Numerator', [5, 0, -17, 0, 44, 0, -96, 0, 187, 0, -335, 0, 565, 0, -906, 0, 1401, 0, -2112, 0, 3145, 0, -4723, 0, 7415, 0, -13331, 0, 41526, 65536, 41526, 0, -13331, 0, 7415, 0, -4723, 0, 3145, 0, -2112, 0, 1401, 0, -906, 0, 565, 0, -335, 0, 187, 0, -96, 0, 44, 0, -17, 0, 5]/65536, ...
    'SampleRate', 256e6);

interpolation_dac_2 = dsp.FIRHalfbandInterpolator(...
    'Specification', 'Coefficients',...
    'Numerator', [5, 0, -17, 0, 44, 0, -96, 0, 187, 0, -335, 0, 565, 0, -906, 0, 1401, 0, -2112, 0, 3145, 0, -4723, 0, 7415, 0, -13331, 0, 41526, 65536, 41526, 0, -13331, 0, 7415, 0, -4723, 0, 3145, 0, -2112, 0, 1401, 0, -906, 0, 565, 0, -335, 0, 187, 0, -96, 0, 44, 0, -17, 0, 5]/65536, ...
    'SampleRate', 512e6);

interpolation_dac_1 = dsp.FIRHalfbandInterpolator(...
    'Specification', 'Coefficients',...
    'Numerator', [-12, 0, 84, 0, -337, 0, 1008, 0, -2693, 0, 10142, 16384, 10142, 0, -2693, 0, 1008, 0, -337, 0, 84, 0, -12]/16384, ...
    'SampleRate', 1024e6);

interpolation_dac_0 = dsp.FIRHalfbandInterpolator(...
    'Specification', 'Coefficients',...
    'Numerator', [-6, 0, 54, 0, -254, 0, 1230, 2048, 1230, 0, -254, 0, 54, 0, -6]/2048, ...
    'SampleRate', 2048e6);

interpolation_stages = dsp.FilterCascade(...
    interpolation_single.getFilters.Stage1, ...
    interpolation_single.getFilters.Stage2, ...
    interpolation_single.getFilters.Stage3, ...
    interpolation_single.getFilters.Stage4, ...
    interpolation_ssr, ...
    interpolation_dac_2, ...
    interpolation_dac_1, ...
    interpolation_dac_0);

%% FIR Decimation Stages
decimation_adc_0 = dsp.FIRHalfbandDecimator(...
    'Specification', 'Coefficients',...
    'Numerator', [-6, 0, 54, 0, -254, 0, 1230, 2048, 1230, 0, -254, 0, 54, 0, -6]/4096,...
    'SampleRate', 4096e6);

decimation_adc_1 = dsp.FIRHalfbandDecimator(...
    'Specification', 'Coefficients',...
    'Numerator', [-12, 0, 84, 0, -337, 0, 1008, 0, -2693, 0, 10142, 16384, 10142, 0, -2693, 0, 1008, 0, -337, 0, 84, 0, -12]/32768,...
    'SampleRate', 2048e6);

decimation_adc_2 = dsp.FIRHalfbandDecimator(...
    'Specification', 'Coefficients',...
    'Numerator', [5, 0, -17, 0, 44, 0, -96, 0, 187, 0, -335, 0, 565, 0, -906, 0, 1401, 0, -2112, 0, 3145, 0, -4723, 0, 7415, 0, -13331, 0, 41526, 65536, 41526, 0, -13331, 0, 7415, 0, -4723, 0, 3145, 0, -2112, 0, 1401, 0, -906, 0, 565, 0, -335, 0, 187, 0, -96, 0, 44, 0, -17, 0, 5]/131072,...
    'SampleRate', 1024e6);

decimation_ssr = dsp.FIRHalfbandDecimator(...
    'Specification', 'Coefficients',...
    'Numerator', [5, 0, -17, 0, 44, 0, -96, 0, 187, 0, -335, 0, 565, 0, -906, 0, 1401, 0, -2112, 0, 3145, 0, -4723, 0, 7415, 0, -13331, 0, 41526, 65536, 41526, 0, -13331, 0, 7415, 0, -4723, 0, 3145, 0, -2112, 0, 1401, 0, -906, 0, 565, 0, -335, 0, 187, 0, -96, 0, 44, 0, -17, 0, 5]/131072,...
    'SampleRate', 512e6);

decimation_single = dsp.FIRHalfbandDecimator(...
    'Specification', 'Coefficients',...
    'Numerator', [5, 0, -17, 0, 44, 0, -96, 0, 187, 0, -335, 0, 565, 0, -906, 0, 1401, 0, -2112, 0, 3145, 0, -4723, 0, 7415, 0, -13331, 0, 41526, 65536, 41526, 0, -13331, 0, 7415, 0, -4723, 0, 3145, 0, -2112, 0, 1401, 0, -906, 0, 565, 0, -335, 0, 187, 0, -96, 0, 44, 0, -17, 0, 5]/131072,...
    'SampleRate', 256e6);

decimation_unique = dsp.SampleRateConverter('InputSampleRate', 2e6,...
    'OutputSampleRate', 1e6,...
    'Bandwidth', 950e3,...
    'OutputRateTolerance', 0,...
    'StopbandAttenuation', 100);

decimation_stages = dsp.FilterCascade(...
    decimation_adc_0, ...
    decimation_adc_1, ...
    decimation_adc_2, ...
    decimation_ssr, ...
    decimation_single, ...
    decimation_single, ...
    decimation_single, ...
    decimation_single, ...
    decimation_single, ...
    decimation_single, ...
    decimation_single);