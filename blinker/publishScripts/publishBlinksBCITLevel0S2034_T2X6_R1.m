

%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2853888);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2034_T2X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M100_S2034_X6_CA_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 104;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2853888);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2034_T2X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M100_S2034_X6_CA_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 105;
endBatch = 208;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2853888);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2034_T2X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M100_S2034_X6_CA_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 209;
endBatch = 312;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2853888);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2034_T2X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M100_S2034_X6_CA_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 313;
endBatch = 416;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2853888);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2034_T2X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M100_S2034_X6_CA_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 417;
endBatch = 520;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2853888);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2034_T2X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M100_S2034_X6_CA_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 521;
endBatch = 621;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;
