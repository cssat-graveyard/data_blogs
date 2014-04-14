The Movement of Foster Children in Washington State 
========================================================

The work of the foster care system has a large geographic component. At a fundamental level, foster children are moved from one location and placed in another. Ideally, children stay close to the home from which they were removed. This cannot, however, always happen. Sometimes children might have a relative or other kin who is willing to care for them in another part of the state or country. In other cases, children might be removed from a home in an area where there is a lack of licensed foster homes. 

One way to visualize the extent to which children stay close to their homes is with a network map. Paul Butler, an intern at Facebook, did the same thing with [Facebook connections](https://www.facebook.com/notes/facebook-engineering/visualizing-friendships/469716398919) in 2010. We can take this same approach and apply it to the movement of foster children in Washington State. In our case, instead of plotting the connections between Facebook friends, we are plotting the original location and current location for foster children in Washington State. 














The map below displays the movements of all children placed in out-of-home care in Washington State on January 1, 2014. The map displays a network of connections between the original location from which a child was removed and the location in which they were placed as of January 1. 



<img src="C:/Users/mienkoja/Dropbox/movement_blog/figure/map.png" alt="Network" style="width: 750px;"/>

The map shows that most of the movement activity is taking place in urban centers. This could be due to the fact that, within these urban centers, there are large numbers of children moving relatively short distances. It could also be due to the fact that large numbers of children are entering or leaving these urban centers. Whatever the case, at least some children have made relatively long moves (e.g. from Seattle to Spokane or vice versa). 

In order to get a better sense of how these movements cluster in different parts of the state, it is helpful to examine what this network might look from a different dimension. One technique that might be helpful to examine these clusters is through the use of an arc diagram. Arc diagrams have been around for decades but were made popular by [Martin Wattenberg](http://www.bewitched.com/index.html), a former data scientist at IBM who used arc diagrams to map complex sentence structure. 

In this chart, we plot a series of points representing every zip code in the State of Washington from which children were removed (or in which children were placed on January 1). We order the points from West to East for ease of comparison with the network map. Next, we draw a series of arcs between each point. For pairs of zip codes which have multiple transitions, we increase the thickness of the arc (i.e. an arc with 5 transitions will be 5 times as thick as an arc with 1 transition). 







<img src="C:/Users/mienkoja/Dropbox/movement_blog/figure/arcplot.png" alt="Arc Diagram" width="600" height="480"/>

The darker areas of the arc plot shows us that, while there is certainly movement activity taking place _across_ the state, much of the _within_ urban centers. In particular, we see that many of the arcs hover right around the Seattle zip codes (i.e. the I-5 corridor). 

To examine this pattern further, we can do a simple plot the pattern of movements between various zip codes as shown below. 



<img src="C:/Users/mienkoja/Dropbox/movement_blog/figure/zip_to_zip.png" alt="Zip to Zip Plot" width="600" height="480"/>

In this plot, we again rank zip codes from east to west and plot a point on the chart for each movement taking place between the zip codes. Those points on the chart representing multiple movements (i.e. multiple children moving from one zip code to another), are plotted darker than those will smaller numbers or movements.  As suggested in the arc plot, most of the movements are taking place _within_ urban centers. Does this mean that children removed from urban centers are less likely to be moved over larger distances than children from more rural areas?



To answer this question, it is first useful to figure out what we might _expect_ to see for a distance between a child's current location and their original removal location. One way of figuring this out is to calculate a median. The median value of the distance between removal location and current location for all children in care on January 1 is 23.95 miles. In other words _most_ children are placed relatively close to their homes. This is illustrated in the histogram below where we plot a vertical line at our median value. _Half_ of the child distances in our sample are to the left of this line. 



<img src="C:/Users/mienkoja/Dropbox/movement_blog/figure/hist.png" alt="Distance Histogram" width="600" height="480"/>

Using this information, we can plot a map of all zip codes in the state and color them based on whether or not children from this zip code tend have moved more or less than the median value.



<img src="C:/Users/mienkoja/Dropbox/movement_blog/figure/map2.png" alt="Distance" width="600" height="480"/>


As we suspected, it does appear that children removed from urban zip codes tend to have smaller movement distances than children removed from more rural zip codes. There are, however, several urban zip codes where children do have longer movement distances. 


There are several reasons why children removed from certain geographic regions might tend to be placed further away from their removal locations than others. Perhaps the simplest explanation is a tendency for rural areas to have a higher average distance between residences than urban areas (i.e. things are just more spread out in rural areas). Another possibility is that there may be a smaller number of foster homes available for children removed in a particular zip code. (e.g. the closest available foster home for a child removed from Colville may be in Spokane). 

Future research by POC and future measurements in the [data portal](partnersforourchildren.org/data-portal) will examine these possibilities with more detailed analysis. 



