procedure insertBoundaryAndAddText: .numOfTier, .atTime, .textToSet$
    Insert boundary: .numOfTier, .atTime
    numOfIntervalToAddText = Get interval at time: .numOfTier, .atTime - 0.1
    Set interval text: .numOfTier, numOfIntervalToAddText, .textToSet$
endproc


procedure addOffset: .numOfTier, .numOfToken, .afterWhichWordPattern$, .textToSet$, .offsetTime
    numOfIntervals = Get number of intervals: .numOfTier
    timeToSetBoundary# = zero#(.numOfToken)
    count = 1
    for numOfInterval from 1 to numOfIntervals
        label$ = Get label of interval: .numOfTier, numOfInterval
        if index_regex(label$, .afterWhichWordPattern$)
            endTime = Get end time of interval: .numOfTier, numOfInterval
            timeToSetBoundary#[count] = endTime + .offsetTime
            count += 1
        endif

    endfor

    for i from 1 to size(timeToSetBoundary#)

        appendInfoLine: "adding offset... ", i, " / ", size(timeToSetBoundary#), ": ", timeToSetBoundary#[i]
        @insertBoundaryAndAddText: .numOfTier, timeToSetBoundary#[i], .textToSet$

    endfor

    
endproc