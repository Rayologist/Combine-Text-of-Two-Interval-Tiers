procedure duplicateTier: .numOfTierToDuplicate, .tierName$
    numOfTiers = Get number of tiers
    tierPosition = numOfTiers + 1
    Duplicate tier: .numOfTierToDuplicate, tierPosition, .tierName$
endproc
