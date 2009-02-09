package com.soaringeagleco.swoop.util;

import java.util.GregorianCalendar;
import java.util.Calendar;
import java.util.Date;

public class DateUtils
{
    public static Date moveTimeToMax(Date inDate)
    {
        Calendar cal = new GregorianCalendar();
        cal.setTime(inDate);
        cal.set(Calendar.HOUR, 23);
        cal.set(Calendar.MINUTE, 59);
        return cal.getTime();
    }

    public static Date moveTimeToMin(Date inDate)
    {
        Calendar cal = new GregorianCalendar();
        cal.setTime(inDate);
        cal.set(Calendar.HOUR, 0);
        cal.set(Calendar.MINUTE, 0);
        return cal.getTime();
    }
}
