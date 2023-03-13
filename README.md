# Split by Time Interval

MoveApps

Github repository: *github.com/movestore/Split-by-Time-Interval*

## Description
Splits your data set by year, month, week or Julian day to be analysed as separate tracks in further Apps. Possible to join time intervals over years or not.

## Documentation
This App appends to the data the attributes year, month, week and Julian day. According to the selection of the user, the data set will then be split into separate tracks by individual and year, month, week or day. It is possible to select that the intervals will be joined over years, which makes sense if one wants ot explore general differences between seasons. For general time adaptation processes this might not be sensible.

### Input data
move2 location object

### Output data
move2 location object

### Artefacts
none.

### Settings 
 `Radius of resting site` (radius): Defined radius the animal has to stay in for a given duration of time for it to be considered resting site. Unit: `metres`.

### Most common errors
none yet.

### Null or error handling
*Please indicate for each setting as well as the input data which behaviour the App is supposed to show in case of errors or NULL values/input. Please also add notes of possible errors that can happen if settings/parameters are improperly set and any other important information that you find the user should be aware of.*

*Example:* **Setting `radius`:** If no radius AND no duration are given, the input data set is returned with a warning. If no radius is given (NULL), but a duration is defined then a default radius of 1000m = 1km is set. 
