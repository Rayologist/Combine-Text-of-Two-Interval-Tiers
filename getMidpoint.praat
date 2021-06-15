procedure insertPointTier: .tierName$
    numOfTiers = Get number of tiers
    .numOfTargetTier = numOfTiers + 1
    Insert point tier: .numOfTargetTier, .tierName$
endproc


procedure getMidpoint: .numOfTargetTier, .tierName$, .regexPattern$
    @insertPointTier: .tierName$
    numOfIntervals = Get number of intervals: .numOfTargetTier
    count = 1
    for iInterval from 1 to numOfIntervals
        label$ = Get label of interval: .numOfTargetTier, iInterval
        if index_regex(label$, .regexPattern$)

            start = Get start time of interval: .numOfTargetTier, iInterval
            end = Get end time of interval: .numOfTargetTier, iInterval
            midpoint = (start + end) / 2

            .midpoints[count] = midpoint
            count += 1

            Insert point: insertPointTier.numOfTargetTier, midpoint, label$
        endif

    endfor

endproc
