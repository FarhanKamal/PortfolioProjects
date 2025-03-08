# Project Background 

OYO Hotels is a global hospitality chain that operates in the budget and mid-range hotel segments. Founded in 2013, the company has rapidly expanded its presence across numerous countries, leveraging technology to disrupt the traditional hotel industry. 
 
The company hinges on leveraging data to optimize pricing, personalize guest experiences, improve operational efficiency, and identify new growth opportunities. Analyzing trends in these key metrics, understanding customer behavior, and identifying market opportunities are critical for the company's continued growth and success. 

Insights and recommendations are provided on the following key areas: 

- **Revenue Trends Analysis:** Evaluation of historical revenue patterns in the span of 3 months in the major cities in India, focusing on RevPAR, ADR and Occupancy %. 

- **Hotel Property Performance:** An analysis of OYO’s various hotel properties in India, understanding what KPIs that needs to be improved upon. 

- **Booking Platform Conversion:** An assessment of booking platforms conversions through all hotel properties in India. 

- **Weekday/Weekend Comparisons:** An evaluation of occupancy and booking between weekdays and weekends on a weekly basis. 

  

The data queries used to inspect and clean the data for this analysis can be found in this file [here.](https://netorgft9479935-my.sharepoint.com/:x:/g/personal/contact_oddacityboi_com/EeGgt00baS1EpnysWGkvoBABzQPLHHdKi0qSnbXhJXAZAw?rtime=HXbFq2xe3Ug) 

  

SQL queries of Calculated Fields regarding various business metrics can be found [here.](https://onedrive.live.com/:w:/g/personal/7F164C9FD467EE42/EQ_HjXPaGsdGklVZJO8eGDYBCaFEMHe3WzOkaIupvn-88A?resid=7F164C9FD467EE42!s738dc70f1ada46c792555924ef1e1836&ithint=file%2Cdocx&e=cVcpBL&migratedtospo=true&redeem=aHR0cHM6Ly8xZHJ2Lm1zL3cvYy83ZjE2NGM5ZmQ0NjdlZTQyL0VRX0hqWFBhR3NkR2tsVlpKTzhlR0RZQkNhRkVNSGUzV3pPa2FJdXB2bi04OEE_ZT1jVmNwQkw) 

  

An interactive PowerBI dashboard used to report and explore revenue trends can be found [here.](https://app.powerbi.com/view?r=eyJrIjoiMDYxMWJkYTItZjVlZS00NDQ0LWI3ZWEtOTM5Zjg1YTY3NWMwIiwidCI6IjliYWU4ZjAzLWM4NTktNDU5My05NzJjLWYzMmRjNGY5NTI2ZiJ9) 

# Data Structure & Initial Checks 

  

OYO Hotels’ database structure as seen below consists of five tables: dim_hotels, fact_bookings, dim_rooms, fact_aggregated_bookings and dim_date, with a total row count of 143,911 records.  

![Data Models Tables](https://github.com/user-attachments/assets/42cbd2b3-0340-4c81-945d-7acf5819be4f)

# Executive Summary 

### Overview of Findings 

As we look into the numbers during the second quarter of OYO Hotels in India, we can see the overall revenue has been steadily decreasing just a little bit regardless of many upticks it had in some weeks. In the past 3 months, the key performance indicators show the following metrics: RevPAR decreased by 13%, ADR increased by 1.5% and Occupancy Percentage decreased by 10.98%. Even though India's OYO Hotels have made $1.69 billion dollars on the second quarter, there are opportunities to further improve our booking sales for potential guests for the rest of the year.   

 

Below is the overview page from the PowerBI dashboard and more examples are included throughout the report. The entire interactive dashboard can be viewed [here.](https://app.powerbi.com/view?r=eyJrIjoiMDYxMWJkYTItZjVlZS00NDQ0LWI3ZWEtOTM5Zjg1YTY3NWMwIiwidCI6IjliYWU4ZjAzLWM4NTktNDU5My05NzJjLWYzMmRjNGY5NTI2ZiJ9) 

![Overall Dashboard](https://github.com/user-attachments/assets/b14108d1-ce1b-4c6e-8ced-4953402667a6)


# Insights Deep Dive 

### Revenue Trends: 

- **Out of the 13 weeks OYO Hotels in India from Week 19 – Week 31, 8 weeks OYO Hotels made about 140 million dollars while the other 5 weeks OYO Hotels made about 115 million dollars.** Even though revenue has been inconsistent week by week this quarter, this has been an uptick in overall profit. 

 

- OYO Hotels in India’s Revenue per available rooms (RevPAR) also have a similar trend to the overall revenue week by week since they are closely linked to how many rooms they manage to sell. **There has been 8 weeks OYO Hotels had about 17,000 rooms that were being sold while the other 5 weeks OYO Hotels had about 13,500 rooms that were being sold.** 

 

- The occupancy percentage also have a similar trend to the revenue and RevPAR of OYO Hotels in India. **There has been 8 weeks OYO Hotels had about a 63.48% occupancy of their hotels while the other 5 weeks OYO Hotels had about a 52.38% occupancy of their hotels.** Even though OYO Hotels isn’t fully booked, this suggests that their business is subject to variations in customer traffic, likely due to seasonal factors, local events, or day-of-week patterns. 

  

- Unlike the previous key performance indicators, the average daily rate (ADR) doesn’t follow the similar trend. **Over the 13 weeks, the ADR was about $12,700 consistently week by week.** Even though the number of people staying at OYO hotels might go up and down, the price they charge for a room stays about the same. 

![Revenue Trends Dashboard](https://github.com/user-attachments/assets/a621a145-d214-41fb-8671-5b6ea0e02c2b)

### Hotel Performance: 

- **The top 5 hotel properties out of the 25 made a total revenue of $485 million, which makes up 30% of the total revenue OYO Hotel in India made.** The ranking of the top 5 performing hotel properties are:  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Atliq Exotica in Mumbai - $117m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Atliq Palace in Mumbai - $100m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. Atliq Exotica in Mumbai - $93m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. Atliq Palace in Delhi - $88m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. Atliq City in Mumbai - $87m 

   

- **The bottom 5 hotel properties out of the 25 made a total revenue of $224 million, which makes up 13% of the total revenue OYO Hotel in India made.** The ranking of the bottom 5 performing hotel properties are:  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Atliq Bay in Mumbai - $51m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Atliq Exotica in Hyderabad - $47m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. Atliq Grands in Hyderabad - $46m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. Atliq Palace in Hyderabad - $44m 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. Atliq Grands in Delhi - $36m 

   

- **About half of the OYO Hotel properties (48% specifically) have at least a 4.25 out of 5 rating, 36% have a 3.00-3.10 out of 5 rating and the rest (16%) of the hotel properties have a 2.3-2.4 out of 5 rating.**  

  

- **OYO Hotel properties with a higher rating (4.25+ out of 5) have an occupancy percentage of around 66%. Properties with a decent rating (3 out of 5) have about a 53% occupancy. Finally, properties with a low rating (less than 2.4 out of 5) have around a 44.5% occupancy rate.** 

![Hotel Performance Dashboard](https://github.com/user-attachments/assets/4cf376b1-89fc-4d17-a39e-d8796db53863)

### Booking Platform: 

- **Overall, OYO Hotels in India are being booked the most through direct offline with an ADR of $12,793.76. Otherwise, the most booked online platform is Tripster is an ADR of $12,778.28.** 

   

- **Bangalore and Hyderabad were booked the most thru offline with the ADR of $13,270.06 and $9,462.61, respectively.** 

 
- Delhi and Mumbai have been booked the most offline and through Tripster. **Delhi has an ADR of $12,265.06 for direct offline and $12,267.64 for Tripster. Mumbai has an ADR of $15,493.43 for direct offline and $15,489.52 for Tripster.** 

 

- **Direct online booking platform is the least used with an ADR of $12,638.15 overall for OYO Hotels in India.** 

![Booking Platform Dashboard](https://github.com/user-attachments/assets/5066bc26-080f-4f9f-9be2-9cc2d00c0931)


### Weekend/Weekday Comparison: 

- **OYO Hotels made an estimated total of $524m over the weekends in the span of 13 weeks, which is an average of $40.3m per weekend. On the other hand, the company made an estimated total of $1.17b in the span of 13 weeks, which is an average of $89.6m per week.** This is shows that the company makes most of their revenue over the weekdays than the weekends, however we do have to keep it mind that there are more days in the weekday than the weekends. 

   

- When you look at the other KPIs, OYO Hotels are more profitable during the weekends than the weekdays. **The total RevPAR in the weekends is $103.3k, averaging about $8k per weekend, while in the weekdays is $92.1k, averaging about $7.08k.** 

 

- We can look even further in the occupancy percentage between the weekends and weekdays. **During the weekends on average, the hotel properties that OYO Hotels owned are about 62.6% occupied. During the weekdays, however, the average occupancy rate is 55.85%.** 

 

- The only KPI that remains unchanged of the weekday/weekend metrics is the ADR for the most part. **The ADR on average for both weekend and weekday are $12.7k.**



![Weekend Weekday Comparison Dashboard](https://github.com/user-attachments/assets/958ed949-5675-46d6-891d-d16a272c9257)

# Recommendations: 

**Based on the insights and findings above, we would recommend the OYO Hotel Team to consider the following:**  

  

- While the ADR is consistent at $12.7k, OYO Hotels is missing out on potential revenue during high-demand periods. **Introduce dynamic pricing algorithms that adjust room rates based on factors like seasonality, local events and festivals, day of the week, and real-time demand.** This will allow OYO to capture higher revenue during peak times while remaining competitive during slower periods.  

   

- Even though OYO Hotels are doing well when it comes to getting booked directly from them offline, we can put more effort for guests to book through our website (direct online). A suggestion we could do to **encourage guest to visit the hotels’ website is to run advertisements for budget-friendly travelers and provide them discounts/promotions once they book a room with an OYO hotel property.** This keeps in mind that it will avoid any SEO-related issues when it comes to pricing among other booking platforms.  

 

- Looking that the poorly-rated hotel properties, we can **improve the customer experience on these hotels and improve any needed renovations to encourage guest to come book with them with the expectations they have in mind.** This will indirectly improve the occupancy rate and RevPAR of the hotels if we can increase their ratings to at least 3.0 out of 5. 

 

- Identify and target specific customer segments with tailored offerings between business and luxury hotels. For example, **since about 60% of all the OYO Hotels in India are luxury hotels, each property should emphasize high-end design, exceptional service, opulent amenities, and a more indulgent experience with features like gourmet dining, spas, and personalized attention to detail.**   

 

- With that being said, you still don’t want to neglect **the business hotels since that is about 40% of the OYO Hotels in India.**  They should **prioritize amenities and services designed for professional travelers, focusing on work productivity with features like well-equipped business centers, convenient locations near offices, and reliable internet access.**


# Assumptions and Caveats: 

**Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below**: 

  

**Assumption 1: The data I was able to analysis only spans from May 24, 2022 to July 24, 2022 (3 months or 13 weeks).** So, the data I am analyzing is only a vacuum as it doesn’t reflect how OYO Hotels in India performs the past months, quarters or year. 

 

**Assumption 2:** The hospitality industry has it’s busy and slow seasons throughout the year, like we have here in the United States of America. With that being said, we should **keep in mind that India hotels’ busy and slow seasons may be completely different than the hotels here in America, since both countries have different seasonality, holidays and real-time demand.** 

 

**Assumption 3:** This is the data given by the revenue manager of OYO Hotels in India. **This is just one aspect of the data he has gathered and I’ve analyzed, while there could be a lot of other people who could be working other aspects of data in OYO Hotels like sales manager, food & beverages, marketing, etc.** In other words, the data we were given only shows a part of the bigger picture and not the whole picture. 
