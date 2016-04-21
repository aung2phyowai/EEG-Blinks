function [] = showBlinkSummary(blinkSummary, individual)
%% Displays the blink summary statistics
%
% Parameters:
%    blinkSummary - structure containing statistics for individual blinks
%    individual -  show (1) or don't show (0) individual data file statistics
%    

%% Define columns
[~,  d] = getSummaryHeaders();


%% Show the statistics for the individual data files
if individual
    for n = 1:length(blinkSummary.names)
        dataName = blinkSummary.names{n};
        [~, myName] = fileparts(dataName);
        dataStart = blinkSummary.dataStarts(n);
        dataEnd = blinkSummary.dataEnds(n);
        if dataStart == 0
            continue;
        end
        data = blinkSummary.data(dataStart:dataEnd, :);
        showOverview(myName, data);
        showDurations(myName, data);
        showAmplitudeVelocityRatios(myName, data);
    end
end
%% Now show summaries
showOverview(blinkSummary.collection, blinkSummary.data);
showDurations(blinkSummary.collection, blinkSummary.data);
showAmplitudeVelocityRatios(blinkSummary.collection, blinkSummary.data);

%% Individual display functions
function [] = showOverview(dataName, data)
    fprintf('Blink summary for %s\n', dataName);
    badMask = data(:, d.BADMASK);
    fprintf('Total blinks: %g\n', length(badMask));
    fprintf('Total bad blinks: %g\n', sum(badMask));
end

function [] =  showDurations(dataName, data)
    badMask = logical(round(data(:, d.BADMASK)));
    zeroDurations = data(:, d.ZERODUR);
    zeroDurations(zeroDurations < 0) = NaN;
    tentDurations = data(:, d.TENTDUR);
    tentDurations(tentDurations < 0) = NaN;
    baseHalfDurations = data(:, d.BASEHALFDUR);
    baseHalfDurations(baseHalfDurations < 0) = NaN;
    zeroHalfDurations = data(:, d.ZEROHALFDUR);
    zeroHalfDurations(zeroHalfDurations < 0) = NaN;
    
    fprintf('Blink zero durations: %g mean %g SD  median %g\n', ...
        nanmean(zeroDurations), nanstd(zeroDurations), ...
        nanmedian(zeroDurations));
    fprintf('Tent durations: %g mean %g SD median %g\n', ...
        nanmean(tentDurations), nanstd(tentDurations), nanmedian(tentDurations)); 
    fprintf('Base half durations: %g mean %g SD  median %g\n', ...
        nanmean(baseHalfDurations), nanstd(baseHalfDurations), ...
        nanmedian(baseHalfDurations)); 
    fprintf('Zero half durations: %g mean %g SD  median %g\n', ...
        nanmean(zeroHalfDurations), nanstd(zeroHalfDurations), ...
        nanmedian(zeroHalfDurations)); 
%% Threshhold the durations for plotting
    durationThreshhold = 1.0;
    zeroDurations(zeroDurations > durationThreshhold) = durationThreshhold;
    tentDurations(tentDurations > durationThreshhold) = durationThreshhold;
    zeroHalfDurations(zeroHalfDurations > durationThreshhold) = durationThreshhold;
    baseHalfDurations(baseHalfDurations > durationThreshhold) = durationThreshhold;    
    
%% Plot the tent versus blink durations
    [m, b, R2] = getLinearEquation(zeroDurations(~badMask), ...
                                   tentDurations(~badMask));
    theTitle = {[dataName '(bad/total = ' ...
        num2str(sum(badMask)) '/' num2str(length(badMask)) ')'], ...
        ['[y = ' num2str(m) '*x + ' num2str(b) ', R2 = ' num2str(R2) ']']};
    figure('Color', [1, 1, 1]) 
   
    hold on
    plot(zeroDurations(badMask), tentDurations(badMask), 'ro')
    plot(zeroDurations(~badMask), tentDurations(~badMask), 'kx')
    xLim = get(gca, 'XLim');
    plot([0, xLim(2)], [0, 0], 'Color', [0.8, 0.8, 0.8])
    plot([0, xLim(2)], [0, xLim(2)], 'Color', [0.8, 0.8, 0.8])
    xlabel('Blink duration from zero (s)')
    ylabel('Tent duration (s)')
    title(theTitle, 'Interpreter', 'None');
    legend('corr > 0.95', 'corr < 0.95', 'Location', 'NorthWest')
    hold off
    box on
    
    %% Plot the tent versus blink durations
    [m, b, R2] = getLinearEquation(zeroDurations(~badMask), ...
                                   zeroHalfDurations(~badMask));
    theTitle = {[dataName '(bad/total = ' ...
        num2str(sum(badMask)) '/' num2str(length(badMask)) ')'], ...
        ['[y = ' num2str(m) '*x + ' num2str(b) ', R2 = ' num2str(R2) ']']};
    figure('Color', [1, 1, 1]) 
    
    hold on
    plot(zeroDurations(badMask), zeroHalfDurations(badMask), 'ro')
    plot(zeroDurations(~badMask),zeroHalfDurations(~badMask), 'kx')
    xLim = get(gca, 'XLim');
    plot([0, xLim(2)], [0, 0], 'Color', [0.8, 0.8, 0.8])
    plot([0, xLim(2)], [0, xLim(2)], 'Color', [0.8, 0.8, 0.8])
    xlabel('Duration from zero (s)')
    ylabel('Half-height duration from zero (s)')
    title(theTitle, 'Interpreter', 'None');
    legend('corr < 0.95', 'corr > 0.95', 'Location', 'NorthWest')
    hold off
    box on
    
    %% Plot the base versus zero durations
    [m, b, R2] = getLinearEquation(zeroHalfDurations(~badMask), ...
                                   baseHalfDurations(~badMask));
    theTitle = {[dataName '(bad/total = ' ...
        num2str(sum(badMask)) '/' num2str(length(badMask)) ')'], ...
        ['[y = ' num2str(m) '*x + ' num2str(b) ', R2 = ' num2str(R2) ']']};
    figure('Color', [1, 1, 1]) 
 
    hold on
    plot(zeroHalfDurations(badMask), baseHalfDurations(badMask), 'ro')
    plot(zeroHalfDurations(~badMask), baseHalfDurations(~badMask), 'kx')
    xLim = get(gca, 'XLim');
    plot([0, xLim(2)], [0, 0], 'Color', [0.8, 0.8, 0.8])
    plot([0, xLim(2)], [0, xLim(2)], 'Color', [0.8, 0.8, 0.8])
    xlabel('Half height duration from zero (s)')
    ylabel('Half-height duration from base (s)')
    title(theTitle, 'Interpreter', 'None');
    legend('corr < 0.95', 'corr > 0.95', 'Location', 'SouthEast')
    hold off
    box on
    
    %% Show overlaid histograms of durations
    numberBins = round(max(10, sqrt(length(zeroDurations))));
    binLimit = durationThreshhold/numberBins;
    bins = binLimit*(0:numberBins); 
    [hZero, fZero] = hist(zeroDurations, bins);
    [hTent, fTent] = hist(tentDurations, bins);
    [hHalfBase, fHalfBase] = hist(baseHalfDurations, bins);
    [hHalfZero, fHalfZero] = hist(zeroHalfDurations, bins);
    theTitle = [dataName ' Comparison of duration methods'];
    figure('Color', [1, 1, 1], 'Name', theTitle)
    hold on
    plot(fZero, hZero/length(zeroDurations), 'k-', 'LineWidth', 2)
    plot(fTent, hTent/length(tentDurations), 'r-', 'LineWidth', 2)
    plot(fHalfZero, hHalfZero/length(zeroHalfDurations), 'g-', 'LineWidth', 2)
    plot(fHalfBase, hHalfBase/length(baseHalfDurations), 'b-', 'LineWidth', 2)
    plot(fTent, hTent/length(tentDurations), 'r-', 'LineWidth', 2)
    xlabel('Blink duration (s)')
    ylabel('Fraction of occurences')
    legend('Zero', 'Tent', 'HalfZero', 'HalfBase')
    title(theTitle, 'Interpreter', 'None')
end

function [] = showAmplitudeVelocityRatios(dataName, data)
        
    %% Output duration statistics
    badMask = logical(round(data(:, d.BADMASK)));
    pAVRZero = data(:, d.pAVRZERO);
    pAVRTent = data(:, d.pAVRTENT);
    pAVRBase = data(:, d.pAVRBASE);
    nAVRZero = data(:, d.nAVRZERO);
    nAVRTent = data(:, d.nAVRTENT);
    nAVRBase = data(:, d.nAVRBASE);
    
    fprintf('Positive AVR zero: %g mean %g SD  median %g\n', ...
        nanmean(pAVRZero), nanstd(pAVRZero), nanmedian(pAVRZero));
    fprintf('Positive AVR tent: %g mean %g SD median %g\n', ...
        nanmean(pAVRTent), std(pAVRTent), nanmedian(pAVRTent)); 
    fprintf('Positive AVR base: %g mean %g SD  median %g\n', ...
        nanmean(pAVRBase), nanstd(pAVRBase), nanmedian(pAVRBase));
    fprintf('Negative AVR zero: %g mean %g SD  median %g\n', ...
        nanmean(nAVRZero), nanstd(nAVRZero), nanmedian(nAVRZero));
    fprintf('Negative AVR tent: %g mean %g SD median %g\n', ...
        nanmean(nAVRTent), std(nAVRTent), nanmedian(nAVRTent)); 
    fprintf('Negative AVR base: %g mean %g SD  median %g\n', ...
        nanmean(nAVRBase), nanstd(nAVRBase), nanmedian(nAVRBase));
    
%% Threshhold the durations for plotting
    pAVRThreshhold = 30;
    pAVRZero(pAVRZero > pAVRThreshhold) = pAVRThreshhold;
    pAVRTent(pAVRTent > pAVRThreshhold) = pAVRThreshhold;
    pAVRBase(pAVRBase > pAVRThreshhold) = pAVRThreshhold;
    
    nAVRThreshhold = 50;
    nAVRZero(nAVRZero > nAVRThreshhold) = nAVRThreshhold;
    nAVRTent(nAVRTent > nAVRThreshhold) = nAVRThreshhold;
    nAVRBase(nAVRBase > nAVRThreshhold) = nAVRThreshhold;
       
    %% Plot blink vs tent pAVR
    [m, b, R2] = getLinearEquation(pAVRZero, pAVRTent);
    theTitle = {[dataName '(bad/total = ' ...
        num2str(sum(badMask)) '/' num2str(length(badMask)) ')'], ...
        ['[y = ' num2str(m) '*x + ' num2str(b) ', R2 = ' num2str(R2) ']']};
    
    figure('Color', [1, 1, 1]) 
    hold on
    plot(pAVRZero(badMask), pAVRTent(badMask), 'ro')
    plot(pAVRZero(~badMask), pAVRTent(~badMask), 'kx')
    xLim = get(gca, 'XLim');
    plot([0, xLim(2)], [0, 0], 'Color', [0.8, 0.8, 0.8])
    plot([0, xLim(2)], [0, xLim(2)], 'Color', [0.8, 0.8, 0.8])
    xlabel('Zero pAVR (10 ms)')
    ylabel('Tent pAVR (s)')
    title(theTitle, 'Interpreter', 'None');
    legend('corr < 0.95', 'corr > 0.95')
    hold off
    box on
    
    %% Plot the blink pAVR versus extended pAVR
    [m, b, R2] = getLinearEquation(pAVRZero(~badMask), ...
                                   pAVRBase(~badMask));
    theTitle = {[dataName '(bad/total = ' ...
        num2str(sum(badMask)) '/' num2str(length(badMask)) ')'], ...
        ['[y = ' num2str(m) '*x + ' num2str(b) ', R2 = ' num2str(R2) ']']};
    figure('Color', [1, 1, 1]) 
    hold on
    plot(pAVRZero(badMask), pAVRBase(badMask), 'ro')
    plot(pAVRZero(~badMask), pAVRBase(~badMask), 'kx')
    xLim = get(gca, 'XLim');
    plot([0, xLim(2)], [0, 0], 'Color', [0.8, 0.8, 0.8])
    plot([0, xLim(2)], [0, xLim(2)], 'Color', [0.8, 0.8, 0.8])
    xlabel('Zero pAVR (10 ms)')
    ylabel('Base pAVR (10 ms)')
    title(theTitle, 'Interpreter', 'None');
    legend('corr < 0.95', 'corr > 0.95')
    hold off
    box on
    
    %% Show overlaid histograms of pAVRs
    numberBins = round(max(10, sqrt(length(pAVRZero))));
    binLimit = pAVRThreshhold/numberBins;
    bins = binLimit*(0:numberBins); 
    [hZero, fZero] = hist(pAVRZero, bins);
    [hTent, fTent] = hist(pAVRTent, bins);
    [hBase, fBase] = hist(pAVRBase, bins);
    theTitle = [dataName ' Comparison of pAPR methods'];
    figure('Color', [1, 1, 1], 'Name', theTitle)
    hold on
    plot(fZero, hZero/length(pAVRZero), 'k-', 'LineWidth', 2)
    plot(fTent, hTent/length(pAVRTent), 'r-', 'LineWidth', 2)
    plot(fBase, hBase/length(pAVRBase), 'b-', 'LineWidth', 2)

    xlabel('Positive amplitude velocity ratio (10 ms)')
    ylabel('Fraction of occurences')
    legend('Zero', 'Tent', 'Base')
    title(theTitle, 'Interpreter', 'None')
    box on
    
    %% Plot blink vs tent nAVR
    [m, b, R2] = getLinearEquation(nAVRZero, nAVRTent);
    theTitle = {[dataName '(bad/total = ' ...
        num2str(sum(badMask)) '/' num2str(length(badMask)) ')'], ...
        ['[y = ' num2str(m) '*x + ' num2str(b) ', R2 = ' num2str(R2) ']']};
    
    figure('Color', [1, 1, 1]) 
    hold on
    plot(nAVRZero(badMask), nAVRTent(badMask), 'ro')
    plot(nAVRZero(~badMask), nAVRTent(~badMask), 'kx')
    xLim = get(gca, 'XLim');
    plot([0, xLim(2)], [0, 0], 'Color', [0.8, 0.8, 0.8])
    plot([0, xLim(2)], [0, xLim(2)], 'Color', [0.8, 0.8, 0.8])
    xlabel('Zero nAVR (10 ms)')
    ylabel('Tent nAVR (s)')
    title(theTitle, 'Interpreter', 'None');
    legend('corr < 0.95', 'corr > 0.95')
    hold off
    box on
    
    %% Plot the blink nAVR versus extended nAVR
    [m, b, R2] = getLinearEquation(nAVRZero(~badMask), ...
                                   nAVRBase(~badMask));
    theTitle = {[dataName '(bad/total = ' ...
        num2str(sum(badMask)) '/' num2str(length(badMask)) ')'], ...
        ['[y = ' num2str(m) '*x + ' num2str(b) ', R2 = ' num2str(R2) ']']};
    figure('Color', [1, 1, 1]) 
    hold on
    plot(nAVRZero(badMask), nAVRBase(badMask), 'ro')
    plot(nAVRZero(~badMask), nAVRBase(~badMask), 'kx')
    xLim = get(gca, 'XLim');
    plot([0, xLim(2)], [0, 0], 'Color', [0.8, 0.8, 0.8])
    plot([0, xLim(2)], [0, xLim(2)], 'Color', [0.8, 0.8, 0.8])
    xlabel('Zero nAVR (10 ms)')
    ylabel('Base nAVR (10 ms)')
    title(theTitle, 'Interpreter', 'None');
    legend('corr < 0.95', 'corr > 0.95')
    hold off
    box on
    
    %% Show overlaid histograms of nAVRs
    numberBins = round(max(10, sqrt(length(nAVRZero))));
    binLimit = nAVRThreshhold/numberBins;
    bins = binLimit*(0:numberBins); 
    [hZero, fZero] = hist(nAVRZero, bins);
    [hTent, fTent] = hist(nAVRTent, bins);
    [hBase, fBase] = hist(nAVRBase, bins);
    theTitle = [dataName ' Comparison of nAPR methods'];
    figure('Color', [1, 1, 1], 'Name', theTitle)
    hold on
    plot(fZero, hZero/length(nAVRZero), 'k-', 'LineWidth', 2)
     plot(fTent, hTent/length(nAVRTent), 'r-', 'LineWidth', 2)
    plot(fBase, hBase/length(nAVRBase), 'b-', 'LineWidth', 2)   
    xlabel('Negative amplitude velocity ratio (10 ms)')
    ylabel('Fraction of occurences')
    legend('Zero', 'Tent',  'Base')
    title(theTitle, 'Interpreter', 'None')
    box on
end  

end