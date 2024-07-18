//Task:
//Your task is to write a function which formats a duration, given as a number of seconds, in a human-friendly way.
//
//---
//This is the function declaration :
//func formatDuration(_ seconds: Int) -> String {
//  //complete this function
//}
//---
//
//The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.
//For the purpose of this task, a year is 365 days and a day is 24 hours.
//Note that spaces are important.
//
//
//Detailed rules
//The resulting expression is made of components like 4 seconds, 1 year, etc. In general, a positive integer and one of the valid units of time, separated by a space. The unit of time is used in plural if the integer is greater than 1.
//
//The components are separated by a comma and a space (", "). Except the last component, which is separated by " and ", just like it would be written in English.
//
//A more significant units of time will occur before than a least significant one. Therefore, 1 second and 1 year is not correct, but 1 year and 1 second is.
//
//Different components have different unit of times. So there is not repeated units like in 5 seconds and 1 second.
//
//A component will not appear at all if its value happens to be zero. Hence, 1 minute and 0 seconds is not valid, but it should be just 1 minute.
//
//A unit of time must be used “as much as possible”. It means that the function should not return 61 seconds, but 1 minute and 1 second instead. Formally, the duration specified by of a component must not be greater than any valid more significant unit of time.
//
//
//
//It is much easier to understand with an example:
//* For seconds = 62, your function should return
//    "1 minute and 2 seconds"
//* For seconds = 3662, your function should return
//    "1 hour, 1 minute and 2 seconds"
//    
//  _______________


// for reference years, days, hours, minutes and seconds.


func formatDuration(_ seconds: Int) -> String {
    var output = ""
    
    var secondsInADay = 60 * 60 * 24
    
    var numberOfDays = (seconds / secondsInADay)
    var leftOutSeconds = (seconds % secondsInADay)
    
    var hours = leftOutSeconds / (60 * 60)
    var secondsLeft = leftOutSeconds % (60 * 60)
    
    var minute = secondsLeft / 60
    var seconds = secondsLeft % 60
    
    
    var years = numberOfDays / 365
    var leftOutDays = numberOfDays % 365
    
    if years > 0 {
        if years == 1 {
            output += "\(years) year"
        } else {
            output += "\(years) years"
        }
    }
    
    if leftOutDays > 0 {
        var seperator = ""
        
        if output != "" && hours == 0 && minute == 0 && seconds == 0 {
            seperator = " and "
        } else if output == "" {
            seperator = ""
        } else {
            seperator = ", "
        }
        
        
        if leftOutDays == 1 {
            output += "\(seperator)\(leftOutDays) day"
        } else {
            output += "\(seperator)\(leftOutDays) days"
        }
    }
    
    if hours > 0 {
        var seperator = ""
        if output != "" && minute == 0 && seconds == 0 {
            seperator = " and "
        } else if output == "" {
            seperator = ""
        } else {
            seperator = ", "
        }
        
        if hours == 1 {
            output += "\(seperator)\(hours) hour"
        } else {
            output += "\(seperator)\(hours) hours"
        }
    }
    
    if minute > 0 {
        
        var seperator = ""
        
        if output != "" && seconds == 0 {
            seperator = " and "
        } else if output == "" {
            seperator = ""
        } else {
            seperator = ", "
        }
        
        if minute == 1 {
            output += "\(seperator)\(minute) minute"
        } else {
            output += "\(seperator)\(minute) minutes"
        }
    }
    
    if seconds > 0 {
        
        var seperator = ""
        
        if output != "" {
            seperator = " and "
        }
        
        if seconds == 1 {
            output += "\(seperator)\(seconds) second"
        } else {
            output += "\(seperator)\(seconds) seconds"
        }
    }
    
    return output
}

print(formatDuration(31539961))
