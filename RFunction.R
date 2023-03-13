
library('move2')
library('tidyverse')
library('lubridate')

## The parameter "data" is reserved for the data object passed on from the previous app

## to display messages to the user in the log file of the App in MoveApps one can use the function from the logger.R file: 
# logger.fatal(), logger.error(), logger.warn(), logger.info(), logger.debug(), logger.trace()

rFunction = function(data, yrjn=FALSE, itv=NULL) {
  
  if (yrjn==TRUE)
  {
    logger.info("For daily, weekly or monthly splits, the data will be merged over years.")
    data <- data %>% mutate(year = year(timestamp),
                                   day=yday(timestamp),
                                   week = week(timestamp),
                                   month = month(timestamp))
  } else
  {
    logger.info("For daily, weekly or monthly splits, the data will not be merged over years, but kept sepeartly.")
    data <- data %>% mutate(year = year(timestamp),
                                   day=paste(year, yday(timestamp), sep="-"),
                                   week = paste(year, week(timestamp), sep="-"),
                                   month = paste(year, month(timestamp), sep="-"))
  }
  
  if (is.null(itv)) itv <- "null"

  if (itv %in% c("day","week","month","year"))
  {
    logger.info(paste0("Your data were split by ",itv,"."))
    eval(parse(text=paste0("mt_track_id(data) <- paste(mt_track_id(data),data$",itv,",sep='-')")))
    data.split <- split(data,mt_track_id(data))
    result <- mt_stack(data.split)
  } else
  {
      logger.info("No valid split interval provided. Input data are returned.")
      result <- data
  }
    
 return(result) 
}
