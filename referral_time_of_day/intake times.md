Referral Timing
========================================================

Every CPS investigation assessment begins with a referral (also called an intake),
where someone reports child abuse or neglect to Children's Administration.
(Instructions for filing a report are on [Children's Administration's website](http://www.dshs.wa.gov/ca/safety/abusereport.asp?2).)
Generally, a little over half of these referrals are "screened in" for additional
services, almost always an investigation or assessment.
Some allegations of child abuse or neglect are founded, some are not; either way Children's Administration
proceeds with each case according to the situation.

In this blog entry we explore the time of day that these referrals come in, and explore relationships between
the types of cases that come in at different times.








For this blog entry, we'll examine all the referrals from 2013, the most recent year we have complete data for.
In 2013, CA received over 100,500 referrals, of which 
52% were screened in for some type of investigation or assessment, which could include a CPS investigation or other assessments.

Let's take a look at the time of day that these come in. For this first graph, we'll draw the graph in two ways: first as a normal bar graph, and second as a radial bar graph. Both graphs show the same information; there's one bar for each hour, and the length of the bar shows how many referrals were made in that hour. We're used to seeing bar graphs, but in this case they have the disadvantage of edges. Hours are circular, with midnight being next to both 11 pm and 1 am. The radial bar graph takes the regular bar graph and wraps it in a circle so that midnight can next to both 11 pm and 1 am, which helps us see the overall patterns.

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


There's no real surprises in the above graphic (except for maybe the little dip during the lunch hour).
Almost all referrals come in during the day time, with the peak from 2-4 o'clock.
School days are winding down at that point in the afternoon, and educators are one of biggest sources of referrals.
Maybe educators are driving the afternoon bump?
Let's compare them with another commmon source of referrals: law enforcement officers. We might expect them to report a larger number of intakes at night.

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


Sure enough, the educators contributed over 2,000 referrals to each of the 2:00 and 3:00 hours, and have no visible activity at night. Law enforcement officers, on the other hand, are relatively active at night (considering how few night referrals there are over all), but have their peak times at the start of the work day, between 8 and 11 o'clock. We can speculate that this is when paperwork gets filed from the previous night's cases.

All these raw numbers are making the evening and night hard to see on our graphs.
Although few cases come in at night, those that do might tend to be more severe.
For our last visuals, we'll look at percents: the percent of cases that are screened in for additional investigations and assessments.

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 


Things look a lot more even here between day and night, and indeed after about 9 pm the percentage of referrals screened in goes well above the 50% line, with peak times between 1 and 4 am.

Our last graph will be similar, but we'll look at whether referrals end up with a founded allegation of child abuse or neglect. Only 5% of referrals overall result in a founded allegation. However, for this graph instead of all referrals we'll consider only those that were screened in for a CPS investigation, excluding those that are just risk assessments or become joint ventures with the Department of Licensing Resources.

Even among these referrals that get CPS investigations, the percentage that end up with a substantiated allegation is quite low at 6%, but let's look at how that varies by the time of the referral:

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


This has just been a quick look at the time of days of referrals and we can't draw any strong conclusions, but it definitely tells us that nighttime and daytime referrals are different. The vast majority of referrals happen during the day, but the late night referrals are more likely to be screened in and to result in a founded allegation of child abuse or neglect.

Of course, time of day isn't the only interesting time variable, in a future blog post we'll take a look at different days of the week (what's the effect of weekends?), holidays, and school vacations.
