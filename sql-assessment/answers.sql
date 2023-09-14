# Queries were written in the Google BigQuery SQL editor
# Question 1.
SELECT DATE_TRUNC(date, DAY), SUM(impressions) FROM marketing_performance GROUP BY DATE_TRUNC(date, DAY) ORDER BY SUM(impressions) DESC;
# Returns the day and the sum of impressions on that day in descending order by total impressions.

# Question 2.
SELECT state, SUM(revenue) FROM website_revenue GROUP BY state ORDER BY SUM(revenue) DESC LIMIT 3;
# Returns the state and its total generated revenue. The third best state was Ohio and it generated $37,577,000 in revenue.

# Question 3.
SELECT mp.campaign_id, SUM(cost), SUM(impressions), SUM(clicks), SUM(revenue) FROM marketing_performance AS mp INNER JOIN website_revenue AS wr ON mp.campaign_id = wr.campaign_id GROUP BY mp.campaign_id;
# Returns campaign_id, total cost, impressions, clicks, and revenue for each campaign.

# Question 4. It is not clear from the problem statement which campaign_id is `Campaign5'. I assume it is campaign_id 99058240 and solved this question for campaign_id 99058240.
SELECT geo, SUM(conversions) FROM marketing_performance WHERE campaign_id = 99058240 GROUP BY geo ORDER BY SUM(conversions) DESC;
# Returns the total number of conversions from conversions of Campaign5 by state. The state that generated the most conversions for this campaign was Georgia.

# Question 5. For this question, I decided to measure a campaign's efficiency as the number of conversions for each $1000 spent on the campaign. Running the query below:
SELECT campaign_id, SUM(conversions)/sum(cost) FROM marketing_performance GROUP BY campaign_id ORDER BY SUM(conversions)/sum(cost) DESC;
# we see that the most efficient campaign in terms of the number of conversions per $1000 spent was campaign_id 86363015, which had approximately 2.3 conversions per $1000 spent.

# Question 6. For this question, I once again interpret "best" to mean the day of the week which results in the highest number of conversions per $1000 spent. Running the query below:
SELECT EXTRACT(DAYOFWEEK FROM date), SUM(conversions)/sum(cost) FROM marketing_performance GROUP BY EXTRACT(DAYOFWEEK FROM date) ORDER BY SUM(conversions)/sum(cost) DESC;
# we see that the best day to run ads in terms of the number of conversions per $1000 spent was Wednesday (day 4 of the week starting from Sunday).
