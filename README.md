# FUNNELS ANALYSIS USING SYNTHETIC DATASET

**Goal** 

Analyze client conversion through a website in the top three countries with the highest number of events. The analysis aims to identify areas with the highest churn and provide actionable suggestions to improve overall conversion rates.

The dataset used in this project is synthetic and created for educational purposes.

SQL queries used can be found here: ['Queries for Funnels Analysis.sql'](https://github.com/G4bij4/funnel-analysis/blob/main/Queries%20for%20Funnels%20Analysis.sql}

Funnels overview can be found here: https://docs.google.com/spreadsheets/d/1fyP16HY1hPjX6Ha2ARWsbcbtGpsjnt8K/edit?usp=sharing&ouid=107828988815417066606&rtpof=true&sd=true

## Process of the project:
1. Using SQL event dublicates were removed and 5 main events were chosen:
* first_visit - shows the very first time when client encountered our bsuiness
* view_item - shows that the client is interested in our products
* add_ to_cart - shows that the client is interested on buying
* begin_checkout - client began the checkout process, if a significant amount of clients churn on this step it can indicate, that there are problems with checkout process
* purchase - shows the final step of conversion
2. Events were aggregated using SQL in order to identify top 3 countries, which have the highest number of events and for which 3 countries further funnel analysis will be conducted.
3. Number of events for each chosen event and for each of the 3 countries were calculated using SQL, as well as events perc. drop. which was calculated in spreadsheets.

## Main analysis insights:
1. We see the most significant churn of clients during the 'view item' and 'add to cart' steps. Over all 3 countries after 'first_visit' only around 24% of clients move to the next 'view_item' step and then only around 5% of the initial users who viewed page decide to add something to their cart.
2. In all 3 countries, after the 'begin_checkout' step only roughly half of users who began checkout actualy end up purchasing.

## Suggestions for decision-making:
1. Since a significant number of clients is lost during the very first steps ('first_visit' to view_item' to 'add_to_cart') it is needed to work on marketing strategies, which should be targeted more towards the clients who have a greater potencial in being interested in buying products. Potentially, where adds are displayed could be an issue, therefore working on where ads appear could be crucial. Additionally, engaging messages/notifications/emails could be sent reminding/offering some special offers/discounts regarding the viewed items.
2. From the small number of clients who decide to begin checkout roughly half of them churn and do not purchase, this might indicate that there are also some problems regarding checkout. Further analysis could be conducted in order to find out what could be the problem (it could be beneficial to analyse by category and check for inconveniences that occur to a spesific category, as the example, maybe the display is inconvenient when using mobile).

> [!NOTE]
> In order to be able to open files, first click on the file, then if the file does not open, click "View raw".

