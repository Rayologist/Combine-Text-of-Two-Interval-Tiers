procedure combineText: .fromNumOfTier, .toNumOfTier
    numOfIntervals = Get number of intervals: .toNumOfTier
    count = 1

    for numOfInterval from 1 to numOfIntervals
        label$ = Get label of interval: .toNumOfTier, numOfInterval
        if index_regex(label$, "\w")
            startTime = Get start time of interval: .toNumOfTier, numOfInterval
            startTime += 0.01 
            numOfIntervalOfintervalToCombine = Get interval at time: .fromNumOfTier, startTime
            labelOfIntervalToCombine$ = Get label of interval: .fromNumOfTier, numOfIntervalOfintervalToCombine
            if index_regex(labelOfIntervalToCombine$, "\w") == 0 
                startTime -= 0.02
                numOfIntervalOfintervalToCombine = Get interval at time: .fromNumOfTier, startTime
                labelOfIntervalToCombine$ = Get label of interval: .fromNumOfTier, numOfIntervalOfintervalToCombine
            endif 
            textToSet$ = label$ + "_" + labelOfIntervalToCombine$
            appendInfoLine: "combining texts... ", "Found: ", label$, " and ", labelOfIntervalToCombine$, " -> ", textToSet$
            Set interval text: .toNumOfTier, numOfInterval, textToSet$

        endif

    endfor
    
endproc