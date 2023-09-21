WITH monthly_ranking AS
(
SELECT card_name, issued_amount,
       RANK() OVER(PARTITION BY card_name ORDER BY issue_year,issue_month) AS month_rank
FROM monthly_cards_issued
)

SELECT card_name, issued_amount
FROM monthly_ranking
WHERE month_rank = 1
ORDER BY issued_amount DESC