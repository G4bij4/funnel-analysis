WITH filtered_timestamp AS ( -- solving events dublicates problem
  SELECT MIN (event_timestamp) AS event_timestamp,
         event_name,
         user_pseudo_id
  FROM `turing_data_analytics.raw_events`
  GROUP BY event_name, user_pseudo_id 
),
unique_table AS ( -- creating a unique events table
SELECT parse_date ('%Y%m%d', raw_events.event_date) AS event_date,
       TIMESTAMP_MICROS (filtered_timestamp.event_timestamp) AS event_timestamp,
       filtered_timestamp.event_name,
       raw_events.event_value_in_usd,
       raw_events.user_id,
       filtered_timestamp.user_pseudo_id,
       raw_events.user_first_touch_timestamp,
       raw_events.category,
       raw_events.mobile_model_name,
       raw_events.mobile_brand_name,
       operating_system,
       raw_events.language,
       is_limited_ad_tracking,
       browser,
       browser_version,
       country,
       medium,
       name,
       traffic_source,
       platform,
       total_item_quantity,
       purchase_revenue_in_usd,
       refund_value_in_usd,
       shipping_value_in_usd,
       tax_value_in_usd,
       transaction_id,
       page_title,
       page_location,
       raw_events.source,
       page_referrer,
       campaign
FROM filtered_timestamp
LEFT JOIN turing_data_analytics.raw_events AS raw_events
 ON 
  filtered_timestamp.event_name = raw_events.event_name AND 
  filtered_timestamp.user_pseudo_id = raw_events.user_pseudo_id AND 
  filtered_timestamp.event_timestamp = raw_events.event_timestamp
)

--validating that there are only unique events
SELECT 
    event_name, 
    user_pseudo_id, 
    COUNT(*) AS event_count
FROM unique_table
GROUP BY event_name, user_pseudo_id
HAVING COUNT(*) > 1;
--no rows were returned, means there are no duplicates

-- aggregating events to find top 3 countries
SELECT country,
       COUNT (event_name) AS number_of_total_events 
FROM unique_table
WHERE event_name = 'first_visit' OR event_name = 'view_item' OR event_name = 'add_to_cart' OR event_name = 'begin_checkout' OR event_name = 'purchase'
GROUP BY country
ORDER BY COUNT (event_name) DESC
LIMIT 3;

-- creating final table (perc drop is calculated in spreadsheets)
SELECT CASE 
          WHEN event_name = 'first_visit' THEN 1
          WHEN event_name = 'view_item' THEN 2
          WHEN event_name = 'add_to_cart' THEN 3
          WHEN event_name = 'begin_checkout' THEN 4
          WHEN event_name = 'purchase' THEN 5 END AS event_order,
       event_name,
       COUNT (country) AS all_events,
       COUNTIF(country = 'United States') AS `United State events`,
       COUNTIF(country = 'India') AS `India events`,
       COUNTIF(country = 'Canada') AS `Canada events`
FROM unique_table
WHERE event_name IN ('first_visit', 'view_item', 'add_to_cart', 'begin_checkout', 'purchase')
  AND country IN ('United States', 'India', 'Canada')
GROUP BY event_name, event_order
ORDER BY event_order