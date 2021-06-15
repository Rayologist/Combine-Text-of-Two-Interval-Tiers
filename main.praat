include addOffset.praat
include getMidpoint.praat
include combineText.praat
include duplicateTier.praat

clearinfo
stopwatch

tierToDuplicate = 1 
@duplicateTier: tierToDuplicate, "segment-token"

tierToAddOffset = 3
numOfTokens = Count intervals where: 2, "matches (regex)", "\w"
addAfter$ = "n"
offsetTime = 1
@addOffset: tierToAddOffset, numOfTokens, addAfter$, "end", offsetTime

from_ = 2
to_ = 3
@combineText: from_, to_

@getMidpoint: 3, "midpoint", "\w"

appendInfoLine: "Time consumed: ", fixed$(stopwatch, 3)