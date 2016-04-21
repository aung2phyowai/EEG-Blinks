function s = createBlinksStructure()
% Return an empty blink structure
s  = struct('fileName', NaN, ...
            'srate', NaN, ...
            'subjectID', NaN, ...
            'experiment', NaN, ...
            'uniqueName', NaN, ...
            'task', NaN, ...
            'startTime', NaN, ...
            'type', NaN, ...
            'componentIndices', NaN, ...
            'blinkComponents', NaN, ...
            'blinkInfo', NaN, ...
            'blinkPositions', NaN, ...
            'numberBlinks', NaN, ...
            'goodBlinks', NaN, ...
            'blinkAmpRatio', NaN, ...
            'usedComponent', NaN, ...
            'status', NaN);