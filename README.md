# FUNNELS ANALYSIS USING SYNTHETIC DATASET
## Project Overview
This project analyzes **user conversion through a website funnel** to identify drop-off points and churn drivers. The analysis focuses on the **top three countries with the highest number of events** and aims to provide actionable recommendations to improve overall conversion rates.

The dataset used is synthetic and created for educational purposes.

## Tools Used
* **SQL** - data cleaning, aggregation, and funnel construction.
* **Google Sheets** - percentage drop-off calculations and funnel visualization.

## Project Workflow
1. Event Preparation
Using SQL:
* Removed duplicate events
* Defined the following five funnel stages:
  * first_visit – first interaction with the website.
  * view_item – product interest.
  * add_to_cart – purchase intent.
  * begin_checkout – checkout initiation.
  * purchase – completed conversion.
2. Funnel Construction
* Aggregated event data to identify the top three countries by total events.
* Calculated the number of users reaching each funnel stage per country.
* Computed percentage drop-offs between stages.

## Key Findings
* The largest drop-off occurs between first_visit and view_item:
  * Only ~24% of users proceed beyond the first visit.
* A further significant churn occurs between view_item and add_to_cart:
  * Only ~5% of initial users add items to the cart.
* Across all three countries, only about half of users who begin checkout complete a purchase.

## Business Recommendations
* Improve early stage targeting by refining marketing strategies to reach users with higher purchase intent.
* Review ad placement and messaging to better align with user interests.
* Use follow-up communication (emails, notifications, reminders) for users who viewed products but did not add them to the cart.
* Investigate checkout friction, especially for users who abandon during checkout.
* Perform deeper analysis by device type or product category to identify specific usability issues (e.g. mobile checkout experience).

## Files
* SQL Queries ['Queries for Funnels Analysis.sql'](https://github.com/G4bij4/funnel-analysis/blob/main/Queries%20for%20Funnels%20Analysis.sql})
* Funnels Overview https://docs.google.com/spreadsheets/d/1fyP16HY1hPjX6Ha2ARWsbcbtGpsjnt8K/edit?usp=sharing&ouid=107828988815417066606&rtpof=true&sd=true


> [!NOTE]
> In order to be able to open files, first click on the file, then if the file does not open, click "View raw".
